require 'helper'

describe Geoservice do
  context "getting a feature service" do
    before :all do
      @service = Geoservice::FeatureService.new(:url => "http://services.arcgis.com/mUBRaZ0tjo91ahzZ/arcgis/rest/services/MS_Gas_Stations/FeatureServer")
    end
    it "should have a serviceDescription" do
      expect(@service.metadata["serviceDescription"]).to eq("MS_Gas_Stations")
    end
    it "should have layers" do
      expect(@service.layers.length).to eq(1)
    end
    it "should have layer index" do
      expect(@service.layers[0]['name']).to eq("gas_stations")
      expect(@service.layers("gas_stations")['name']).to eq("gas_stations")
    end
    it "should be queryable" do
      expect(@service.query(0)["features"].length).to eq(1000)
    end
    it "should be countable" do
      expect(@service.count(0)["count"]).to eq(1374)
    end
    it "should have features" do
      expect(@service.features(0,0).length).to eq(1)
    end
  end
  context "getting a map service" do
    before :all do
      @service = Geoservice::MapService.new(:url => "http://rmgsc.cr.usgs.gov/ArcGIS/rest/services/nhss_weat/MapServer")
    end
    it "should have a mapName" do
      expect(@service.metadata["mapName"]).to eq("Layers")
    end
    it "should have layers" do
      expect(@service.layers.length).to eq(2)
    end
    it "should have layer index" do
      expect(@service.layers[0]['name']).to eq("Watches/Warnings")
      expect(@service.layers("Watches/Warnings")['name']).to eq("Watches/Warnings")
    end
  end
end
