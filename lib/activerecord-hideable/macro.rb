# encoding: utf-8
# frozen_string_literal: true

module Hideable
  module Macro
    extend ActiveSupport::Concern

    included { class_attribute :hideable }

    module ClassMethods
      #
      # class Article < ActiveRecord::Base
      #   acts_as_hideable
      # end
      #
      def acts_as_hideable
        scope :hidden, -> { where(hidden: true)  }
        scope :shown,  -> { where(hidden: false) }

        define_method(:shown?) { !hidden }

        self.hideable = true
        nil
      end
    end
  end
end
