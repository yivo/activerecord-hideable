# encoding: utf-8
# frozen_string_literal: true

require 'active_support/concern'
require 'active_record'
require 'activerecord-traits'

require 'activerecord-hideable/macro'
require 'activerecord-hideable/column_types'

begin
  require 'essay'
  require 'activerecord-hideable/essay'
rescue LoadError
end

module Hideable
  class << self
    attr_accessor :default_column
  end

  self.default_column = :hidden
end

class ActiveRecord::Base
  include Hideable::Macro
end

class ActiveRecord::ConnectionAdapters::TableDefinition
  include Hideable::Migration
end
