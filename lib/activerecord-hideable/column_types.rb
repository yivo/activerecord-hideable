module Hideable
  module ColumnTypes
    def toggle(column_name = Hideable.default_column, **options)
      options.reverse_merge!(null: false, default: false, index: true)
      column(column_name, :boolean, options)
    end
  end
end