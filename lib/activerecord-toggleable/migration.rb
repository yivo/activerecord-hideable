class ActiveRecord::ConnectionAdapters::TableDefinition
  def toggle(*args)
    options      = args.extract_options!.reverse_merge!(null: false, index: true)
    column_names = args
    if args.empty?
      hideable_toggle(options)
    else
      column_names.each { |name| column(name, :boolean, options) }
    end
  end

  def hideable_toggle(column = :hidden, **options)
    toggle(column, options.reverse_merge!(default: false))
  end
end