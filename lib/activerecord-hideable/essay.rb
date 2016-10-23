# encoding: utf-8
# frozen_string_literal: true

module Essay
  class ModelFeatures
    def hideable?
      !!active_record.hideable?
    end

    serialize do
      { is_hideable: hideable? }
    end
  end

  class AttributeFeatures
    def toggle?
      active_record.features.hideable? && attribute.name == :hidden
    end

    serialize do
      { is_toggle: toggle? }
    end
  end
end
