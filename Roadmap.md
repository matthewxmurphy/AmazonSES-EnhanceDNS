AmazonSES-EnhanceDNS 🚀

Automates Amazon SES DKIM, DMARC, and SPF DNS record injection into Enhance DNS Role servers.
Supports CSV-driven bulk record import, smart DNS troubleshooting, and planned API integrations.

⸻

Features ✨
	•	Automated injection of Amazon SES DKIM, DMARC, SPF records
	•	Reads records from /csv directory (supports multiple files)
	•	Dynamic Enhance DNS server discovery via API
	•	Detects Enhance zones via API (planned improvements)
	•	Troubleshooting tools for DNS health (SOA checks, trace logic)
	•	Safe defaults for DMARC/SPF with interactive config prompts
	•	Generates example CSV files on first run
	•	Roadmap includes full Enhance API integration and automated SES region syncing
	•	Designed for future scalability across Enhance-powered hosting platforms

⸻

Quick Start 🛠️

git clone https://github.com/matthewxmurphy/AmazonSES-EnhanceDNS.git
cd AmazonSES-EnhanceDNS
chmod +x enhance-dns-sync.sh
./enhance-dns-sync.sh

On first run, you’ll be prompted for:
	•	Enhance API token
	•	DNS record TTL (default 300 seconds)

Example CSVs will be generated in the /csv folder.

⸻

Example CSV Format 📂

csv/dkim-example.csv

Name,Type,Value
2kc777iublrxsi5gwrmsln6uuk3xkvvb._domainkey,CNAME,2kc777iublrxsi5gwrmsln6uuk3xkvvb.dkim.amazonses.com.

csv/dmarc-example.csv

Name,Type,Value
_dmarc,TXT,"v=DMARC1; p=none; rua=mailto:dmarc-reports@example.com; ruf=mailto:dmarc-failures@example.com; sp=none; aspf=r;"

csv/spf-example.csv

Name,Type,Value
mail,TXT,"v=spf1 include:amazonses.com ~all"


⸻

Project Details 📝
	•	Author: Matthew Murphy
	•	Official Branding: Net30Hosting.com
	•	License: MIT
	•	Status: Beta

⸻

Roadmap 🗺️
	•	✅ Local Enhance API discovery
	•	✅ CSV-driven DNS imports
	•	✅ Interactive first-run setup
	•	🚧 Enhance DNS API auto-detection
	•	🚧 Automated DNS health checks with solutions
	•	🚧 SES region expansion automation
	•	🚧 Troubleshooting logic for SOA/NXDOMAIN errors
	•	🚧 Future Twilio/SMS integration

⸻

Connect 📣
	•	Facebook: Net30Hosting
	•	Instagram/TikTok/Pinterest: @net30hosting
	•	Matthew’s Site: MatthewXMurphy.com

⸻

“Monitor smarter. Deploy faster. Stay compliant.” ⚡
