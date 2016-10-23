# encoding: utf-8
# frozen_string_literal: true

require 'active_support/concern'
require 'active_record'

require 'activerecord-hideable/macro'
require 'activerecord-hideable/migration'

begin
  require 'essay'
  require 'activerecord-hideable/essay'
rescue LoadError
end

class ActiveRecord::Base
  include Hideable::Macro
end

class ActiveRecord::ConnectionAdapters::TableDefinition
  include Hideable::Migration
end
