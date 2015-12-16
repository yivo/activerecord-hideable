require 'active_record'
require 'activerecord-toggleable/migration'
require 'activerecord-toggleable/extension'
require 'activerecord-toggleable/essay' if defined?(Essay)

ActiveRecord::Base.include(Toggleable::Extension)