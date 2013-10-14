module Geoservice
  module Layerable
    def layers(layer_name = nil)
      @full_layers ||= get(@url + '/layers')["layers"]

      return @full_layers if layer_name.nil?

      for i in 0...@full_layers.length
        return @full_layers[i] if layer_name == @full_layers[i]["name"]
      end
    end

    def [](layer_name)
      if self.metadata['layers'].nil?
        return self.metadata
      elsif layer_name.kind_of?(Integer)
        return self.metadata.layers[layer_name]
      else
        return self.layers(layer_name)
      end
      return nil
    end

    def legend
      @legend ||= get(@url + '/legend')
    end
  end
end
