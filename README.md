# System Guardian: DevOps Automation Toolkit
## Monitoring in Action
The System Guardian Sentinel sends real-time status reports to Discord. Below is a demonstration of the "Healthy" vs "Critical" alerting states.

![Discord Alert Status](./assets/alert.png)
## Automation
The system is fully automated using `cron`. 

1. The monitoring script runs every minute.
2. Log rotation occurs daily at midnight to manage disk space.

To view the schedule, run: `crontab -l`
