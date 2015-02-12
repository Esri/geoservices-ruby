require 'json'
require 'net/http'
module Geoservice
  module Base
    attr_accessor :metadata, :url, :token

    def get(path,options={})
      begin
        path.gsub!(/%username%/,@username || "")
        uri = URI.parse(path)
        params = {:f => "json"}.merge(options)
        params.merge(:token => @token) unless @token.nil? or @token.length == 0

        uri.query = URI.encode_www_form(params)

        res = Net::HTTP.get_response(uri)
        if res.is_a?(Net::HTTPSuccess)
          return JSON.parse(res.body)
        else
          throw res.status
        end
      rescue => e
        throw "Error in GeoServices: #{e.message}"
      end
    end
    def post(path, options={})
      secure = options.delete(:secure) || false
      path.gsub!(/%username%/,@username || "")
      uri = URI.parse(path)
      http = Net::HTTP.new(uri.host, secure ? 443 : uri.port)
      if(secure || uri.scheme == "https")
        http.use_ssl = true
        http.ssl_version = :TLSv1
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      request = Net::HTTP::Post.new(uri.request_uri)
      params = {:f => "json"}.merge(options)
      params.merge(:token => @token) unless @token.nil? or @token.length == 0
      request.body = URI.encode_www_form(params)

      res = http.request(request)
      if res.is_a?(Net::HTTPSuccess)
        return JSON.parse(res.body)
      else
        throw res.status
      end
    end
  end
end
