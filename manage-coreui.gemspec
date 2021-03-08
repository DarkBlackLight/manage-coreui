require_relative "lib/manage/coreui/version"

Gem::Specification.new do |spec|
  spec.name        = "manage-coreui"
  spec.version     = Manage::Coreui::VERSION
  spec.authors     = ["liwuqi95"]
  spec.email       = ["wuqi.li@mail.utoronto.ca"]
  spec.homepage    = "TODO"
  spec.summary     = "TODO: Summary of Manage::Coreui."
  spec.description = "TODO: Description of Manage::Coreui."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.3"
end
