require "rspec/core/rake_task"
require "yard"
require_relative "gwenGPT"

module Peppermint
  class Ruby < LangEnv
    def initialize
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

    def install_lang
      res = system("git", "clone", "https://github.com/rbenv/rbenv.git",
        File.join(ENV["HOME"], ".rbenv"))
      if !res
        puts "problem..."
        return
      end
      res = system("git", "clone", "https://github.com/rbenv/ruby-build.git",
        File.join(ENV["HOME"], ".rbenv", "plugins", "ruby-build"))
      if !res
        puts "problem..."
        return
      end
      puts "Now put this in your bashrc:\n", <<~BLOCK
        eval "$(~/.rbenv/bin/rbenv init - bash)"
      BLOCK
    end

    # TODO copy to gitroot, not pwd
    def cp_files
      [".solargraph.yml", ".rubocop.yml", ".standard.yml", ".rspec",
        ".ruby-version"].each do |filename|
        FileUtils.cp (File.expand_path File.join __dir__, "..", "..", "..", filename), Dir.pwd
      end
    end
  end
end
