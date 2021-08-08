# zolo20_infra
zolo20 Infra repository

```
bastion_IP = 178.154.222.179
someinternalhost_IP = 10.128.0.21

testapp_IP = 178.154.205.135
testapp_port = 9292
```

## ДЗ 03

## Подключение через бастион хост

Для подключения к someinternalhost_IP напярмую с локальной машины
необходимо создать файл ~/.ssh/config и прописать:

```
Host 178.154.222.179
	User appuser
	IdentityFile ~/.ssh/appuser

Host 10.128.0.21
	User appuser
	IdentityFile ~/.ssh/appuser
	ProxyJump 178.154.222.179
```

### Дополнительное задание

Подключение через `ssh someinternalhost`

В файле ~/.ssh/config прописать:

```
Host 178.154.222.179
	User appuser
	IdentityFile ~/.ssh/appuser

Host someinternalhost
	User appuser
	Hostname 10.128.0.21
	IdentityFile ~/.ssh/appuser
	ProxyJump 178.154.222.179
```

## VPN-сервер для серверов Yandex.Cloud

На сервере bastion_IP выполнить команду:

>sudo bash [setupvpn.sh](VPN/setupvpn.sh)

Следуем инструкциям установщика по адресу:

>https://<bastion_IP>/setup

После настройки создаем пользователя
test с PIN 6214157507237678334670591556762,
добавлем сервер и организацию и включаем в организацию
пользователя и сервер.

>Файл настройки клиента VPN - [cloud-bastion.ovpn](VPN/cloud-bastion.ovpn)

### Дополнительное задание: валидный сертификат для панели управления VPN сервера

Прописать в settings в параметр Lets Encrypt Domain
домен для bostion - 178-154-222-179.sslip.io

Доступ к printunl - https://178-154-222-179.sslip.io

![Image 1](images/settings_encrypt_domain.png)

## ДЗ 04
### Самостоятельная работа

>Команды по установке Ruby - [install_ruby.sh](install_ruby.sh)

>Команды по установке MongoDB - [install_mongodb.sh](install_mongodb.sh)

>Команды скачивания кода, установки зависимостей через bundler и запуск приложения - [deploy.sh](deploy.sh)

### Дополнительное задание: создание startup script, который будет запускаться при создании инстанса.

Файл с метаданными [metadata.yaml](metadata.yaml) и команду для создания инстанса:

```
yc compute instance create \
    --name reddit-app \
    --metadata serial-port-enable=1 \
    --metadata-from-file user-data=metadata.yaml \
    --hostname reddit-app \
    --memory=4 \
    --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
    --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4
```

## ДЗ 05
### Самостоятельная работа

Команда для валидации шаблона с параметрами (запускаем из каталога ./packer):
```
packer validate -var-file=variables.json ubuntu16.json
```

Команда для билда образа с указанием var-файла (запускаем из каталога ./packer):

```
packer build -var-file=variables.json ubuntu16.json
```
