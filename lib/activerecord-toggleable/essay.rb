module Essay
  class ModelFeatures
    def hideable?
      model_class.hideable_options.any?
    end

    serialize do
      { is_hideable: hideable? }
    end
  end

  class AttributeFeatures
    def toggle?
      model_class.toggles_options.key?(attribute_name)
    end

    def hideable_toggle?
      model_class.hideable_options[:toggle] == attribute_name
    end

    serialize do
      { is_toggle: toggle?, is_hideable_toggle: hideable_toggle? }
    end
  end
end