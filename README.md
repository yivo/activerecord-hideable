```ruby
  class Article < ActiveRecord::Base
    hideable
  end

  Article.shown                                     # => Returns collection of articles with hidden => false
  Article.features.hideable?                        # => true
  Article.attribute_roles[:hidden].toggle?          # => true
  Article.attribute_roles[:hidden].hideable_toggle? # => true
```

## Gemfile
```ruby
gem 'activerecord-toggleable', github: 'yivo/activerecord-toggleable'
```
