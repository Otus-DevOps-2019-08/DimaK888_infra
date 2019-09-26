# DimaK888_infra
DimaK888 Infra repository

### Домашнее задание 1.5
##### Дано:
```
bastion:
  internal_ip: 10.132.0.3
  external_ip: 35.240.89.91
someinternalhost:
  internal_ip: 10.132.0.4
```

bastion_IP=35.240.89.91
someinternalhost_IP=10.132.0.4

##### Подключение к someinternalhost через bastion одной строкой:
```
ssh -t kolbin@35.240.89.91 ssh kolbin@10.132.0.4
```
##### Подключение к someinternalhost через bastion используя ssh config:
- ~/.ssh/config
  ```
  Host bastion
    Hostname 35.240.89.91
    User kolbin
    Port 22
    ForwardAgent yes

  Host someinternalhost
    ProxyCommand ssh -q bastion nc -q0 10.132.0.4 22
  ```
- Командля для подключения: ssh someinternalhost

