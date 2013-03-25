module Geoservice
  class FeatureService
    def initialize(name)
      puts get("/#{name}/FeatureServer")
      # @layers = Layer.new(
    end
  end
  
  class Layer
    def initialize(idx,name)
      @name = name
      @index = idx
    end
    def query(options = {})
      get('/')
    end
    
  end
  
end
