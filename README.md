# GeoServices Ruby Library

This library is a simple wrapper around the GeoServices API.


## Instructions

```ruby
@service = Geoservice::MapService.new(:url => "http://rmgsc.cr.usgs.gov/ArcGIS/rest/services/nhss_weat/MapServer")
@service.layers[0]["name"] #=> "Watches/Warnings"
```

If calling to a secure service, include `:token => TOKEN` in the constructor.

### Testing

geoservices-ruby uses RSpec for tests. 

    $ rake rspec

## Requirements

* Ruby 1.9.3

## Resources

* [Esri GeoServices REST Specification](http://www.esri.com/industries/landing-pages/geoservices/geoservices)


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
