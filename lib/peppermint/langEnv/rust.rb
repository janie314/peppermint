require "rspec/core/rake_task"
require "yard"
require_relative "gwenGPT"

module Peppermint
  class Rust < LangEnv
    # see documentation for corresponding superclass method
    def initialize
      super.initialize
      RSpec::Core::RakeTask.new(:spec)

      RuboCop::RakeTask.new do |t|
        t.requires << "rubocop-rake"
      end

      YARD::Rake::YardocTask.new do |t|
        t.files = ["lib/**/*.rb"]
        t.options = ["--any", "--extra", "--opts"]
        t.stats_options = ["--list-undoc"]
      end
    end

    # see documentation for corresponding superclass method
    def install_lang
      super.install_lang
      system "command -v cargo || curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
    end

    # TODO copy to gitroot, not pwd
    # see documentation for corresponding superclass method
    def cp_files
      super.cp_files
      [".solargraph.yml", ".rubocop.yml", ".standard.yml", ".rspec",
        ".ruby-version"].each do |filename|
        FileUtils.cp (File.expand_path File.join __dir__, "..", "..", "..", filename), Dir.pwd
      end
    end
  end
end
