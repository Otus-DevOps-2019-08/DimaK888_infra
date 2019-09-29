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

### Домашнее задание 1.6 (Основные сервисы Google Cloud Platform)
#### Создание инстанса через gcloud с указанием startup-script-url:
```
gcloud compute instances create reddit-app\
  --boot-disk-size=10GB \
  --image-family ubuntu-1604-lts \
  --image-project=ubuntu-os-cloud \
  --machine-type=g1-small \
  --tags=puma-server,default-puma-server \
  --restart-on-failure \
  --metadata startup-script-url=https://raw.githubusercontent.com/Otus-DevOps-2019-08/DimaK888_infra/cloud-testapp/startup_script.sh
```
#### Создание правила брандмауэра с тегом default-puma-server для доступа к приложения по 9292 порту через gcloud:
```
gcloud compute firewall-rules create default-puma-server\
  --allow=TCP:9292\
  --target-tags=default-puma-server
```
#### Информация для прогона тестов:
```
testapp_IP = 35.240.12.255
testapp_port = 9292
```

### Домашнее задание 1.7 (Модели управления инфраструктурой)
#### Краткое описание проделанной работы:
- создан файл-описание для создания базового образа reddit-base
- создан базовый образ reddit-base
- чувствительные данные были перенесены в отдельный файл (исключен из индекса в .gitignore)
- создан файл-описание для создания "запеченого" образа reddit-full (где reddit-base взят в качестве базового)
- создан образ reddit-full
- создан скрипт для запуска виртуальной машины с использованием образа reddit-full

