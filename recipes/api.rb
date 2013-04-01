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

include_recipe "moniker::common"

# Install the Moniker API package
package "moniker-api" do
  action   :upgrade
  version  node['moniker']['version']
end

# Write out the api-paste configuration file
template "/etc/moniker/api-paste.ini" do
  source  "api-paste.ini.erb"
  owner   "moniker"
  group   "moniker"
  mode    0660
end

# Enable + Start the Moniker API service
service "moniker-api" do
  supports    :restart => true, :status => true
  action      [:enable, :start]
  subscribes  :restart, resources(:template => "/etc/moniker/moniker.conf")
  subscribes  :restart, resources(:template => "/etc/moniker/api-paste.ini")
end