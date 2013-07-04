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
default[:designate]['rabbitmq_search'] = "recipes:rabbitmq AND chef_environment:#{node.chef_environment}"
default[:designate]['rabbitmq_hosts'] = nil
default[:designate]['mysql_search'] = "recipes:mysql\:\:server AND chef_environment:#{node.chef_environment}"
default[:designate]['mysql_hosts'] = nil
default[:designate]['install_ppa'] = true
default[:designate]['extra_sections'] = []

# Designate [DEFAULT] Configuration
default[:designate]['DEFAULT']['verbose'] = true
default[:designate]['DEFAULT']['debug'] = false
default[:designate]['DEFAULT']['state_path'] = '/var/lib/designate'
default[:designate]['DEFAULT']['logdir'] = '/var/log/designate'
default[:designate]['DEFAULT']['use_syslog'] = false
default[:designate]['DEFAULT']['syslog_log_facility'] = 'LOG_LOCAL0'
default[:designate]['DEFAULT']['notification_driver'] = 'designate.openstack.common.notifier.no_op_notifier'
default[:designate]['DEFAULT']['policy_default_rule'] = 'default'
default[:designate]['DEFAULT']['allowed_rpc_exception_modules'] = ['designate.exceptions', 'designate.openstack.common.exception']
default[:designate]['DEFAULT']['default_log_levels'] = ['amqplib=WARN', 'sqlalchemy=WARN', 'boto=WARN', 'suds=INFO', 'keystone=INFO', 'eventlet.wsgi.server=WARN', 'stevedore=WARN']

default[:designate]['DEFAULT']['amqp_rpc_single_reply_queue'] = false
default[:designate]['DEFAULT']['rabbit_use_ssl'] = false
default[:designate]['DEFAULT']['rabbit_userid'] = 'guest'
default[:designate]['DEFAULT']['rabbit_password'] = 'guest'
default[:designate]['DEFAULT']['rabbit_virtual_host'] = '/'
default[:designate]['DEFAULT']['rabbit_durable_queues'] = false
default[:designate]['DEFAULT']['rabbit_ha_queues'] = false
default[:designate]['DEFAULT']['kombu_ssl_version'] = nil
default[:designate]['DEFAULT']['kombu_ssl_keyfile'] = nil
default[:designate]['DEFAULT']['kombu_ssl_certfile'] = nil
default[:designate]['DEFAULT']['kombu_ssl_ca_certs'] = nil

# Designate [service:central] Configuration
default[:designate]['service:central']['backend_driver'] = 'rpc'
default[:designate]['service:central']['domain_name_blacklist'] = Array.new
default[:designate]['service:central']['accepted_tld_list'] = Array.new
default[:designate]['service:central']['max_domain_name_len'] = 255
default[:designate]['service:central']['max_record_name_len'] = 255

# Designate [service:api] Configuration
default[:designate]['service:api']['api_host'] = '0.0.0.0'
default[:designate]['service:api']['api_port'] = 9001
default[:designate]['service:api']['auth_strategy'] = 'noauth'
default[:designate]['service:api']['enabled_extensions_v1'] = Array.new

# Designate [service:agent] Configuration
default[:designate]['service:agent']['backend_driver'] = 'fake'

# Designate [service:sink] Configuration
default[:designate]['service:sink']['enabled_notification_handlers']  = Array.new

# Designate [backend:bind9] Configuration
default[:designate]['backend:bind9']['rndc_path'] = '/usr/sbin/rndc'
default[:designate]['backend:bind9']['rndc_host'] = '127.0.0.1'
default[:designate]['backend:bind9']['rndc_port'] = 953
default[:designate]['backend:bind9']['rndc_config_file'] = '/etc/rndc.key'
default[:designate]['backend:bind9']['rndc_key_file'] = '/etc/rndc.key'

# Designate [backend:mysqlbind9] Configuration
default[:designate]['backend:mysqlbind9']['database_connection'] = 'mysql://user:password@host/schema'
default[:designate]['backend:mysqlbind9']['rndc_path'] = '/usr/sbin/rndc'
default[:designate]['backend:mysqlbind9']['rndc_host'] = '127.0.0.1'
default[:designate]['backend:mysqlbind9']['rndc_port'] = 953
default[:designate]['backend:mysqlbind9']['rndc_config_file'] = '/etc/rndc.key'
default[:designate]['backend:mysqlbind9']['rndc_key_file'] = '/etc/rndc.key'
default[:designate]['backend:mysqlbind9']['write_database'] = true
default[:designate]['backend:mysqlbind9']['dns_server_type'] = 'master'

# Designate [backend:powerdns] Configuration
default[:designate]['backend:powerdns']['database_connection'] = 'mysql://user:password@host/schema'
default[:designate]['backend:powerdns']['connection_debug'] = 0
default[:designate]['backend:powerdns']['connection_trace'] = false
default[:designate]['backend:powerdns']['sqlite_synchronous'] = true
default[:designate]['backend:powerdns']['idle_timeout'] = 3600
default[:designate]['backend:powerdns']['max_retries'] = 10
default[:designate]['backend:powerdns']['retry_interval'] = 10
default[:designate]['backend:powerdns']['domain_type'] = 'NATIVE'
default[:designate]['backend:powerdns']['also_notify'] = []

# Designate [storage:sqlalchemy] Configuration
default[:designate]['storage:sqlalchemy']['backend_driver'] = 'bind9'
default[:designate]['storage:sqlalchemy']['database_connection'] = 'sqlite:///$state_path/designate.sqlite'
default[:designate]['storage:sqlalchemy']['connection_debug'] = 0
default[:designate]['storage:sqlalchemy']['connection_trace'] = false
default[:designate]['storage:sqlalchemy']['sqlite_synchronous'] = true
default[:designate]['storage:sqlalchemy']['idle_timeout'] = 3600
default[:designate]['storage:sqlalchemy']['max_retries'] = 10
default[:designate]['storage:sqlalchemy']['retry_interval'] = 10

# Designate [handler:nova_fixed] Configuration
default[:designate]['handler:nova_fixed']['domain_id'] = nil
default[:designate]['handler:nova_fixed']['notification_topics'] = 'notifications'
default[:designate]['handler:nova_fixed']['control_exchange'] = 'nova'
default[:designate]['handler:nova_fixed']['format'] = '%(octet0)s-%(octet1)s-%(octet2)s-%(octet3)s.%(domain)s'

# Designate [handler:quantum_floating] Configuration
default[:designate]['handler:quantum_floating']['domain_id'] = nil
default[:designate]['handler:quantum_floating']['notification_topics'] = 'notifications'
default[:designate]['handler:quantum_floating']['control_exchange'] = 'quantum'
default[:designate]['handler:quantum_floating']['format'] = '%(octet0)s-%(octet1)s-%(octet2)s-%(octet3)s.%(domain)s'
