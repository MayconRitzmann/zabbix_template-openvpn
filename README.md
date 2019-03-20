# zabbix-OpenVPN-monitoring
Monitoring OpenVPN services states with zabbix.

Suported: CentOS 7, Ubuntu 18+

#### Files in repository:
1) Template Template OpenVPN.xml - template for OpenVPN monitoring. Import on zabbix server.

2) userparameter_openvpn.service.conf - Config with UserParameter settings. Put it in the /etc/zabbix/zabbix_agentd.d/ directory (or something like this), then include in zabbix agent configuration file ("Include=/etc/zabbix/zabbix_agentd.d/").

4) lld_service.openvpn.sh - monitoring script. Put in zabbix monitoing scripts directory (in my case its "/etc/zabbix/scripts")
