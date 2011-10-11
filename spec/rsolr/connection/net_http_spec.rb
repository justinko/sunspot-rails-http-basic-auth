# require 'spec_helper'
# require 'fakeweb'
# 
# module RSolr
#   module Connection
#     describe NetHttp do
#       
#       describe '#get' do
#         context 'with valid basic auth credentials' do
#           before do
#             FakeWeb.register_uri :get,
#                                  'http://user:pass@127.0.0.1:8983/solr/select?q=a',
#                                  :body => 'Authorized'
#           end
# 
#           let(:net_http) { described_class.new(:url => 'http://user:pass@127.0.0.1:8983/solr') }
# 
#           let(:result) { net_http.get('/select', :q => 'a') }
# 
#           specify { result[:data].should be_nil }
#           specify { result[:body].should eq('Authorized') }
#           specify { result[:status_code].should eq(200) }
#           specify { result[:path].should eq('/select') }
#           specify { result[:url].should eq('http://127.0.0.1:8983/solr/select?q=a') }
#           specify { result[:headers].should be_empty }
#           specify { result[:params].should eq({:q => 'a'}) }
#           specify { result[:message].should eq('OK') }
#         end
#         
#         context 'with invalid basic auth credentials' do
#           before do
#             FakeWeb.register_uri :get,
#                                  'http://user:pass@127.0.0.1:8983/solr/select?q=a',
#                                  :body => 'Unauthorized',
#                                  :status => [401, 'Unauthorized']
#           end
#         
#           let(:net_http) { described_class.new(:url => 'http://user:pass@127.0.0.1:8983/solr') }
#         
#           let(:result) { net_http.get('/select', :q => 'a') }
#           
#           specify { result[:data].should be_nil }
#           specify { result[:body].should eq('Unauthorized') }
#           specify { result[:status_code].should eq(401) }
#           specify { result[:path].should eq('/select') }
#           specify { result[:url].should eq('http://127.0.0.1:8983/solr/select?q=a') }
#           specify { result[:headers].should be_empty }
#           specify { result[:params].should eq({:q => 'a'}) }
#           specify { result[:message].should eq('Unauthorized') }
#         end
#       end
#         
#       describe '#post' do
#         context 'with valid basic auth credentials' do
#           before do
#             FakeWeb.register_uri :post,
#                                  'http://user:pass@127.0.0.1:8983/solr/update',
#                                  :body => 'Authorized'
#           end
# 
#           let(:net_http) { described_class.new(:url => 'http://user:pass@127.0.0.1:8983/solr') }
# 
#           let(:result) { net_http.post('/update', '<rollback/>') }
# 
#           specify { result[:data].should eq('<rollback/>') }
#           specify { result[:body].should eq('Authorized') }
#           specify { result[:status_code].should eq(200) }
#           specify { result[:path].should eq('/update') }
#           specify { result[:url].should eq('http://127.0.0.1:8983/solr/update') }
#           specify { result[:headers].should be_empty }
#           specify { result[:params].should be_empty }
#           specify { result[:message].should eq('OK') }
#         end
#         
#         context 'with invalid basic auth credentials' do
#           before do
#             FakeWeb.register_uri :post,
#                                  'http://user:pass@127.0.0.1:8983/solr/update',
#                                  :body => 'Unauthorized',
#                                  :status => [401, 'Unauthorized']
#           end
# 
#           let(:net_http) { described_class.new(:url => 'http://user:pass@127.0.0.1:8983/solr') }
# 
#           let(:result) { net_http.post('/update', '<rollback/>') }
# 
#           specify { result[:data].should eq('<rollback/>') }
#           specify { result[:body].should eq('Unauthorized') }
#           specify { result[:status_code].should eq(401) }
#           specify { result[:path].should eq('/update') }
#           specify { result[:url].should eq('http://127.0.0.1:8983/solr/update') }
#           specify { result[:headers].should be_empty }
#           specify { result[:params].should be_empty }
#           specify { result[:message].should eq('Unauthorized') }
#         end
#       end
#       
#     end
#   end
# end