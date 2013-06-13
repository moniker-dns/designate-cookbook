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

if node[:designate][:install_ppa]
  # Public Designate PPA
  apt_repository "designate-ppa" do
    uri          "http://ppa.launchpad.net/kiall/designate-havana/ubuntu"
    distribution node['lsb']['codename']
    components   ["main"]
    keyserver    "keyserver.ubuntu.com"
    key          "DFA62498"
  end
else
  apt_repository "designate-ppa" do
    action :remove
  end
end