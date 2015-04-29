module Geoservice
  module Queryable

    # Perform a query call for the Geoservice
    # returns nil if the layer does not have the Capability: Query
    def query(layer_idx=0, options={})
      return nil unless self.metadata["capabilities"] =~ /Query/
      options[:where] ||= "1=1"
      options[:outFields] ||= "*"
      post("#{@url}/#{layer_idx}/query", options)
    end

    # Returns the number of features expected from a query call for the Geoservice
    # returns nil if the layer does not have the Capability: Query
    def count(layer_idx=0, options={})
      return nil unless self.metadata["capabilities"] =~ /Query/
      # Current Version is not returned at lower than 10.1
      unless self.metadata['currentVersion'].nil?
        query(layer_idx, options.merge(:returnCountOnly => true))
      else
        # Neither returnCountOnly nor currentVersion are supported for layers @ lower than 10.0 SP1 
        # http://resources.arcgis.com/en/help/rest/apiref/
        # So request all the object ids and count them up
        response = query(layer_idx, options.merge(:where => '1=1', :returnIdsOnly => true))
        return {'count' => response['objectIds'].length}
      end
    end
  end
end
