#!/bin/bash

# A script to generate an HTML report of server health with a dark theme.

# Define the output HTML file
REPORT_FILE="/tmp/server_health_report.html"

# Get current date and time
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# --- 1. Gather Server Metrics ---

HOSTNAME=$(hostname)
OS_INFO=$(uname -a)
UPTIME_INFO=$(uptime)
RAM_USAGE=$(free -h | grep Mem | awk '{print "Total: " $2 ", Used: " $3 ", Free: " $4}')
DISK_USAGE=$(df -h | awk 'BEGIN{print "<tr><th>Filesystem</th><th>Size</th><th>Used</th><th>Avail</th><th>Use%</th><th>Mounted on</th></tr>"} NR>1{print "<tr><td>"$1"</td><td>"$2"</td><td>"$3"</td><td>"$4"</td><td>"$5"</td><td>"$6"</td></tr>"}')
TOP_PROCESSES=$(ps aux --sort=-%mem | head -n 6 | tail -n 5 | awk 'BEGIN{print "<tr><th>USER</th><th>PID</th><th>%CPU</th><th>%MEM</th><th>COMMAND</th></tr>"} {print "<tr><td>"$1"</td><td>"$2"</td><td>"$3"</td><td>"$4"</td><td>"substr($11,1,50)"</td></tr>"}')


# --- 2. Generate HTML Report using a Here Document ---

cat << EOF > $REPORT_FILE
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Server Health Report</title>
</head>
<body>
    <div class="container">
        <h1>Server Health Report</h1>
        <p class="footer">Report generated on: $TIMESTAMP</p>

        <div class="metric">
            <h2>System Information</h2>
            <p><strong>Hostname:</strong> <code>$HOSTNAME</code></p>
            <p><strong>OS Details:</strong> <code>$OS_INFO</code></p>
            <p><strong>System Uptime & Load:</strong> <code>$UPTIME_INFO</code></p>
        </div>

        <div class="metric">
            <h2>RAM Usage</h2>
            <p><code>$RAM_USAGE</code></p>
        </div>

        <div class="metric">
            <h2>Disk Space Consumption</h2>
            <table>
                $DISK_USAGE
            </table>
        </div>

        <div class="metric">
            <h2>Top 5 Memory-Consuming Processes</h2>
            <table>
                $TOP_PROCESSES
            </table>
        </div>

        <div class="footer">
            Automated Report by Server Health Check Script
        </div>
    </div>

    <style>
        body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
            margin: 0; 
            background-color: #2c3e50;
            color: #ecf0f1;
        }
        .container { 
            background-color: #34495e;
            margin: 40px auto;
            padding: 20px 30px; 
            border-radius: 8px; 
            box-shadow: 0 4px 10px rgba(0,0,0,0.3);
            max-width: 900px;
        }
        h1, h2 { 
            color: #1abc9c;
            border-bottom: 2px solid #1abc9c; 
            padding-bottom: 10px;
            margin-top: 10px;
        }
        .metric p { 
            margin: 10px 0; 
            font-size: 16px; 
            line-height: 1.5;
        }
        .metric code { 
            background-color: #2c3e50; 
            padding: 3px 6px; 
            border-radius: 4px; 
            font-size: 15px;
        }
        table { 
            width: 100%; 
            border-collapse: collapse; 
            margin-top: 15px; 
        }
        th, td { 
            border: 1px solid #46637f; 
            padding: 12px; 
            text-align: left; 
        }
        th { 
            background-color: #1abc9c; 
            color: #2c3e50;
            font-weight: bold;
        }
        tr:nth-child(even) { 
            background-color: #3b5266;
        }
        .footer { 
            text-align: center; 
            margin-top: 30px; 
            font-size: 12px; 
            color: #95a5a6; 
        }
    </style>
</body>
</html>
EOF

# --- 3. Finalization & Open ---
echo "✅ Server health report generated successfully: $REPORT_FILE"
xdg-open "$REPORT_FILE"
