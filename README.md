# Automated Linux Server Health Check 🚀


A lightweight and powerful shell script for monitoring Linux server health in real-time. This tool tracks key system metrics and generates a clean, easy-to-read HTML report to visualize the data, helping to reduce manual checks and prevent unexpected server failures.


A screenshot of the generated HTML report.

<img width="1004" height="962" alt="Screenshot from 2025-08-02 00-06-13" src="https://github.com/user-attachments/assets/29948155-b4d0-4a6a-a3a2-a77d53fff7b8" />




✨ Key Features
🖥️ OS & System Info: Displays core operating system details and hostname.

🧠 RAM Usage: Shows total, used, and free memory.

💾 Disk Space: Provides an overview of disk consumption for all mounted partitions.

🏃 Active Processes: Lists the top 10 memory-consuming processes.

📄 HTML Report: Generates a self-contained HTML file for a clean, user-friendly view of the server status.

🔧 Prerequisites
This script is designed to be highly compatible and requires only standard Linux commands. Ensure the following are available on your system:

bash

df, free, uname, hostname, ps

⚙️ Usage
Clone the repository:

Bash

git clone https://github.com/[Your-Username]/[Your-Repository-Name].git
Navigate to the project directory:

Bash

cd [Your-Repository-Name]
Make the script executable:
(Replace your_script_name.sh with the actual name of your script file)

Bash

chmod +x your_script_name.sh
Run the script:

Bash

./your_script_name.sh
The script will run and create (or overwrite) a file named health_report.html in the same directory. Open this file in any web browser to view the server health report.

🕒 Automating with Cron
For periodic monitoring, you can automate the script using a cron job.

Open your crontab editor:

Bash

crontab -e
Add a line to schedule the script. For example, to run it every day at 8:00 AM:

Code snippet

#Min Hour DayOfMonth Month DayOfWeek Command
0 8 * * * /path/to/your_script_name.sh
(Make sure to use the absolute path to your script.)

💡 How It Works
The script leverages standard Linux command-line tools to gather system information. It then uses a heredoc to pipe this collected data directly into a pre-formatted HTML structure, creating a static report file. This method makes the script self-contained and avoids the need for external templating engines.

📜 License
This project is distributed under the MIT License. See the LICENSE file for more information.

Author:-
Chaitanya Gandhile - [https://github.com/Chaitanya-57]
