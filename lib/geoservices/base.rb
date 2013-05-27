require 'json'
require 'net/http'
module Geoservice
  module Base

    def get(path,options={})
      path.gsub!(/%username%/,@username || "")
      uri = URI.parse(path)
      uri.query = URI.encode_www_form({:f => "json", :token => @token || nil}.merge(options))

      res = Net::HTTP.get_response(uri)
      if res.is_a?(Net::HTTPSuccess)
        return JSON.parse(res.body)
      else
        throw res.status
      end
    end
    def post(path, options={})
      secure = options.delete(:secure) || false
      path.gsub!(/%username%/,@username || "")
      uri = URI.parse(@host + path)
      http = Net::HTTP.new(uri.host, secure ? 443 : uri.port)
      if(secure)
        http.use_ssl = true
        http.ssl_version = :SSLv3
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      request = Net::HTTP::Post.new(uri.request_uri)
      params = {:f => "json", :token => @token}.merge(options)
      request.set_multipart_form_data(params)
  
      res = http.request(request)
      if res.is_a?(Net::HTTPSuccess)
        return JSON.parse(res.body)
      else
        throw res.status
      end   
    end
  end
end
