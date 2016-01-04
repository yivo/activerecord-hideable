require 'active_support/all'
require 'active_record'
require 'attribute-defaults'
require 'activerecord-traits'

require 'activerecord-toggleable/migration'
require 'activerecord-toggleable/extension'
require 'activerecord-toggleable/essay' if defined?(Essay)

ActiveRecord::Base.include(Toggleable::Extension)