Gem::Specification.new do |s|
  s.name = "geoservices"
  s.version = "0.0.12"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrew Turner"]
  s.autorequire = %q{arcgis}
  s.date = %q{2015-02-11}
  s.email = %q{aturner@esri.com}
  s.files = ["LICENSE.txt", "README.md","lib/geoservices.rb"] + Dir["lib/geoservices/**/*.rb"]
  s.require_paths = ["lib"]
  s.rubygems_version = s.version
  s.summary = %q{A simple wrapper for GeoServices API}
end
