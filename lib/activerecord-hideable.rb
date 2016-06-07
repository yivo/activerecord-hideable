# frozen_string_literal: true
require 'active_support/all'
require 'active_record'
require 'attribute-defaults'
require 'activerecord-traits'

require 'activerecord-hideable/macro'
require 'activerecord-hideable/column_types'
require 'activerecord-hideable/essay' if defined?(Essay)

module Hideable
  class << self
    attr_accessor :default_column
  end

  self.default_column = :hidden
end

module ActiveRecord
  Base.include Hideable::Macro
  ConnectionAdapters::TableDefinition.include Hideable::ColumnTypes
end
