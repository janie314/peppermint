require "rake"
require "toml-rb"
require "rubocop/rake_task"

module Peppermint
end

load File.join __dir__, "shared.rake"

desc "development build"
task :build_dev do
  cargo = TomlRB.load_file("./Cargo.toml")
  ENV["PEPPERMINT_VERSION"] = cargo["package"]["version"] + "-" + `git rev-parse --short HEAD`.chop
  sh "cargo build"
end

desc "release build"
task :build_release do
  cargo = TomlRB.load_file("./Cargo.toml")
  ENV["PEPPERMINT_VERSION"] = cargo["package"]["version"] + "-" + `git rev-parse --short HEAD`.chop
  sh "cargo build -r"
end

desc "cargo fix"
task :fix do
  sh "cargo fix"
end

desc "install dependencies"
task deps: :deno_install do
  sh "command -v cargo || curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
end

desc "format this repo"
task fmt: [:deps, :deno_fmt] do
  sh "cargo fmt"
end
