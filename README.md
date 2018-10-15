# bakaevmm_infra
bakaevmm Infra repository
## Homework #3
### Подключаемся к хосту someinternalhost через bastion VM
#### Запускаем ssh агент
```
eval `ssh-agent -s`
```
### Добавляем ключ
```
ssh-add ~/.ssh/id_rsa
```

#### Подключаемся к someinternalhost
```
ssh -A -t user@bastion_host ssh dest_host
```

### Alias ssh_config
Используем ssh конфиг для пользователя. При использование параметра `ForwardAgent` не требуется запущенный на сервере `ssh-agent`.

`~/.ssh/config`
```
Host bastion
 user Bakaev
 Hostname 35.233.71.130
 ForwardAgent yes
Host someinternalhost
 user Bakaev
 Hostname 10.132.0.3
 Port 22
 ProxyJump bastion
```
Параметр `ProxyJump(-J)` возможно использовать начиная с версии `openssh v7.3`. Если использвется верися ниже то возможно использовать параметр `ProxyCommand`.
```
Host bastion
 user Bakaev
 Hostname 35.233.71.130
 ForwardAgent yes
Host someinternalhost
 user Bakaev
 Hostname 10.132.0.3
 Port 22
 ProxyCommand ssh -W  %h:%p bastion
```

### Подключение к vpn pritunl

Для подключения используем клиент openvpn
Адрес панели управления `https://pritunl.35.233.71.130.sslip.io`

### Даныые для проверки
```
bastion_IP = 35.233.71.130
someinternalhost_IP = 10.132.0.3
```
