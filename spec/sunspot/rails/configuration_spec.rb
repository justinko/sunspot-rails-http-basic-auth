require 'spec_helper'

module Sunspot
  module Rails
    describe Configuration do
      let(:config) { subject }
      
      before do
        config.user_configuration = {
          'solr'        => { 'user' => 'the_user', 'password' => 'the_password' },
          'master_solr' => { 'user' => 'the_master_user', 'password' => 'the_master_password' }
        }
      end
      
      describe '#user' do
        specify { config.user.should eq('the_user') }
      end
      
      describe '#master_user' do
        specify { config.master_user.should eq('the_master_user') }
      end
      
      describe '#password' do
        specify { config.password.should eq('the_password') }
      end
      
      describe '#master_password' do
        specify { config.master_password.should eq('the_master_password') }
      end
      
    end
  end
end