module RSolr
  module Connection
    class NetHttp
      def get_request(url)
        Rails.logger.debug "SOLR GET: #{url}"    
        req = Net::HTTP::Get.new(url)
        req.basic_auth(@uri.user, @uri.password) if @uri.user && @uri.password
        self.connection.request(req)
      end

      def post_request(url, data, headers)
        Rails.logger.debug "SOLR POST: #{url}"    
        req = Net::HTTP::Post.new(url, headers)
        req.basic_auth(@uri.user, @uri.password) if @uri.user && @uri.password
        self.connection.request(req, data)
      end

      def get(path, params={})
        url = self.build_url(path, params)
        net_http_response = self.get_request(url)
        create_http_context(net_http_response, url, path, params)
      end

      def post(path, data, params={}, headers={})
        url = self.build_url(path, params)
        net_http_response = self.post_request(url, data, headers)
        create_http_context(net_http_response, url, path, params, data, headers)
      end
    end
  end
end