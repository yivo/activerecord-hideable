# encoding: utf-8
# frozen_string_literal: true

module Hideable
  module Migration
    def toggle(options = {})
      column :hidden, :boolean, options.reverse_merge!(null: false, default: false, index: true)
    end
  end
end
