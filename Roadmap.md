# 📍 AmazonSES-EnhanceDNS Roadmap

This project automates Amazon SES DKIM, DMARC, SPF, and DNS record injection into Enhance DNS Role servers. Future iterations will evolve into a full DNS monitoring, compliance, and troubleshooting suite.

---

## 🎯 Current Milestones

✅ Basic shell script syncs DKIM, DMARC, and SPF records using Enhance API  
✅ Supports CSV directory for record management  
✅ First-time run interactive setup for API token and TTL  
✅ Optional Cloudflare .txt export supported (manual import required)  
✅ MIT Licensed, Open Source, Public on GitHub  

---

## 🛠️ Upcoming Features

- [ ] **Enhanced DNS Troubleshooter**  
  - Detects NS providers (Cloudflare, Enhance, etc.)  
  - Checks for SOA validity  
  - Runs iterative `dig` tests to identify missing/incorrect records  
  - Provides human-readable remediation steps  

- [ ] **Intelligent DMARC & SPF Templates**  
  - Auto-suggests compliant policies based on best practices  
  - Dynamic `admin@domain` injection based on hostname stripping logic  

- [ ] **Automated Email Account Provisioning (Enhance-only)**  
  - Ensures required emails (`report@`, `admin@`) exist  
  - Generates secure random passwords (12+ chars, upper/lower/special)  
  - Optional forwarding setup for central monitoring  

- [ ] **Full Enhance API Integration**  
  - Dynamically detects DNS Role servers, zones, records  
  - Supports record deletion, updates, and auditing via API  

- [ ] **Regional Amazon SES Expansion**  
  - Automates pulling SES records for multiple regions  
  - Ensures no manual copy-paste across regions  

- [ ] **Installation & Maintenance Enhancements**  
  - Config directory supports API token, TTL, defaults  
  - Upgrade-safe script evolution (no token overwrites)  
  - MOTD integration (disk space, update status, SES health)  

---

## 📊 Long-Term Vision

- Subscription model with affordable pricing (TBD)  
- Commercial-grade Enhance and Amazon SES integration tools  
- Automatic system update utility for Enhance servers (separate tool)  
- Multi-server orchestration capabilities  
- Dynamic MOTD educating sysadmins about installed tools  
- Enterprise-grade compliance reporting  
- Troubleshooting logic built-in to reduce admin guesswork  

---

## ⚡ Target Audience

- Enhance hosting providers (DNS Role users)  
- Amazon SES users seeking automation  
- Admins prioritizing compliance, uptime, and monitoring  
- Small businesses seeking affordable DNS automation  

---

## 👷 Development Status

**Current Version:** 0.9.1-beta  
**Author:** Matthew Murphy ([net30hosting.com](https://www.net30hosting.com))  

Follow project updates on:  
[GitHub](https://github.com/matthewxmurphy) • [Facebook](https://www.facebook.com/net30hosting) • [Instagram](https://www.instagram.com/net30hosting) • [TikTok](https://www.tiktok.com/@net30hosting)

---

## 🚀 Contributing

Community contributions are welcome. Please submit issues, feature requests, or pull requests on GitHub.

---

© 2025 Matthew Murphy. Licensed under the MIT License.
