# TODO Refactor
# TODO Write Essay

require 'active_record'

class ActiveRecord::Base
  def self.has_toggles(*names)
    user_options = names.extract_options!

    names.each do |n|
      self.class.features.define(:toggleable)
      toggle = self.class.roles[n].get(:toggle)
      toggle.set(user_options.deep_dup)
      attr_default n.to_sym, toggle.default_value
    end
  end

  def self.hideable_toggle(attribute_name = :hidden, user_options = {})
    has_toggles(attribute_name)
    scope :shown, -> { where(Hash[attribute_name, false]) }
  end
end