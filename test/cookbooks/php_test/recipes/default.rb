apt_update 'update' if platform_family?('debian')

include_recipe 'php'

# create a test pool
php_fpm_pool 'test-pool' do
  action :install
  not_if { node['platform_family'] == 'rhel' && node['platform_version'].to_i < 6 }
end
