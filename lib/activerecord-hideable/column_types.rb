module Hideable
  module ColumnTypes
    def toggle(*args)
      options = args.extract_options!.reverse_merge!(null: false, index: true)
      args.each { |name| column(name, :boolean, options) }
    end

    # Commonly used
    def hideable_toggle(column = Hideable.default_column, **options)
      toggle(column, options.reverse_merge!(default: false))
    end
  end
end