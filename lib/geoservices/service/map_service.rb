module Geoservice
  class MapService
    include Geoservice::Base    
    include Geoservice::Layerable
    include Geoservice::Queryable
    
    attr_accessor :metadata, :url
    
    def initialize(options)
      # @layers = Layer.new(
      @url = options[:url]
      @metadata = get(@url)
    end
  end
end
