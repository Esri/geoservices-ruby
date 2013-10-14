module Geoservice
  class Catalog
    include Geoservice::Base
    attr_reader :metadata, :services, :version

    def initialize(options={})
      @host = options[:host]
      @metadata = get(@host)
      @services = @metadata['services']
      @version  = @metadata['currentVersion']
    end

    def [](service_name)
      if service_name.kind_of?(Integer)
        return self.services[service_name]
      else
        for i in 0..self.services.length
          return services[i] if service_name == services[i]["name"]
        end
      end
      return nil
    end
  end
end
