apt update -y
apt upgrade -y
apt autoremove -y
apt install curl openssh-client openssh-server shadowsocks-libev socat -y

mkdir ~/.ssh

sh -c "echo \"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCsa/d93g5fuMZ7zftDap2SWxhu81oPTrolEKxdbP7HtD2uqPw6JnOzGESLMs0G/EUJiKCCioTbWf/N2/uMoV/WjBmHN3x6fSUBEb5ECtRlvPF/tz8j2mbD289Lnsio6slM6rsLWp8JNX2F2hef614ghG6C3jzBNlC04Uo3cjgRO9bNj6fzBbLzhRw6whYq4SFBRNlyYBJVI5mCobg/TstvfhfK5zLKKgBbdkEdOLM8nKNpZNqdDon5/KUZjiu2CVO4ybiAXnVM3CRFWxftAmIQScg8/eSg1GFm9WlEgncV/I9XdOhxFu+wmoKrzTh4MMPtRWUZXpxwFwlnrkZGQJc5 565353780@qq.com\" > ~/.ssh/authorized_keys"

chmod 600 ~/.ssh/authorized_keys

sh -c "echo \"Port 22
PermitRootLogin yes
PasswordAuthentication yes
PubkeyAuthentication yes
AuthorizedKeysFile      .ssh/authorized_keys .ssh/authorized_keys2
ClientAliveInterval 30
ClientAliveCountMax 20
AllowUsers root\" >> /etc/ssh/sshd_config"

service ssh --full-restart

#bash <(curl -s -L https://git.io/v2ray.sh)

wget https://github.com/shadowsocks/v2ray-plugin/releases/download/v1.3.1/v2ray-plugin-linux-amd64-v1.3.1.tar.gz
tar zxf v2ray-plugin*
mv v2ray-plugin_linux_amd64 /usr/bin/v2ray-plugin

curl https://get.acme.sh | sh

source ~/.bashrc

acme.sh --register-account -m l565353780l@163.com
mkdir /root/certs
acme.sh --issue -d ss.chli.fun --standalone
acme.sh --install-cert -d ss.chli.fun --key-file /root/certs/ss.chli.fun.key --<em>fullchain</em>-file /root/certs/ss.chli.fun.cer --reloadcmd "systemctl restart shadowsocks-libev"

sh -c 'echo "{
\"server\":\"0.0.0.0\",
\"server_port\":443,
\"password\":\"H520SsSs\!\@\#\",
\"timeout\":60,
\"method\":\"chacha20-ietf-poly1305\",
\"mode\":\"tcp_and_udp\",
\"fast_open\":false,
\"plugin\":\"v2ray-plugin\",
\"plugin_opts\":\"server\;tls\;fast-open\;host=ss.chli.fun\;cert=/root/certs/ss.chli.fun.cer\;key=/root/certs/ss.chli.fun.key\;loglevel=none\"
}" > /etc/shadowsocks-libev/config.json'

