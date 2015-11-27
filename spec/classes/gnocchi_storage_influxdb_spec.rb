#
# Unit tests for gnocchi::storage::influxdb
#
require 'spec_helper'

describe 'gnocchi::storage::influxdb' do

  let :params do
    {}
  end

  shared_examples 'gnocchi storage influxdb' do

    context 'with default parameters' do
      it 'configures gnocchi-api with default parameters' do
        is_expected.to contain_gnocchi_config('storage/driver').with_value('influxdb')
        is_expected.to contain_gnocchi_config('storage/influxdb_host').with_value('localhost')
        is_expected.to contain_gnocchi_config('storage/influxdb_port').with_value(8086)
        is_expected.to contain_gnocchi_config('storage/influxdb_database').with_value('gnocchi')
        is_expected.to contain_gnocchi_config('storage/influxdb_username').with_value('root')
      end
    end
  end

  context 'on Debian platforms' do
    let :facts do
      {
        :osfamily       => 'Debian'
      }
    end

    it_configures 'gnocchi storage influxdb'
  end

  context 'on RedHat platforms' do
    let :facts do
      {
        :osfamily       => 'RedHat'
      }
    end

    it_configures 'gnocchi storage influxdb'
  end

end
