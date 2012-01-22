class RSolr::Connection
  alias_method :setup_raw_request_original, :setup_raw_request

  def setup_raw_request request_context
    raw_request = setup_raw_request_original(request_context)    
    if request_context[:uri].user and request_context[:uri].password
      raw_request.basic_auth(request_context[:uri].user, request_context[:uri].password) 
    end
    raw_request
  end

end