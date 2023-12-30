require "rake"
require "rubocop/rake_task"

module Peppermint
end

load File.join __dir__, "shared.rake"

desc "lint your git"
task git: :gwenGPT

desc "format this repo"
task fmt: [:deps, :"rubocop:autocorrect_all", :deno_fmt]

desc "install dependencies"
task deps: :deno_install

