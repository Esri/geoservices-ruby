module Geoservice
  class FeatureService
    include Geoservice::Base
    include Geoservice::Layerable
    include Geoservice::Queryable
    include Geoservice::Featureable


    def initialize(options)
      @url = options[:url]
      @token = options.delete(:token)
      @metadata = get(@url)
    end
  end
end
