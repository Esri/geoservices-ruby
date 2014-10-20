# GeoServices Ruby Library

This library is a simple wrapper around the GeoServices API. You can see the [GeoServices REST Specification](http://www.esri.com/industries/landing-pages/geoservices/geoservices) or the [Getting Started](https://services.arcgis.com/help/index.html?overview.html)

If you have not worked with GeoServices before, there are a few basic concepts to get started:

* _Service_ is the base and has many layers. This just holds metadata about who created the service, and the layers it contains.
* _Layer_ a layer is like a dataset with many features. You can query a Layer by spatial extent, attribute parameters and even perform aggregations with statistics and group by fields
* _Feature_ an individual location, or record, or row, is called a 'feature'. A feature has many attributes


## Install

Just install using Rubygems:

`gem install geoservices`


## Usage

```ruby
@service = Geoservice::MapService.new(:url => "http://rmgsc.cr.usgs.gov/ArcGIS/rest/services/nhss_weat/MapServer")
@service.layers[0]["name"] #=> "Watches/Warnings"
```

If calling to a secure service, include `:token => TOKEN` in the constructor.

### Query

To request data from a service, you need the URL to the service, the layer index, and then add optional query parameters.

To get all features:

```ruby
service_url = "https://services2.arcgis.com/1gVyYKfYgW5Nxb1V/ArcGIS/rest/services/MesaAzCouncilDistricts/FeatureServer"
service = Geoservice::MapService.new(url: service_url)
features = service.query(0)["features"]
puts features.length #=> 6
puts features.first["attributes"]
#=> {"OBJECTID"=>1, "DISTRICT"=>1, "DISTRICTS"=>"DISTRICT 1", "FACILITYID"=>nil, "GLOBALID"=>"1c14efc5-cef2-4757-a9f5-8be2c3eeab66"}
```

You can also perform spatial queries:

```ruby
params = {
  geometry: [-111.835,33.42].join(','),
  geometryType: "esriGeometryPoint",
  inSR: 4326,
  spatialRel: "esriSpatialRelIntersects",
  units: "esriSRUnit_Meter",
  returnGeometry: false
}
query = service.query(0, params)
puts query["features"]
#=> {"attributes"=>{"OBJECTID"=>4, "DISTRICT"=>4, "DISTRICTS"=>"DISTRICT 4", "FACILITYID"=>nil, "GLOBALID"=>"c9f2f6f1-d210-4332-8610-8ad176ab9d07"}}
```

### Testing

geoservices-ruby uses RSpec for tests. 

    $ rake rspec

## Requirements

* Ruby

## Resources

* [GeoServices REST Specification](http://www.esri.com/industries/landing-pages/geoservices/geoservices)
* [GeoServices Getting Started](https://services.arcgis.com/help/index.html?overview.html)

## Licensing
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

A copy of the license is available in the repository's [license.txt](./license.txt) file.

[](Esri Tags: ArcGIS Ruby API GeoServices Public)
[](Esri Language: Ruby)
