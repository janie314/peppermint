require "rspec/core/rake_task"
require "yard"
require_relative "gwenGPT"

RSpec::Core::RakeTask.new(:spec)

RuboCop::RakeTask.new do |t|
  t.requires << "rubocop-rake"
end

YARD::Rake::YardocTask.new do |t|
  t.files = ["lib/**/*.rb"]
  t.options = ["--any", "--extra", "--opts"]
  t.stats_options = ["--list-undoc"]
end

# desc "install deno idempotently"
task :deno_install do
  sh "command -v deno || curl -fsSL https://deno.land/x/install/install.sh | sh"
end

# desc "run deno fmt"
task :deno_fmt do
  sh <<~SHELL
    find . \\( -not -path '*target*' \\) \
      -and \\( -not -path '*node_modules*' \\) \
      -and \\( -not -path '*/doc' \\) \
      -and \\( -name '*.json' -o -name '*.md' -o -name '*.js' \
        -o -name '*.ts' -o -name '*.jsx' -o -name '*.tsx' \\) \
      -and \\( -not -name 'project.json' \\) \
      -and \\( -not -name 'personal.json' \\) \
      -and -type f | xargs -r deno fmt
  SHELL
end

