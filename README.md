# Linux Log Monitoring Script

## 📌 Overview
This script monitors `/var/log/auth.log` for suspicious activity including:
- Failed SSH login attempts
- Privilege escalation using `sudo` and `su`
- Unusual login times

## 🛠️ Features
- Alert generation via log file or email (optional)
- Simple to use with Python or Bash
- Can be scheduled using cron

## 🚀 Usage
```bash
python3 log_monitor.py
