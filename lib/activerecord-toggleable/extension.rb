module Toggleable
  module Extension
    extend ActiveSupport::Concern

    included do
      class_attribute :hideable_options, instance_accessor: false, instance_predicate: false
      class_attribute :toggles_options,  instance_accessor: false, instance_predicate: false

      self.hideable_options = {}
      self.toggles_options  = {}
    end

    module ClassMethods
      def hideable(attr_name = :hidden, **options)
        toggle_attr(attr_name, options)

        scope :shown, -> { where(attr_name => false) }
        self.hideable_options = options.merge(toggle: attr_name)
      end

      def toggle_attr(*attr_names)
        options         = attr_names.extract_options!
        default         = options.fetch(:default, nil)
        include_default = !!default == default

        if include_default
          attr_names.each { |attr_name| attr_default(attr_name, default) }
        end

        mark_as_toggle(*attr_names, options)
      end

      def mark_as_toggle(*attr_names)
        options = attr_names.extract_options!
        self.toggles_options =
          attr_names.each_with_object(self.toggles_options.deep_dup) do |attr_name, memo|
            (memo[attr_name.to_sym] ||= {}).merge!(options)
          end
      end
    end
  end
end



