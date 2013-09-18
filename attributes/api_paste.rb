default[:designate]['api_paste']['composite:osapi_dns']['use'] = 'egg:Paste#urlmap'
default[:designate]['api_paste']['composite:osapi_dns']['/'] = 'osapi_dns_app_versions'
default[:designate]['api_paste']['composite:osapi_dns']['/v1'] = 'osapi_dns_v1'
default[:designate]['api_paste']['composite:osapi_dns']['/v2'] = 'osapi_dns_v2'

default[:designate]['api_paste']['app:osapi_dns_app_versions']['paste.app_factory'] = 'designate.api.versions:factory'

default[:designate]['api_paste']['composite:osapi_dns_v1']['use'] = 'call:designate.api.middleware:auth_pipeline_factory'
default[:designate]['api_paste']['composite:osapi_dns_v1']['noauth'] = 'noauthcontext maintenance faultwrapper osapi_dns_app_v1'
default[:designate]['api_paste']['composite:osapi_dns_v1']['keystone'] = 'authtoken keystonecontext maintenance faultwrapper osapi_dns_app_v1'

default[:designate]['api_paste']['app:osapi_dns_app_v1']['paste.app_factory'] = 'designate.api.v1:factory'

default[:designate]['api_paste']['composite:osapi_dns_v2']['use'] = 'call:designate.api.middleware:auth_pipeline_factory'
default[:designate]['api_paste']['composite:osapi_dns_v2']['noauth'] = 'noauthcontext maintenance faultwrapper osapi_dns_app_v2'
default[:designate]['api_paste']['composite:osapi_dns_v2']['keystone'] = 'authtoken keystonecontext maintenance faultwrapper osapi_dns_app_v2'

default[:designate]['api_paste']['app:osapi_dns_app_v2']['paste.app_factory'] = 'designate.api.v2:factory'

default[:designate]['api_paste']['filter:maintenance']['paste.filter_factory'] = 'designate.api.middleware:MaintenanceMiddleware.factory'
default[:designate]['api_paste']['filter:noauthcontext']['paste.filter_factory'] = 'designate.api.middleware:NoAuthContextMiddleware.factory'
default[:designate]['api_paste']['filter:keystonecontext']['paste.filter_factory'] = 'designate.api.middleware:KeystoneContextMiddleware.factory'
default[:designate]['api_paste']['filter:faultwrapper']['paste.filter_factory'] = 'designate.api.middleware:FaultWrapperMiddleware.factory'

default[:designate]['api_paste']['filter:authtoken']['paste.filter_factory'] = 'keystoneclient.middleware.auth_token:filter_factory'
default[:designate]['api_paste']['filter:authtoken']['service_protocol'] = 'http'
default[:designate]['api_paste']['filter:authtoken']['service_host'] = '127.0.0.1'
default[:designate]['api_paste']['filter:authtoken']['service_port'] = 5000
default[:designate]['api_paste']['filter:authtoken']['auth_host'] = '127.0.0.1'
default[:designate]['api_paste']['filter:authtoken']['auth_port'] = 35357
default[:designate]['api_paste']['filter:authtoken']['auth_protocol'] = 'http'
default[:designate]['api_paste']['filter:authtoken']['admin_tenant_name'] = 'service'
default[:designate]['api_paste']['filter:authtoken']['admin_user'] = 'designate'
default[:designate]['api_paste']['filter:authtoken']['admin_password'] = 'designate'
