require 'helper'

describe Geoservice do
  context "getting a catalog" do 
    before :all do
      @catalog = Geoservice::Catalog.new(:host => "http://rmgsc.cr.usgs.gov/ArcGIS/rest/services/")
      @nhss_shakemaps = @catalog["nhss_shakemaps"]
    end
    it "should have services" do
      expect(@catalog.services).to have_at_least(1).items
      expect(@nhss_shakemaps["type"]).to eq("MapServer")
    end
  end
end
