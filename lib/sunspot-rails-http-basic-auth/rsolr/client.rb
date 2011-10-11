class RSolr::Client
  alias_method :adapt_response_original, :adapt_response

  def adapt_response request, response
    if response[:status] == 401
      result = response[:body]
      result.extend Context
      result.request = request
      result.response = response
      return result
    else
      adapt_response_original(request, response)
    end
  end

end