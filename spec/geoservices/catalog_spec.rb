require 'helper'

describe Geoservice do
  context "getting a catalog" do 
    before :all do
      @palmsprings = Geoservice.new(:host => "http://services.arcgis.com/KoSFrpDKoNPM2tba/ArcGIS/rest/services/")
      @cityparks = @palmsprings["CityParks"]
      puts @cityparks.inspect
      
      # @cityparks.is_a?(FeatureService)
      # @cityparks.layers[0].where(:name => 'CITY OF BLYTHE').first
      
    end
    describe "viewing services" do
      before :all do
        @catalog = @online.catalog
        puts "Catalog"
        puts @catalog
      end
      it "should have services" do
        expect(@catalog.services).to have_at_least(1).items
      end

    end
    
  end
end
