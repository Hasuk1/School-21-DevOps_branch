# **Linux Network**

## *Настройка сетей в Linux на виртуальных машинах.*

## **Содержание**

1. [Инструмент ipcalc](#part-1-инструмент-ipcalc)

    1.1 [Установка инструмента](#11-установка-инструмента)

    1.2 [Сети и маски](#12-сети-и-маски)

    1.3 [localhost](#13-localhost)

    1.4 [Диапазоны и сегменты сетей](#14-диапазоны-и-сегменты-сетей)
2. [Статическая маршрутизация между двумя машинами](#part-2-статическая-маршрутизация-между-двумя-машинами)

    2.1 [Статическая маршрутизация между двумя машинами](#21-добавление-статического-маршрута-вручную)

    2.2 [Добавление статического маршрута с сохранением](#22-добавление-статического-маршрута-с-сохранением)

3. [Утилита iperf3](#part-3-утилита-iperf3)

    3.1 [Скорость соединения](#31-скорость-соединения)

    3.2 [Утилита iperf3](#32-утилита-iperf3)

4. [Сетевой экран](#part-4-сетевой-экран)

    4.1 [Утилита iptables](#41-утилита-iptables)

    4.2 [Утилита nmap](#42-утилита-nmap)

5. [Статическая маршрутизация сети](#part-5-статическая-маршрутизация-сети)

    5.1 [Настройка адресов машин](#51-настройка-адресов-машин)

    5.2 [Включение переадресации IP-адресов](#52-включение-переадресации-ip-адресов)

    5.3 [Установка маршрута по-умолчанию](#53-установка-маршрута-по-умолчанию)

    5.4 [Добавление статических маршрутов](#54-добавление-статических-маршрутов)

    5.5 [Построение списка маршрутизаторов](#55-построение-списка-маршрутизаторов)

    5.6 [Использование протокола ICMP при маршрутизации](#56-использование-протокола-icmp-при-маршрутизации)

6. [Динамическая настройка IP с помощью DHCP](#part-6-динамическая-настройка-ip-с-помощью-dhcp)

7. [NAT](#part-7-nat)

8. [Знакомство с SSH Tunnels](#part-8-знакомство-с-ssh-tunnels)

## **Part 1. Инструмент ipcalc**

## 1.1 Установка инструмента


```c
$ sudo apt install ipcalc
```

## 1.2 Сети и маски

Цель определить и записать в отчёт:

**1)** Адрес сети 192.167.38.54/13.

```c
$ ipcalc 192.167.38.54
```

![network_address](misc/network_address.png)

**2)** Перевод маски 255.255.255.0 в префиксную и двоичную запись, /15 в обычную и двоичную, 11111111.11111111.11111111.11110000 в обычную и префиксную.

```c
$ ipcalc 255.255.255.0
```

![network_trans](misc/network_trans.png)
>Перевод маски 255.255.255.0 в префиксную и двоичную запись.

===
```c
$ ipcalc 0.0.0.0/15
```

![network_netmask](misc/network_netmask.png)
>/15 в обычную и двоичную.

===
```c
$ ipcalc 0.0.0.0/28
```

![network_28](misc/network_28.png)
>11111111.11111111.11111111.11110000 в обычную и префиксную

**3**) Минимальный и максимальный хост в сети 12.167.38.4 при масках: /8, 11111111.11111111.00000000.00000000, 255.255.254.0 и /4.

```c
$ ipcalc 12.167.38.4/8
```
![min_max_8](misc/min_max_12167384.png)
>Минимальный и максимальный хост в сети 12.167.38.4 при маске /8.

===
```c
$ ipcalc 12.167.38.4/16
```
![min_max_16](misc/min_max_16.png)
>Минимальный и максимальный хост в сети 12.167.38.4 при маске /11111111.11111111.00000000.00000000.

===

```c
$ ipcalc 12.167.38.4/23
```
![min_max_23](misc/min_max_23.png)
>Минимальный и максимальный хост в сети 12.167.38.4 при маске 255.255.254.0.

===

```c
$ ipcalc 12.167.38.4/4
```
![min_max_4](misc/min_max_4.png)
>Минимальный и максимальный хост в сети 12.167.38.4 при маске /4.

## 1.3 localhost

Определить и записать в отчёт, можно ли обратиться к приложению, работающему на localhost, со следующими IP: 194.34.23.100, 127.0.0.2, 127.1.0.1, 128.0.0.1

**`Можно`:**   
```
127.1.0.1;    
128.0.0.1. 
```
**`Нельзя`:**
```
194.34.23.100;           
128.0.0.1.
```
## 1.4 Диапазоны и сегменты сетей

Определить:

**1.** Какие из перечисленных IP можно использовать в качестве публичного, а какие только в качестве частных: 10.0.0.45, 134.43.0.2, 192.168.4.2, 172.20.250.4, 172.0.2.1, 192.172.0.1, 172.68.0.2, 172.16.255.255, 10.10.10.10, 192.169.168.1

**В качестве `публичного`:** 
``` 
134.43.0.2; 
172.0.2.1;
192.172.0.1;
172.68.0.2;
192.169.168.1.
```

**В качестве `чаcтных`:** 
```
10.0.0.45;
192.168.4.2;
172.20.250.4;
172.16.255.255;
10.10.10.10.
```

**2.** Какие из перечисленных IP адресов шлюза возможны у сети 10.10.0.0/18: 10.0.0.1, 10.10.0.2, 10.10.10.10, 10.10.100.1, 10.10.1.255

**`Возможны`**: 
```
10.10.0.2;
10.10.10.10;
10.10.1.255.
```
**`Невозможны`**:
```
10.0.0.1;
10.10.100.1.
```

## **Part 2. Статическая маршрутизация между двумя машинами**

Поднимаем две виртуальные машины (далее -- `ws1` и `ws2`).
>С помощью команды `ip a` посмотреть существующие сетевые интерфейсы

![ip_a_ws1_ws2](misc/ipa_ws1_ws2.png)
```c
$ ifconfig -a
```
![ifconfig](misc/ifconfig_ws1_ws2.png)

Задаем следующие адреса и маски: ws1 - 192.168.100.10, маска /16, ws2 - 172.24.116.8, маска /12
```c
$ sudo vim /etc/netplan/00-installer-config.yaml
```
![netplan_ws1_ws2](misc/netplan_ws1_ws2.png)
Перезапускаем сервис сети:
```c
$ sudo netplan apply
```
![ipa_ws1_ws2_stat](misc/ipa_ws1_ws2_stat.png)

## 2.1 Добавление статического маршрута вручную

**Добавить статический маршрут от одной машины до другой и обратно при помощи команды вида `ip r add`**

Также сначала нужно настроить адаптеры сети машины через VirtualBox:

![VB_setting_net](misc/VB_setting_net.png)

Для ws1:
```c
$ sudo ip r add 172.24.116.8 dev enp0s8
```
Для ws2:
```c
$ sudo ip r add 192.168.100.10 dev enp0s8
```
**Пропинговать соединение между машинами:**
Для ws1:
```c
$ sudo ping -c 4 172.24.116.8
```
Для ws2:
```c
$ sudo ping -c 4 192.168.100.10
```
![ping_ws1_ws2](misc/ping_ws1_ws2.png)

## 2.2 Добавление статического маршрута с сохранением

**1.** Перезапустим машины.

**2.** Добавим статический маршрут от одной машины до другой с помощью файла etc/netplan/00-installer-config.yaml
```c
$ sudo vim etc/netplan/00-installer-config.yaml
```
![stat_routes_ws1_ws2](misc/stat_routes_ws1_ws2.png)
```c
$ sudo netplan apply
```
**3.** Пропингуем соединение между машинами.

![ping](misc/ping_after_stat_rotes.png)

## **Part 3. Утилита iperf3**

## 3.1. Скорость соединения

>Перевести и записать в отчёт: 8 Mbps в MB/s, 100 MB/s в Kbps, 1 Gbps в Mbps.

| Исходное | Перевод |
| ------ | ------ |
| 8 Mbps | 1 MB/s |
| 100 MB/s | 800000 Kbps |
|1 Gbps|1000 Mbps|

## 3.2. Утилита iperf3
```c
$ sudo apt install iperf3 
```
*Измерить скорость соединения между ws1 и ws2*

![speed1](misc/ws1_speed_ws2.png)
![speed2](misc/ws2_speed_ws1.png)

## **Part 4. Сетевой экран**

*Сетевые экраны используются для контроля информации, проходящей по соединению.*

## 4.1. Утилита iptables
```c
sudo apt-get install iptables
```
*Создание файла /etc/`firewall.sh`, для имитации фаерволла, на ws1 и ws2. Нужно добавить в файл подряд следующие правила:*

**1.** На ws1 применить стратегию когда в начале пишется запрещающее правило, а в конце пишется разрешающее правило (это касается пунктов 4 и 5);

**2.** На ws2 применить стратегию когда в начале пишется разрешающее правило, а в конце пишется запрещающее правило (это касается пунктов 4 и 5);

**3.** Открыть на машинах доступ для порта 22 (ssh) и порта 80 (http);

**4.** Запретить echo reply (машина не должна "пинговаться”, т.е. должна быть блокировка на OUTPUT);

**5.** Разрешить echo reply (машина должна "пинговаться").
```c
$ sudo vim /etc/firewall.sh
```
![firewall_ws1](misc/firewall_ws1_ws2.png)

- DROP — молча игнорирует пакет и прекращает обработку правил в этой цепочке.
- ACCEPT — принимает пакет и останавливает обработку правил в этой цепочке.

*Запусткаем файлы на обеих машинах командами `chmod +x /etc/firewall.sh` и `sh /etc/firewall.sh`*

**ws1:**

![iptables_ws1](misc/iptables_ws1.png)

**ws2:**

![iptables_ws2_1](misc/iptables_ws2_1.png)
![iptables_ws2_2](misc/iptables_ws2_2.png)

>Разница между стратегиями для ws1 и ws2 заключается в том, что они выполняются сверху вниз, то есть, если правило запрета выше, чем правило разрешения, то сначала выполняется правило запрета. Если разместить правило запрета и разрешения наоборот, то будет выполнено только правило разрешения.

Таким образом ws2 с ws1 должна [пинговаться](#42-утилита-nmap), а ws1 с ws2 не должна. 

## 4.2. Утилита nmap
```c
$ sudo apt-get install nmap
```
*Командой ping найти машину, которая не "пингуется", после чего утилитой nmap показать, что хост машины запущен (`Host is up`).*

![ws1:2-ping_ws2:1-noping](misc/ws1:2-ping_ws2:1-noping.png)

```c
$ nmap -Pn <address>
```
![nmap_ws1/2](misc/nmap_ws1:2.png)

*- Сохранение образов виртуальных машин*

```c
VirtualBox->File->Export configuration
```

## **Part 5. Статическая маршрутизация сети**

*Поднять пять виртуальных машин (3 рабочие станции (ws11, ws21, ws22) и 2 роутера (r1, r2))*

![part5_network](../misc/images/part5_network.png)

## 5.1. Настройка адресов машин

![prt_53_add_gateway](misc/prt_53_add_gateway.png)

>Перезапустить сервис сети.
```c
$ sudo netplan apply
```
>Проверить с помощью команды, что адреса машин заданы корректно.
```c
$ ip -4 a
```
![prt_51_ip4a](misc/prt_51_ip4a.png)
>Также пропинговать ws22 с ws21. Аналогично пропинговать r1 с ws11.

![prt_51_ping](misc/prt_51_ping.png)

## 5.2. Включение переадресации IP-адресов

Для включения переадресации IP, выполните команду на роутерах:
```c
$ sudo sysctl -w net.ipv4.ip_forward=1
```
![prt_52_sysctl](misc/prt_52_sysctl.png)

Откроем файл sysctl.conf с помощью команды sudo nano /etc/sysctl.conf и раскомментируем строку net.ipv4.ip_forward = 1

![prt_52_systcl_conf_edit](misc/prt_52_systcl_conf_edit.png)

## 5.3. Установка маршрута по-умолчанию

Настроим маршрут по-умолчанию (шлюз) для рабочих станций. Для этого добавим default перед IP роутера в файле конфигураций

![prt_53_add_gateway](misc/prt_53_add_gateway.png)

Сверим, что заданный маршрут добавился в таблицу маршрутизации.
```c
$ ip r
```
![prt_53_ipr](misc/prt_53_ipr.png)

Пропингуем с ws11 роутер r2 и покажем на r2, что пинг доходит. 
```c
$ ping -c 4 10.100.0.12
$ sudo tcpdump -tn -i enp0s8
```
![prt_53_ping_tcdump](misc/prt_53_ping.png)

## 5.4. Добавление статических маршрутов

Добавим в роутеры r1 и r2 статические маршруты в файле конфигураций.

![prt_54_edit_yaml](misc/prt_54_edit_yaml.png)

Таблицы с маршрутами на обоих роутерах.

![prt_54_r1:2_via](misc/prt_54_r1:2_via.png)

```c
@ws11:~$ ip r list 10.10.0.0/18
@ws11:~$ ip r list 0.0.0.0/0
```
![prt_54_ipr_list](misc/prt_54_ipr_list.png)
>Для адреса 10.10.0.0/18 был выбран маршрут, отличный от 0.0.0.0/0, поскольку он является адресом сети и доступен без шлюза.

## 5.5. Построение списка маршрутизаторов
###### *`Перед установкой нужно отключить заданные ранее настройки шлюза (занести конфигурацию в комментарии) и применить новые настройки.`*
```c
$ sudo apt install inetutils-traceroute
```
При помощи утилиты traceroute построить список маршрутизаторов на пути от ws11 до ws21.
```c
$ traceroute 10.20.0.10
```
![prt_55_traceroute](misc/prt_55_traceroute.png)
```c
$ tcpdump -tnv -i enp0s8
```
![prt_55_tcdump](misc/prt_55_tcdump.png)
*Каждый пакет следует определенным узлам вдоль своего пути до достижения цели, пройдя определенное количество таких узлов. При этом у каждого пакета имеется ограниченное время активности, которое определяет количество узлов, через которые он может пройти перед своим исчезновением. Этот параметр записывается в заголовке `TTL`, и каждый промежуточный маршрутизатор, через который проходит пакет, уменьшает его значение на один. Когда значение TTL достигает нуля, пакет уничтожается, и отправителю направляется уведомление о превышении времени.*

*В операционной системе Linux команда "`traceroute`" использует UDP-пакеты для трассировки маршрута. Она начинает отправку пакета с начальным значением TTL равным 1, и записывает адрес первого отвечающего узла. Затем TTL увеличивается до 2, 3 и так далее, пока пакет не достигнет целевой точки. В каждом случае отправляется три пакета, и для каждого из них измеряется время, затраченное на прохождение. Пакеты отправляются на случайные порты, которые обычно свободны. Когда утилита "traceroute" получает сообщение от целевого узла о недоступности порта, трассировка считается завершенной.*

## 5.6. Использование протокола ICMP при маршрутизации

Запускаем на r1 перехват сетевого трафика, проходящего через enp0s8 с помощью tcmdump, паралельно пингуем с ws11 несуществующий ip.
```c
@r1:~$ sudo tcmdump -n -i enp0s8 icmp
```
```c
@ws11:~$ ping -c 2 20.30.0.444
```
![prt_56_ping_dump](misc/prt_56_ping_dump.png)

## **Part 6. Динамическая настройка IP с помощью DHCP**
```c
sudo apt install isc-dhcp-server
```
Настроим в файле /etc/dhcp/dhcpd.conf конфигурацию службы DHCP для r2.
![prt_60_dhcp_stngs](misc/prt_60_dhcp_stngs.png)

Также на r2 в файле resolv.conf пропишем nameserver 8.8.8.8
![prt_60_resolv](misc/prt_60_resolv.png)

Перезагрузим службу DHCP
```c
$ systemctl restart isc-dhcp-server
```
![prt_60_restart_DHCP](misc/prt_60_restart_DHCP.png)

Перезагрузим ws21 через `reboot` и проверим, что она получила адрес. Также пропингуем ws22 с ws21.
![prt_60_ipa](misc/prt_60_ipa_ping.png)

Настроим конфигурацию cети `00-installer-config.yaml` на машине ws11. Добавим строки: `macaddress: 10:10:10:10:10:BA, dhcp4: true`.
![prt_60_addmac](misc/prt_60_addmac.png)

Аналогично r2 настроим r1 (с привязкой к MAC адресу ws11).

![prt_61_dhcp_stngs](misc/prt_61_dhcp_stngs.png)
![prt_61_resolv](misc/prt_61_resolv.png)
Перезагрузим службу DHCP
```c
$ systemctl restart isc-dhcp-server
```
![prt_61_restart_DHCP](misc/prt_61_restart_DHCP.png)

Перезагрузим ws11 через `reboot` и проверим, что она получила адрес. Также пропингуем ws11 с ws21.
![prt_61_ipa](misc/prt_61_ipa.png)
![prt_61_ping](misc/prt_61_pping.png)

Запросим с ws21 обновление ip адреса. Ip адрес до:

![prt_62_ip_before](misc/prt_62_ip_before.png)

Сначала освободим текущий enp0s8.
```c
$ sudo dhclient -r enp0s8
```
Теперь зададим новый.
```c
$ sudo dhclient enp0s8
```
ip адрес после:

![prt_62_ip_after](misc/prt_62_ip_after.png)

## **Part 7. NAT**

В этой части используются конфигураации машин из 5 части, поэтому сначала выключим все машины и откатим изменения с помощью импорта конфигураций.
```c
$ sudo apt install apache2
```
В файле /etc/apache2/ports.conf на ws22 и r1 изменим строку Listen 80 на Listen 0.0.0.0:80, то есть сделаем сервер Apache2 общедоступным.

![prt_71_edit_port](misc/prt_71_edit_port.png)

Запустим веб-сервер Apache.

```c
$ service apache2 start
```
![prt_72_start_apache](misc/prt_72_start_apache.png)

Добавить на r2 фаервол (/etc/firewall.sh). Прописать следующие правила:

1) Удаление правил в таблице filter - iptables -F;
2) Удаление правил в таблице "NAT" - iptables -F -t nat;
3) Отбрасывать все маршрутизируемые пакеты - iptables --policy FORWARD DROP;

![prt_73_firewall_1](misc/prt_73_firewall_1.png)

Запустим его.
```c
$ sudo chmod +x /etc/firewall.sh
$ sudo /etc/firewall.sh
```
> При этих правилах ws22 не пингуется с r1 и наоборот.

![prt_73_ping](misc/prt_73_ping.png)

Добавить в фаервол ещё одно правило `iptables -A FORWARD -p icmp -j ACCEPT` и запустим фаервол.

4) Разрешить маршрутизацию всех пакетов протокола ICMP;

> Теперь машины должны пинговаться.

![prt_73_nping](misc/prt_73_nping.png)

Добавим в файл ещё два правила:

5) Включить SNAT, а именно маскирование всех локальных ip из локальной сети, находящейся за r2 (по обозначениям из Части 5 - сеть 10.20.0.0);

    *Совет: стоит подумать о маршрутизации внутренних пакетов, а также внешних пакетов с установленным соединением.*

6) Включить DNAT на 8080 порт машины r2 и добавить к веб-серверу Apache, запущенному на ws22, доступ извне сети.

![prt_74_furewall_2](misc/prt_74_furewall_2.png)

- t - указывает на используемую таблицу;
- p - указывает протокол (tcp, udp, udplite);
- s - указывает адрес источника пакета;
- d - указывает адрес назначения пакета;
- i - задает входящий сетевой интерфейс;
- o - указывает исходящий сетевой интерфейс.

> DNAT — подменяет адрес получателя в заголовке IP-пакета, основное применение — предоставление доступа к сервисам снаружи, находящимся внутри сети
SNAT — служит для преобразования сетевых адресов, применимо, когда за сервером находятся машины, которым необходимо предоставить доступ в Интернет, при этом от провайдера имеется статический IP-адрес

Запустим его.
```c
$ sudo chmod +x /etc/firewall.sh
$ sudo /etc/firewall.sh
```

Проверим соединение по TCP для SNAT, для этого с ws22 подключимся к серверу Apache на r1 командой `telnet [адрес] [порт]`:
```c
$ telnet 10.100.0.11 80
```
![prt_75_telnet1](misc/prt_75_telnet1.png)

Также проверим соединение по TCP для DNAT, для этого с r1 подключимся к серверу Apache на ws22 командой telnet (нужно обращаться по адресу r2 и порту 8080):
```c
$ telnet 10.100.0.12 8080
```
![prt_75_telnet2](misc/prt_75_telnet2.png)

## **Part 8. Знакомство с SSH Tunnels**

1. Запускаем веб-сервер Apache на ws22 только на localhost:
    - На машине ws22 в файле /etc/apache2/ports.conf изменим строку Listen 80 на Listen localhost:80.
    - Запустим веб-сервер Apache.
```c
$ service apache2 start
```
![prt_81_apache_sntgs](misc/prt_81_apache_sntgs.png)

2. Воспользуемся Local TCP forwarding с ws21 до ws22, чтобы получить доступ к веб-серверу на ws22 с ws21.
```c
$ ssh -L 4444:localhost:80 10.20.0.20
```
![prt_82_connected_to_ws22](misc/prt_82_connected_to_ws22.png)

Для проверки подключения попытаемся подключится через другой терминал (cmd + F2) командой `telnet`, как видно, порт уже занят, соответственно подключение выполенно.
![prt_82_c1](misc/prt_82_c1.png)

3. Воспользуемся Remote TCP forwarding c ws11 до ws22, чтобы получить доступ к веб-серверу на ws22 с ws11.
```c
$ ssh -R 4444:localhost:80 -p 22 ws11
```
![prt_83_remote_tcp](misc/prt_83_remote_tcp.png)

Для проверки подключения также попытаемся подключится через другой терминал (cmd + F2) командой `telnet`, как видно, порт уже занят, соответственно подключение выполенно.

![prt_84_closed_port](misc/prt_84_closed_port.png)
