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

default[:designate]['policy']['rules'] = {
  'admin' => 'role:admin or is_admin:True',
  'owner' => 'tenant_id:%(tenant_id)s or tenant_id:%(effective_tenant_id)s',
  'admin_or_owner' => 'rule:admin or rule:owner',

  'default' => 'rule:admin_or_owner',

  'get_quotas' => 'rule:admin_or_owner',
  'get_quota' => 'rule:admin_or_owner',
  'set_quota' => 'rule:admin',
  'reset_quotas' => 'rule:admin',

  'create_server' => 'rule:admin',
  'find_servers' => 'rule:admin',
  'get_server' => 'rule:admin',
  'update_server' => 'rule:admin',
  'delete_server' => 'rule:admin',

  'create_tsigkey' => 'rule:admin',
  'find_tsigkeys' => 'rule:admin',
  'get_tsigkey' => 'rule:admin',
  'update_tsigkey' => 'rule:admin',
  'delete_tsigkey' => 'rule:admin',

  'find_tenants' => 'rule:admin',
  'get_tenant' => 'rule:admin',
  'count_tenants' => 'rule:admin',

  'create_domain' => 'rule:admin_or_owner',
  'get_domains' => 'rule:admin_or_owner',
  'get_domain' => 'rule:admin_or_owner',
  'get_domain_servers' => 'rule:admin_or_owner',
  'find_domains' => 'rule:admin_or_owner',
  'find_domain' => 'rule:admin_or_owner',
  'update_domain' => 'rule:admin_or_owner',
  'delete_domain' => 'rule:admin_or_owner',
  'count_domains' => 'rule:admin_or_owner',
  'touch_domain' => 'rule:admin_or_owner',

  'create_record' => 'rule:admin_or_owner',
  'get_records' => 'rule:admin_or_owner',
  'get_record' => 'rule:admin_or_owner',
  'find_records' => 'rule:admin_or_owner',
  'find_record' => 'rule:admin_or_owner',
  'update_record' => 'rule:admin_or_owner',
  'delete_record' => 'rule:admin_or_owner',
  'count_records' => 'rule:admin_or_owner',

  'use_sudo' => 'rule:admin',
  'use_blacklisted_domain' => 'rule:admin',

  'diagnostics_ping' => 'rule:admin',
  'diagnostics_sync_domains' => 'rule:admin',
  'diagnostics_sync_domain' => 'rule:admin',
  'diagnostics_sync_record' => 'rule:admin'
}
