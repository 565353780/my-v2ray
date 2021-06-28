apt update -y
apt upgrade -y
apt autoremove -y

sh -c "echo \"Port 22
PermitRootLogin yes
PasswordAuthentication yes
PubkeyAuthentication yes
AuthorizedKeysFile      .ssh/authorized_keys .ssh/authorized_keys2
ClientAliveInterval 30
ClientAliveCountMax 20
AllowUsers root\" >> /etc/ssh/sshd_config"

service ssh --full-restart

bash <(curl -sL https://s.hijk.art/xray.sh)

