module Geoservice
  module Featureable
    # Returns a specific feature from a layer
    # returns nil if the layer does not have any features
    def features(layer_idx, idx)
      get("#{@url}/#{layer_idx}/#{idx}")
    end
  end
end

