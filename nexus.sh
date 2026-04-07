sudo yum install java-17-amazon-corretto-jmods -y
sudo cd /opt
sudo wget https://download.sonatype.com/nexus/3/nexus-3.90.2-06-linux-x86_64.tar.gz
sudo tar -zxvf nexus-3.90.2-06-linux-x86_64.tar.gz
sudo adduser nexus
sudo chown -R nexus:nexus nexus-3.90.2-06 sonatype-work/
sudo su - nexus
sudo cd /opt/nexus-3.90.2-06/bin/
sudo ./nexus start
[Unit]
Description=nexus service
After=network.target

[Service]
Type=forking
LimitNOFILE=65536
User=nexus
Group=nexus
ExecStart=/app/nexus/bin/nexus start
ExecStop=/app/nexus/bin/nexus stop
User=nexus
Restart=on-abort

[Install]
WantedBy=multi-user.target
EOL
sudo chkconfig nexus on
sudo systemctl start nexus
sudo systemctl enable nexus
sudo systemctl status nexus
