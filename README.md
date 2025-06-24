# AmazonSES‑EnhanceDNS 🚀

Automate Amazon SES DKIM, DMARC, and SPF DNS record injection into Enhance DNS Role servers. 🔒✨

---

## 🔧 Features

* ✅ Automated DKIM, DMARC, and SPF record management for Enhance DNS
* 📂 CSV-based record input for easy bulk management
* 🔄 Prevents duplicate DNS records with built-in checks
* 🗺️ Auto-detects Enhance DNS servers and zones via API
* 🌐 Self-detects Enhance API endpoint (localhost or public IP fallback)
* 🛠️ Generates example config and CSV files on first run
* 🐚 Lightweight and portable Bash-based tool

---

## ⚙️ Requirements

* Enhance control panel with DNS Role servers active
* Enhance API access with valid API token
* Bash 5+, `curl`, `jq` utilities installed

---

## 🚀 Quick Start

1. Clone this repository
2. Make the script executable:

   ```bash
   chmod +x enhance-dns-sync.sh
   ```
3. Run the script:

   ```bash
   ./enhance-dns-sync.sh
   ```
4. On first run, it will:

   * 🗂️ Create `config/enhance.conf` — add your API token and TTL
   * 📁 Create a `csv/` directory with example DKIM, DMARC, and SPF CSV files
5. Edit `config/enhance.conf`:

   ```ini
   API_TOKEN=your-enhance-api-token-here
   TTL=300
   ```
6. Populate the `csv/` directory with valid DNS record CSV files
7. Re-run the script to inject records into Enhance DNS 🎯

---

## 📝 Example CSV Format

```csv
Name,Type,Value
blv2f4afvj6bl4q7up4ovxa5hvwwn4vp._domainkey.example.yourdomain.com,CNAME,blv2f4afvj6bl4q7up4ovxa5hvwwn4vp.dkim.amazonses.com.
_dmarc.example.yourdomain.com,TXT,"v=DMARC1; p=none;"
yourdomain.com,TXT,"v=spf1 include:amazonses.com ~all"
```

---

## 🏷️ Versioning

* Current Version: `0.9.0-beta`
* Production `1.0.0` planned after further testing 🛠️

---

## 🪪 License

MIT License — free to use, modify, and distribute with attribution 📜

---

## 👨‍💻 Author

Matthew Murphy (`matthewxmurphy`)
GitHub: [https://github.com/matthewxmurphy/AmazonSES-EnhanceDNS](https://github.com/matthewxmurphy/AmazonSES-EnhanceDNS)
