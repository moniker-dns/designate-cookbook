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
# Install the package Repository
include_recipe "designate::repository"

# Lookup the RabbitMQ hosts via search (or the configured hosts if set)
rabbitmq_hosts = search_helper_best_ip(node[:designate][:rabbitmq_search], node[:designate][:rabbitmq_hosts], false) do |ip, other_node|
  if node[:designate]['DEFAULT']['rabbit_use_ssl']
    "#{ip}:#{other_node[:rabbitmq][:ssl_port]}"
  else
    "#{ip}:#{other_node[:rabbitmq][:port]}"
  end
end

rabbitmq_password = lookup_password('rabbitmq', node[:designate]['DEFAULT']['rabbit_userid'], node[:designate]['DEFAULT']['rabbit_password'])

# TODO: Look these up dynamically!
sqlalchemy_database_connection = node[:designate]['storage:sqlalchemy']['database_connection']
powerdns_database_connection = node[:designate]['backend:powerdns']['database_connection']
extra_sections = node[:designate]['extra_sections']

# Install the designate-common package
package "designate-common" do
  action   :upgrade
end

# Install the python-designate package
package "python-designate" do
  action   :upgrade
end

# Write out the main designate config file
template "/etc/designate/designate.conf" do
  source     "designate.conf.erb"
  owner      "designate"
  group      "designate"
  mode       0660
  variables  :rabbitmq_hosts => rabbitmq_hosts, :rabbitmq_password => rabbitmq_password, :sqlalchemy_database_connection => sqlalchemy_database_connection, :powerdns_database_connection => powerdns_database_connection, :extra_sections => extra_sections
end

# Write out the main designate policy file
template "/etc/designate/policy.json" do
  source     "policy.json.erb"
  owner      "designate"
  group      "designate"
  mode       0660
end
