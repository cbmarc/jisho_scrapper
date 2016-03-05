# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "Jisho2Anki"
  spec.version       = '1.0'
  spec.authors       = ["Marc Carné"]
  spec.email         = ["marc.carne@carviz.es"]
  spec.summary       = %q{Scraps Jisho online dictionary and converts it to an anki deck}
  spec.description   = %q{Scraps Jisho online dictionary and converts it to an anki deck}
  spec.homepage      = "https://github.com/cbmarc/jisho_scrapper"
  spec.license       = "GPL-3.0"

  spec.files         = Dir.glob("{bin,lib}/**/*") 
  spec.executables   = ['bin/bundle']
  spec.test_files    = ['tests/test_NAME.rb']
  spec.require_paths = ["lib"]
end
