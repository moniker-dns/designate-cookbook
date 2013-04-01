# Copyright 2013 Hewlett-Packard Development Company, L.P.
#
# Author: Kiall Mac Innes <kiall@hp.com>
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License. You may obtain
# a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#
# Cookbook Configuration
default['moniker']['version'] = nil
default['moniker']['rabbit_search'] = 'recipes:rabbitmq AND chef_environment:#{node.chef_environment}'
default['moniker']['mysql_search'] = 'recipes:mysql\:\:server AND chef_environment:#{node.chef_environment}'

# Moniker [DEFAULT] Configuration
default['moniker']['DEFAULT']['verbose'] = true
default['moniker']['DEFAULT']['debug'] = false
default['moniker']['DEFAULT']['state_path'] = '/var/lib/moniker'
default['moniker']['DEFAULT']['logdir'] = '/var/log/moniker'
default['moniker']['DEFAULT']['use_syslog'] = false
default['moniker']['DEFAULT']['syslog_log_facility'] = 'LOG_LOCAL0'
default['moniker']['DEFAULT']['notification_driver'] = 'moniker.openstack.common.notifier.no_op_notifier'
default['moniker']['DEFAULT']['policy_file'] = 'policy.json'
default['moniker']['DEFAULT']['policy_default_rule'] = 'default'

default['moniker']['DEFAULT']['rabbit_hosts'] = nil
default['moniker']['DEFAULT']['rabbit_use_ssl'] = false
default['moniker']['DEFAULT']['rabbit_userid'] = 'guest'
default['moniker']['DEFAULT']['rabbit_password'] = 'guest'
default['moniker']['DEFAULT']['rabbit_virtual_host'] = '/'
default['moniker']['DEFAULT']['rabbit_durable_queues'] = false
default['moniker']['DEFAULT']['rabbit_ha_queues'] = false
default['moniker']['DEFAULT']['kombu_ssl_version'] = nil
default['moniker']['DEFAULT']['kombu_ssl_keyfile'] = nil
default['moniker']['DEFAULT']['kombu_ssl_certfile'] = nil
default['moniker']['DEFAULT']['kombu_ssl_ca_certs'] = nil

# Moniker [service:central] Configuration
default['moniker']['service:central']['backend_driver'] = 'rpc'
default['moniker']['service:central']['domain_name_blacklist'] = []
default['moniker']['service:central']['accepted_tld_list'] = []
default['moniker']['service:central']['max_domain_name_len'] = 255
default['moniker']['service:central']['max_record_name_len'] = 255

# Moniker [service:api] Configuration
default['moniker']['service:api']['api_host'] = '0.0.0.0'
default['moniker']['service:api']['api_port'] = 9001
default['moniker']['service:api']['auth_strategy'] = 'noauth'
default['moniker']['service:api']['enabled_extensions_v1'] = []

# Moniker [service:agent] Configuration
default['moniker']['service:agent']['backend_driver'] = 'fake'

# Moniker [service:sink] Configuration
default['moniker']['service:sink']['enabled_notification_handlers']  = []

# Moniker [storage:sqlalchemy] Configuration
default['moniker']['storage:sqlalchemy']['backend_driver'] = 'bind9'
default['moniker']['storage:sqlalchemy']['database_connection'] = 'sqlite:///$state_path/moniker.sqlite'
# default['moniker']['storage:sqlalchemy']['database_connection']['host'] = nil
# default['moniker']['storage:sqlalchemy']['database_connection']['username'] = 'moniker'
# default['moniker']['storage:sqlalchemy']['database_connection']['password'] = nil
# default['moniker']['storage:sqlalchemy']['database_connection']['name'] = 'moniker'
default['moniker']['storage:sqlalchemy']['connection_debug'] = 0
default['moniker']['storage:sqlalchemy']['connection_trace'] = false
default['moniker']['storage:sqlalchemy']['sqlite_synchronous'] = true
default['moniker']['storage:sqlalchemy']['idle_timeout'] = 3600
default['moniker']['storage:sqlalchemy']['max_retries'] = 10
default['moniker']['storage:sqlalchemy']['retry_interval'] = 10

# Moniker [handler:nova_fixed] Configuration
default['moniker']['handler:nova_fixed']['domain_id'] = nil
default['moniker']['handler:nova_fixed']['notification_topics'] = 'notifications'
default['moniker']['handler:nova_fixed']['control_exchange'] = 'nova'
default['moniker']['handler:nova_fixed']['format'] = '%(octet0)s-%(octet1)s-%(octet2)s-%(octet3)s.%(domain)s'

# Moniker [handler:quantum_floating] Configuration
default['moniker']['handler:quantum_floating']['domain_id'] = nil
default['moniker']['handler:quantum_floating']['notification_topics'] = 'notifications'
default['moniker']['handler:quantum_floating']['control_exchange'] = 'quantum'
default['moniker']['handler:quantum_floating']['format'] = '%(octet0)s-%(octet1)s-%(octet2)s-%(octet3)s.%(domain)s'

# Moniker [backend:bind9] Configuration
default['moniker']['backend:bind9']['rndc_path'] = '/usr/sbin/rndc'
default['moniker']['backend:bind9']['rndc_host'] = '127.0.0.1'
default['moniker']['backend:bind9']['rndc_port'] = 953
default['moniker']['backend:bind9']['rndc_config_file'] = '/etc/rndc.key'
default['moniker']['backend:bind9']['rndc_key_file'] = '/etc/rndc.key'

# Moniker [backend:mysqlbind9] Configuration
default['moniker']['backend:mysqlbind9']['database_connection'] = 'mysql://user:password@host/schema'
default['moniker']['backend:mysqlbind9']['rndc_path'] = '/usr/sbin/rndc'
default['moniker']['backend:mysqlbind9']['rndc_host'] = '127.0.0.1'
default['moniker']['backend:mysqlbind9']['rndc_port'] = 953
default['moniker']['backend:mysqlbind9']['rndc_config_file'] = '/etc/rndc.key'
default['moniker']['backend:mysqlbind9']['rndc_key_file'] = '/etc/rndc.key'
default['moniker']['backend:mysqlbind9']['write_database'] = true
default['moniker']['backend:mysqlbind9']['dns_server_type'] = 'master'

# Moniker [backend:powerdns] Configuration
default['moniker']['backend:powerdns']['database_connection'] = 'mysql://user:password@host/schema'
default['moniker']['backend:powerdns']['connection_debug'] = 0
default['moniker']['backend:powerdns']['connection_trace'] = false
default['moniker']['backend:powerdns']['sqlite_synchronous'] = true
default['moniker']['backend:powerdns']['idle_timeout'] = 3600
default['moniker']['backend:powerdns']['max_retries'] = 10
default['moniker']['backend:powerdns']['retry_interval'] = 10
default['moniker']['backend:powerdns']['domain_type'] = 'NATIVE'
default['moniker']['backend:powerdns']['also_notify'] = []

# Moniker [filter:authtoken] Configuration
default['moniker']['filter:authtoken']['filter_factory'] = 'keystoneclient.middleware.auth_token:filter_factory'
default['moniker']['filter:authtoken']['service_protocol'] = 'http'
default['moniker']['filter:authtoken']['service_host'] = '127.0.0.1'
default['moniker']['filter:authtoken']['service_port'] = 5000
default['moniker']['filter:authtoken']['auth_host'] = '127.0.0.1'
default['moniker']['filter:authtoken']['auth_port'] = 35357
default['moniker']['filter:authtoken']['auth_protocol'] = 'http'
default['moniker']['filter:authtoken']['admin_tenant_name'] = 'service'
default['moniker']['filter:authtoken']['admin_user'] = 'moniker'
default['moniker']['filter:authtoken']['admin_password'] = 'moniker'
