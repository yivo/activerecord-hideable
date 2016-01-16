module Essay
  class ModelFeatures
    def hideable?
      !!model_class.try(:hideable_options)
    end

    serialize do
      { is_hideable: hideable? }
    end
  end

  class AttributeFeatures
    def hideable_toggle?
      model_features.hideable? && model_class.hideable_options.fetch(:toggle) == attribute_name
    end

    serialize do
      { is_hideable_toggle: hideable_toggle? }
    end
  end
end