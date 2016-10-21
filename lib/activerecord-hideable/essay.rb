# encoding: utf-8
# frozen_string_literal: true

module Essay
  class ModelFeatures
    def hideable?
      model_class.respond_to?(:hideable_options)
    end

    serialize do
      { is_hideable: hideable? }
    end
  end

  class AttributeFeatures
    def toggle?
      model_features.hideable? && model_class.hideable_options.fetch(:toggle) == attribute_name
    end

    serialize do
      { is_toggle: toggle? }
    end
  end
end
