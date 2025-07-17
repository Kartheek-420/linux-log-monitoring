# Linux Log Monitoring Script (Bash + Discord Alerts)

## 📌 Overview
This Bash script monitors `/var/log/auth.log` for:
- 🚫 Failed SSH login attempts
- 🔐 Privilege escalation using `sudo` or `su`
- ⏰ Logins at unusual hours (00:00–05:59)

Detected events are sent as **alerts to the `#alert` channel in your Discord server** using a webhook.

---

## 📁 Files
- `log_monitor.sh`: Main monitoring script
- `sample_auth.log`: (Optional) Sample log for testing

---

## ⚙️ How It Works
1. Reads `/var/log/auth.log`
2. Extracts:
   - Last 5 failed SSH logins
   - Last 5 `sudo`/`su` commands with `COMMAND=`
   - Login sessions opened between midnight and 6 AM
3. Sends a formatted message to the `#alert` channel via Discord webhook

---

## 🚀 Usage

```bash
chmod +x log_monitor.sh
./log_monitor.sh
