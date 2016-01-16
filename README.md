```ruby
  class Article < ActiveRecord::Base
    acts_as_hideable
  end

  Article.shown                                        # => Returns collection of articles with hidden => false
  Article.features.hideable?                           # => true
  Article.attribute_features[:hidden].hideable_toggle? # => true
```

## Gemfile
```ruby
gem 'activerecord-hideable', github: 'yivo/activerecord-hideable'
```