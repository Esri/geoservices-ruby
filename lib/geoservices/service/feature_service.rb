module Geoservice
  class FeatureService
    include Geoservice::Base
    include Geoservice::Layerable
    include Geoservice::Queryable


    def initialize(options)
      # @layers = Layer.new(
      @url = options[:url]
      @token = options.delete(:token)
      @metadata = get(@url)
    end
  end
end
