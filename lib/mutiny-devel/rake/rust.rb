require "rake"
require "toml-rb"
require "rubocop/rake_task"

module MutinyDevel
end

load File.join __dir__, "shared.rake"

desc "development build"
task :build_dev do
  cargo = TomlRB.load_file("./Cargo.toml")
  ENV["MUTINY_VERSION"] = cargo["package"]["version"] + "-" + `git rev-parse --short HEAD`.chop
  sh "cargo build"
end

desc "release build"
task :build_release do
  cargo = TomlRB.load_file("./Cargo.toml")
  ENV["MUTINY_VERSION"] = cargo["package"]["version"] + "-" + `git rev-parse --short HEAD`.chop
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
task fmt: [:deps, :"rubocop:autocorrect_all", :deno_fmt] do
  sh "cargo fmt"
end

desc "build and install mutiny to $HOME/.local/bin"
task install_local: :build_release do
  sh "mkdir -p ~/.local/bin/"
  sh "cp -v ./target/release/mutiny ~/.local/bin/mutiny"
end

desc "build and install mutiny to /usr/local/bin/"
task install_global: :build_release do
  sh "mkdir -p ~/.local/bin/"
  sh "sudo cp -v ./target/release/mutiny /usr/local/bin/mutiny"
end
