#!/bin/bash

# ------------------------------------------------------------------------------
# File: enhance-dns-sync.sh
# Project: AmazonSES-EnhanceDNS
# Version: 0.9.0-beta
# Author: Matthew Murphy (matthewxmurphy)
# License: MIT License
# Repository: https://github.com/matthewxmurphy/AmazonSES-EnhanceDNS
# Description:
#   Automates Amazon SES DKIM, DMARC, and SPF DNS record injection into Enhance DNS Role servers.
#   Dynamically fetches Enhance zones and DNS servers via API, processes all DKIM/DMARC records in ./csv directory.
# ------------------------------------------------------------------------------

# --- Configuration ---
CONFIG_DIR="config"
CONFIG_FILE="$CONFIG_DIR/enhance.conf"
CSV_DIR="csv"

# Default fallback values
DEFAULT_TTL=300
DEFAULT_TOKEN="your-api-token-here"

# Ensure config directory and file exist
if [[ ! -d "$CONFIG_DIR" ]]; then
  echo "Creating config directory..."
  mkdir -p "$CONFIG_DIR"
fi

if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "Creating example config file..."
  echo "API_TOKEN=$DEFAULT_TOKEN" > "$CONFIG_FILE"
  echo "TTL=$DEFAULT_TTL" >> "$CONFIG_FILE"
  echo "Edit $CONFIG_FILE to configure your Enhance API token and TTL."
  exit 0
fi

# Load config variables
source "$CONFIG_FILE"

# --- Auto-detect Enhance API URL ---
ENHANCE_API_URL="https://localhost"
STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$ENHANCE_API_URL/api/v1/status" -H "Authorization: Bearer $API_TOKEN")

if [[ "$STATUS_CODE" != "200" ]]; then
  SELF_IP=$(hostname -I | awk '{print $1}')
  ENHANCE_API_URL="https://$SELF_IP"
fi

echo "Using Enhance API endpoint: $ENHANCE_API_URL"

# --- Fetch Available Zones from Enhance API ---
echo "Fetching available zones from Enhance API..."
ZONES=($(curl -s -X GET "$ENHANCE_API_URL/api/v1/dns/zones" \
-H "Authorization: Bearer $API_TOKEN" | jq -r '.[].zone'))

if [[ ${#ZONES[@]} -eq 0 ]]; then
  echo "Error: No zones found via API."
  exit 1
fi

echo "Available zones:"
select ZONE in "${ZONES[@]}"; do
  [[ -n "$ZONE" ]] && break
  echo "Invalid selection."
done

echo "Selected zone: $ZONE"

# --- Fetch DNS Role Server IPs from Enhance API ---
echo "Fetching DNS Role servers from Enhance API..."
DNS_SERVERS=($(curl -s -X GET "$ENHANCE_API_URL/api/v1/servers" \
-H "Authorization: Bearer $API_TOKEN" | jq -r '.[] | select(.roles[] | contains("dns")) | .ip'))

if [[ ${#DNS_SERVERS[@]} -eq 0 ]]; then
  echo "Error: No DNS Role servers found via API."
  exit 1
fi

echo "Found DNS servers: ${DNS_SERVERS[@]}"

# --- Prepare ./csv Directory and Example Files if Needed ---
if [[ ! -d "$CSV_DIR" ]]; then
  echo "CSV directory $CSV_DIR not found. Creating directory and adding examples..."
  mkdir -p "$CSV_DIR"
  echo "Name,Type,Value" > "$CSV_DIR/dkim-example.csv"
  echo "blv2f4afvj6bl4q7up4ovxa5hvwwn4vp._domainkey.example.$ZONE,CNAME,blv2f4afvj6bl4q7up4ovxa5hvwwn4vp.dkim.amazonses.com." >> "$CSV_DIR/dkim-example.csv"
  echo "Name,Type,Value" > "$CSV_DIR/dmarc-example.csv"
  echo "_dmarc.example.$ZONE,TXT,\"v=DMARC1; p=none;\"" >> "$CSV_DIR/dmarc-example.csv"
  echo "Name,Type,Value" > "$CSV_DIR/spf-example.csv"
  echo "$ZONE,TXT,\"v=spf1 include:amazonses.com ~all\"" >> "$CSV_DIR/spf-example.csv"
  echo "Example CSV files created. Populate $CSV_DIR with valid DKIM/DMARC/SPF CSV files and re-run."
  exit 0
fi

# --- Process All CSV Files in ./csv Directory for DKIM/DMARC/SPF Records ---
for FILE in $CSV_DIR/*.csv*; do
  [[ ! -f "$FILE" ]] && continue
  echo "\nProcessing file: $FILE"
  while IFS=, read -r NAME TYPE VALUE; do
    [[ "$NAME" == "Name" || -z "$NAME" ]] && continue
    [[ "$NAME" != *"_domainkey"* && "$NAME" != "_dmarc"* && "$TYPE" != "TXT" ]] && continue

    SHORT_NAME=$(echo "$NAME" | sed "s/\.\$ZONE
