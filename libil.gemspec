require './lib/libil'

Gem::Specification.new do |s|
  s.name    = "libil"
  s.version = Libil::GEM_VERSION
  s.date    = "2014-09-22"
  s.summary = "Library for converting string to 'Basa Walikan Jogja and Malang'"
  s.description = <<-DESC
  Libil is a library and command line tools to implement Basa Walikan, Jogja and Malang Style
  DESC
  s.authors = ["Didiet Noor"]
  s.email   = "lynxluna@gmail.com"
  s.files   = ["lib/libil.rb", "bin/libil"]
  s.homepage = "http://github.com/lynxluna/libil"
  s.license = "MIT"
  s.executables << 'libil'
end
