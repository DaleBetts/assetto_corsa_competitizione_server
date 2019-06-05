Content-Type: multipart/mixed; boundary="==BOUNDARY=="
MIME-Version: 1.0

--==BOUNDARY==
Content-Type: text/x-shellscript; charset="us-ascii"
#!/bin/bash

sudo apt-get install -y wine-development

# Grab config

aws s3 cp s3://assetto-artifacts/cfg/config.text /opt/assetto/cfg/config.txt

# Run

/usr/lib/wine-development/wine accServer.exe
