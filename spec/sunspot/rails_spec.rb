require 'spec_helper'

module Sunspot
  describe Rails do    
    describe '.master_config' do
      let(:configuration) do
        double 'configuration', :master_hostname => 'masterlocalhost',
                                :master_port => 6666,
                                :master_path => '/mastersolr',
                                :master_user => 'masteruser',
                                :master_password => 'masterpassword'
      end
      
      let(:master_config) { subject.send(:master_config, configuration) }
      
      specify { master_config.should be_an_instance_of(LightConfig::Configuration) }
      specify { master_config.solr.url.should eq('http://masteruser:masterpassword@masterlocalhost:6666/mastersolr') }
    end
    
    describe '.slave_config' do
      let(:configuration) do
        double 'configuration', :hostname => 'localhost',
                                :port => 5555,
                                :path => '/solr',
                                :user => 'user',
                                :password => 'password'
      end
      
      let(:slave_config) { subject.send(:slave_config, configuration) }
      
      specify { slave_config.should be_an_instance_of(LightConfig::Configuration) }
      specify { slave_config.solr.url.should eq('http://user:password@localhost:5555/solr') }
    end
  end
end          