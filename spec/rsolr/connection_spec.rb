require 'spec_helper'
require 'fakeweb'

describe RSolr::Connection do
  describe '#get' do
    context 'with valid basic auth credentials' do
      before do
        FakeWeb.register_uri :get,
                             'http://user:pass@127.0.0.1:8983/solr/select?q=a&wt=ruby',
                             :body => "{'result' => 'Authorized'}"
      end

      let(:client) { RSolr::Client.new(RSolr::Connection.new, :url => 'http://user:pass@127.0.0.1:8983/solr') }
      let(:result) { client.get('/select', :params => {:q => 'a'}) }

      specify { result.response[:data].should be_nil }
      specify { result.response[:body].should eq("{'result' => 'Authorized'}") }
      specify { result.response[:status].should eq(200) }
      specify { result.request[:path].should eq('/select') }
      specify { result.request[:uri].to_s.should eq('http://user:pass@127.0.0.1:8983/solr/select?q=a&wt=ruby') }
      specify { result.response[:headers].should be_empty }
      specify { result.request[:params].should eq({:q => 'a', :wt => :ruby}) }
    end

    context 'with invalid basic auth credentials' do
      before do
        FakeWeb.register_uri :get,
                             'http://user:pass@127.0.0.1:8983/solr/select?q=a&wt=ruby',
                             :body => 'Unauthorized',
                             :status => [401, 'Unauthorized']
      end

      let(:client) { RSolr::Client.new(RSolr::Connection.new, :url => 'http://user:pass@127.0.0.1:8983/solr') }
      let(:result) { client.get('/select', :params => {:q => 'a'}) }

      specify { result.response[:data].should be_nil }
      specify { result.response[:body].should eq('Unauthorized') }
      specify { result.response[:status].should eq(401) }
      specify { result.request[:path].should eq('/select') }
      specify { result.request[:uri].to_s.should eq('http://user:pass@127.0.0.1:8983/solr/select?q=a&wt=ruby') }
      specify { result.response[:headers].should be_empty }
      specify { result.request[:params].should eq({:q => 'a', :wt => :ruby}) }
    end
  end
  
  describe '#post' do
    context 'with valid basic auth credentials' do
      before do
        FakeWeb.register_uri :post,
                             'http://user:pass@127.0.0.1:8983/solr/update?wt=ruby',
                             :body => "{'result' => 'Authorized'}"
      end
  
      let(:client) { RSolr::Client.new(RSolr::Connection.new, :url => 'http://user:pass@127.0.0.1:8983/solr') }
      let(:result) { client.post('/update', :data => '<rollback/>') }
  
      specify { result.request[:data].should eq('<rollback/>') }
      specify { result.response[:body].should eq("{'result' => 'Authorized'}") }
      specify { result.response[:status].should eq(200) }
      specify { result.request[:path].should eq('/update') }
      specify { result.request[:uri].to_s.should eq('http://user:pass@127.0.0.1:8983/solr/update?wt=ruby') }
      specify { result.response[:headers].should be_empty }
      specify { result.request[:params].should eq({:wt => :ruby}) }
    end
  
    context 'with invalid basic auth credentials' do
      before do
        FakeWeb.register_uri :post,
                             'http://user:pass@127.0.0.1:8983/solr/update?wt=ruby',
                             :body => 'Unauthorized',
                             :status => [401, 'Unauthorized']
      end

      let(:client) { RSolr::Client.new(RSolr::Connection.new, :url => 'http://user:pass@127.0.0.1:8983/solr') }
      let(:result) { client.post('/update', :data => '<rollback/>') }

      specify { result.request[:data].should eq('<rollback/>') }
      specify { result.response[:body].should eq('Unauthorized') }
      specify { result.response[:status].should eq(401) }
      specify { result.request[:path].should eq('/update') }
      specify { result.request[:uri].to_s.should eq('http://user:pass@127.0.0.1:8983/solr/update?wt=ruby') }
      specify { result.response[:headers].should be_empty }
      specify { result.request[:params].should eq({:wt => :ruby}) }
    end
  end
end