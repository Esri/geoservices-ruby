module Geoservice
  module Queryable

    # Perform a query call for the Geoservice
    # returns nil if the layer does not have the Capability: Query
    def query(layer_idx=0, options={})
      return nil unless self.metadata["capabilities"] =~ /Query/
      options[:where] ||= "1=1"
      options[:outFields] ||= "*"
      get("#{@url}/#{layer_idx}/query", options)
    end

    # Returns the number of features expected from a query call for the Geoservice
    # returns nil if the layer does not have the Capability: Query
    def count(layer_idx=0, options={})
      return nil unless self.metadata["capabilities"] =~ /Query/
      query(layer_idx, options.merge(:returnCountOnly => true))
    end
  end
end
