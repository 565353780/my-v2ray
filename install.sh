apt-get update -y
apt-get install curl openssh-client openssh-server -y

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

bash <(curl -s -L https://git.io/v2ray.sh)

