# peppermint

_"A gem of a dev environment."_

# Installation

1. Put this in your `Gemfile`:

```ruby
group :development do
  gem "peppermint", git: "https://github.com/janie314/peppermint"
end
```

2. Run:

```bash
bundle
```

3. Put one of the following in your `Rakefile` as appropriate.

```ruby
require "peppermint/rake/ruby"
```

or

```ruby
require "peppermint/rake/rust"
```

4. Pull down config files.

```bash
bundle exec rake update_devel_config
```

# Update

```bash
bundle update peppermint
bundle exec rake update_devel_config
```

# Usage

```bash
bundle exec rake --tasks
```
