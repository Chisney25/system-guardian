# System-Guardian: Infrastructure Monitoring

System-Guardian is a lightweight monitoring suite designed to track system health and ensure resource availability.

## Capabilities
- **Disk & Resource Tracking:** Uses `disk_usage.sh` to monitor partition health and CPU load.
- **Real-Time Discord Alerts:** Integrated with webhooks to provide instant status updates.
- **Color-Coded Reporting:**
  - 🟢 **Green Alerts:** Regular health checks and system "All Clear" signals.
  - 🔴 **Red/Yellow Alerts:** Critical warnings when thresholds are breached.

## Toolset
- `disk_usage.sh`: The core monitoring script (automated via Cron).
- `backup_configs.sh`: Automated configuration archival tool.

## Proof of Work
### System Status Notifications
![Discord Alert Screenshot](./assets/alert.png)
*Figure 1: Discord interface showing timestamped Green (Healthy) and Red/Yellow (Critical) system alerts.*

## To view the schedule, run `Crontab -l`
