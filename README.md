# Advanced Bash Scripts for SRE & DevOps
This repository contains essential Bash scripts for:

- System monitoring - sys_healthcheck.sh
  1️⃣ Linux System Health Check Script
    ✅ Purpose: Automates system health checks, logs results, and sends alerts.
    ✅ Use Case: Regular health monitoring of production servers.
    ✅ Components Checked: CPU usage, memory, disk usage, running processes, network status.

- Log management -
  2️⃣ Automated Log Rotation and Cleanup
    ✅ Purpose: Rotates logs and cleans up old files to free disk space.
    ✅ Use Case: Prevents /var/log/ from filling up the disk.

  
- Security (SSH monitoring)
  3️⃣ Real-time SSH Intrusion Detection
    ✅ Purpose: Monitors /var/log/auth.log for failed SSH login attempts.
    ✅ Use Case: Helps detect brute-force attacks and blocks attackers.

  
- Backup automation - 4️⃣ Automated Backup Script
  ✅ Purpose: Automates database or file backups.
  ✅ Use Case: Ensures production data is regularly backed up.

  
- Kubernetes pod auto-restart - 5️⃣ Kubernetes Pod Auto-Restart on Crash
  ✅ Purpose: Checks if any pod is in CrashLoopBackOff and restarts it.
  ✅ Use Case: Ensures high availability of microservices in Kubernetes.

- Automating User Access Management - userAccessRm.sh
  ✅ Automatically removes inactive users based on last login time.
