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
# Install the Moniker package Repository
include_recipe "moniker::repository"

# Lookup the RabbitMQ hosts via search (or the configured hosts if set)
rabbitmq_hosts = search_helper_best_ip(node[:moniker][:rabbitmq_search], node[:moniker][:rabbitmq_hosts]) do |ip, other_node|
  "#{ip}:#{other_node[:rabbitmq][:port]}"
end

rabbitmq_password = lookup_password('rabbitmq', node['moniker']['DEFAULT']['rabbit_userid'], node['moniker']['DEFAULT']['rabbit_password'])

# TODO: Look these up dynamically!
sqlalchemy_database_connection = node['moniker']['storage:sqlalchemy']['database_connection']
powerdns_database_connection = node['moniker']['backend:powerdns']['database_connection']


# Install the moniker-common package
package "moniker-common" do
  action   :upgrade
end

# Write out the main moniker config file
template "/etc/moniker/moniker.conf" do
  source     "moniker.conf.erb"
  owner      "moniker"
  group      "moniker"
  mode       0660
  variables  :rabbitmq_hosts => rabbitmq_hosts, :rabbitmq_password => rabbitmq_password, :sqlalchemy_database_connection => sqlalchemy_database_connection, :powerdns_database_connection => powerdns_database_connection
end

# Write out the main moniker policy file
template "/etc/moniker/policy.json" do
  source     "policy.json.erb"
  owner      "moniker"
  group      "moniker"
  mode       0660
end
