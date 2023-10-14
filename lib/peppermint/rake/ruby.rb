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

desc "install binary symlinks to ~/.local/bin"
task :install_local do
  proj_name = File.basename Dir.pwd
  symlink = File.join ENV["HOME"], ".local/bin/#{proj_name}"
  dir = File.join ENV["HOME"], ".local/bin"
  unless File.exist? symlink
    sh "mkdir", "-p", dir
    sh "ln", "-s", (File.join Dir.pwd, "bin", "#{proj_name}.rb"), symlink
  else 
    puts "symlink #{symlink} already seems to exist. doing nothing"
  end
end
