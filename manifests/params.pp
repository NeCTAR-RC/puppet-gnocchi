# Parameters for puppet-gnocchi
#
class gnocchi::params {

  case $::osfamily {
    'RedHat': {
      $api_package_name     = 'openstack-gnocchi-api'
      $api_service_name     = 'openstack-gnocchi-api'
      $sqlite_package_name  = undef
    }
    'Debian': {
      $api_package_name     = 'gnocchi-api'
      $api_service_name     = 'gnocchi-api'
      $sqlite_package_name  = 'python-pysqlite2'
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem")
    }

  } # Case $::osfamily
}
