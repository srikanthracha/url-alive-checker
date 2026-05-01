# URL Alive Checker

A lightweight Bash tool to identify live URLs using HTTP status codes.  
Useful during the reconnaissance phase of penetration testing to quickly filter active endpoints.

---

##  Features

- Checks HTTP response status using `curl`
- Identifies live URLs (200, 301, 302)
- Fast and lightweight
- Easy to integrate into recon workflows

---

##  Requirements

- Bash
- curl

---

##  Usage

```bash
chmod +x alive_checker.sh
./alive_checker.sh urls.txt
