set -e
printf 'source "https://rubygems.org/"\n\ngroup :development do\n  gem "peppermint", git: "https://github.com/janie314/peppermint"\nend\n' >Gemfile
printf '# delete one of these, then save and quit...\nrequire "peppermint/rake/ruby"\nrequire "mutiny-devel/rake/rust"\n' >Rakefile
vi Rakefile
bundle
bundle exec rake update_devel_config
echo 'All done!'
