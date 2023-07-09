printf 'source "https://rubygems.org/"\n\ngroup :development do\n  gem "mutiny-devel", git: "http://git.mutiny.network/dev/mutiny-devel/"\nend\n' >Gemfile
printf '# delete one of these, then save and quit...\nrequire "mutiny-devel/rake/ruby"\nrequire "mutiny-devel/rake/rust"\n' >Rakefile
vi Rakefile
bundle
bundle exec rake update_devel_config
echo 'All done!'
