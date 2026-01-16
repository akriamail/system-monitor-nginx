#!/bin/bash
while true
do
  CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
  DISK=$(df -h / | awk 'NR==2 {print $5}')
  USER=$(whoami)
  cat << HTML > index.html
  <html>
    <head>
      <meta charset="UTF-8">
      <title>Project Team Monitor</title>
    </head>
    <body style="text-align:center; font-family:sans-serif; background:#eef2f3;">
      <h1 style="color:#2c3e50;">Project Team 监控面板 v1.01</h1>
      <div style="font-size:20px; border:2px solid #34495e; display:inline-block; padding:20px; background:#fff; border-radius:10px;">
        <p>当前运行用户: <b style="color:#27ae60;">$USER</b></p>
        <p>CPU 使用率: <b style="color:red;">$CPU%</b></p>
        <p>硬盘已用: <b style="color:blue;">$DISK</b></p>
        <p>更新时间: $(date "+%H:%M:%S")</p>
      </div>
    </body>
  </html>
HTML
  sleep 5
done
