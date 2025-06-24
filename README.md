# AmazonSES-EnhanceDNS

Automate the injection of Amazon SES DKIM, DMARC, and other email-related DNS records into Enhance DNS Role servers.

## Features
- Pulls DKIM and DMARC records from Amazon-generated CSV files
- Supports multiple Enhance DNS servers via REST API
- Configurable TTL for fast DNS propagation
- Future-proof structure for SPF, TXT, and multi-region support

## Usage

1. Place your SES-generated `dkim-dns-records.csv` and `dmarc-dns-records.csv` in the script directory.
2. Edit `enhance-dns-sync.sh`:
   - Add your Enhance API token
   - Update your Enhance DNS server IPs
3. Run:
   ```bash
   chmod +x enhance-dns-sync.sh
   ./enhance-dns-sync.sh
