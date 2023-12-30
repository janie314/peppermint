# frozen_string_literal: true

### BEGIN: DO NOT EDIT ###
proj = File.basename(__FILE__).split(".")[0]
require_relative "lib/#{proj}/version"
lib = File.expand_path(File.join(__dir__, "./lib"))
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
### END: DO NOT EDIT ###

Gem::Specification.new do |spec|
  # gem metadata
  spec.name = proj
  spec.version = Peppermint::VERSION
  spec.authors = ["'j'"]
  spec.email = ["'pub@janie.page'"]
  spec.summary = "A Gem of a dev environment"
  spec.homepage = "https://github.com/janie314/peppermint"
  spec.metadata["homepage_uri"] = spec.homepage

  # dependencies
  spec.required_ruby_version = ">= 3.2.2"
  spec.add_dependency "toml-rb"

  ### BEGIN: DO NOT EDIT ###
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git
        .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  ### END: DO NOT EDIT ###
end
