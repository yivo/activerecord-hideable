module Essay
  class ModelFeatures
    def hideable?
      model_class.hideable_options.any?
    end
  end

  class AttributeRoles
    def toggle?
      model_class.toggles_options.key?(attribute_name)
    end

    def hideable_toggle?
      model_class.hideable_options[:toggle] == attribute_name
    end
  end
end