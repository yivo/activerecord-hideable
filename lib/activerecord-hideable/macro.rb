# frozen_string_literal: true
module Hideable
  module Macro
    extend ActiveSupport::Concern

    module ClassMethods
      #
      # class Article < ActiveRecord::Base
      #   acts_as_hideable toggle: :hidden
      # end
      #
      def acts_as_hideable(options = {})
        options.reverse_merge!(toggle: Hideable.default_column)
        toggle = options[:toggle]

        scope :hidden, -> { where(toggle => true)  }
        scope :shown,  -> { where(toggle => false) }

        define_method(:shown?)  {  !self[toggle] }
        define_method(:hidden?) { !!self[toggle] } unless toggle == :hidden

        unless respond_to?(:hideable_options)
          class_attribute :hideable_options, instance_accessor: false, instance_predicate: false
        end

        self.hideable_options = options
      end
    end
  end
end
