# mutiny-devel

_"A gem of a dev environment."_

# Installation

1. Put this in your `Gemfile`:

```ruby
group :development do
  gem "mutiny-devel", git: "http://git.mutiny.network/mutiny/devel/"
end
```

2. Run:

```bash
bundle
```

3. Put one of the following in your `Rakefile` as appropriate.

```ruby
require "mutiny-devel/rake/ruby"
```

or

```ruby
require "mutiny-devel/rake/rust"
```

4. Pull down config files.

```bash
bundle exec rake update_devel_config
```

# Update

```bash
bundle update mutiny-devel
bundle exec rake update_devel_config
```

# Usage

```bash
bundle exec rake --tasks
```
