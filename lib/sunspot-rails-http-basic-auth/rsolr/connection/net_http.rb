# module RSolr
#   module Connection
#     class NetHttp
# 
#       def get(path, params={})
#         url = build_url(path, params)
#         net_http_response = basic_auth_get_request(url)
#         create_http_context(net_http_response, url, path, params)
#       end
# 
#       def post(path, data, params={}, headers={})
#         url = build_url(path, params)
#         net_http_response = basic_auth_post_request(url, data, headers)
#         create_http_context(net_http_response, url, path, params, data, headers)
#       end
# 
#     private
# 
#       def basic_auth_get_request(url)
#         rails_logger "SOLR GET: #{url}"
#         req = add_basic_auth(Net::HTTP::Get.new(url))
#         connection.request(req)
#       end
# 
#       def basic_auth_post_request(url, data, headers)
#         rails_logger "SOLR POST: #{url}" 
#         req = add_basic_auth(Net::HTTP::Post.new(url, headers))
#         connection.request(req, data)
#       end
# 
#       def add_basic_auth(req)
#         req.basic_auth(uri.user, uri.password) if uri.user and uri.password
#         req
#       end
# 
#       def rails_logger(text)
#         Rails.logger.debug(text) if defined?(Rails)
#       end
# 
#     end
#   end
# end