# -*- encoding: utf-8 -*-
# stub: bulma-rails 0.7.5 ruby lib

Gem::Specification.new do |s|
  s.name = "bulma-rails".freeze
  s.version = "0.7.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Joshua Jansen".freeze]
  s.date = "2019-05-25"
  s.description = "A modern CSS framework based on Flexbox".freeze
  s.email = ["joshuajansen88@gmail.com".freeze]
  s.homepage = "https://github.com/joshuajansen/bulma-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.6".freeze
  s.summary = "This gem adds the bulma.io assets to your asset pipeline so you can import them in your Rails project.".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sassc>.freeze, ["~> 2.0"])
    else
      s.add_dependency(%q<sassc>.freeze, ["~> 2.0"])
    end
  else
    s.add_dependency(%q<sassc>.freeze, ["~> 2.0"])
  end
end
