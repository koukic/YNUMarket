# -*- encoding: utf-8 -*-
# stub: cloudinary 1.12.0 ruby lib

Gem::Specification.new do |s|
  s.name = "cloudinary".freeze
  s.version = "1.12.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nadav Soferman".freeze, "Itai Lahan".freeze, "Tal Lev-Ami".freeze]
  s.date = "2019-10-02"
  s.description = "Client library for easily using the Cloudinary service".freeze
  s.email = ["nadav.soferman@cloudinary.com".freeze, "itai.lahan@cloudinary.com".freeze, "tal.levami@cloudinary.com".freeze]
  s.homepage = "http://cloudinary.com".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.6".freeze
  s.summary = "Client library for easily using the Cloudinary service".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<aws_cf_signer>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<rest-client>.freeze, [">= 0"])
      s.add_development_dependency(%q<actionpack>.freeze, [">= 0"])
      s.add_development_dependency(%q<nokogiri>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 3.5"])
      s.add_development_dependency(%q<rails>.freeze, ["~> 5.2"])
      s.add_development_dependency(%q<rspec-rails>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubyzip>.freeze, ["<= 1.2.0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
    else
      s.add_dependency(%q<aws_cf_signer>.freeze, [">= 0"])
      s.add_dependency(%q<rest-client>.freeze, [">= 0"])
      s.add_dependency(%q<actionpack>.freeze, [">= 0"])
      s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 3.5"])
      s.add_dependency(%q<rails>.freeze, ["~> 5.2"])
      s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
      s.add_dependency(%q<rubyzip>.freeze, ["<= 1.2.0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<aws_cf_signer>.freeze, [">= 0"])
    s.add_dependency(%q<rest-client>.freeze, [">= 0"])
    s.add_dependency(%q<actionpack>.freeze, [">= 0"])
    s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 3.5"])
    s.add_dependency(%q<rails>.freeze, ["~> 5.2"])
    s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
    s.add_dependency(%q<rubyzip>.freeze, ["<= 1.2.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
  end
end