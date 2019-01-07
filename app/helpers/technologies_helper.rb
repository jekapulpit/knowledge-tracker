module TechnologiesHelper
  def technologies_sort_options
    [
      ['views', 'views-desc'],
      %w[newest created_at],
      ['oldest', 'created_at-desc'],
      ['mark', 'average_mark-desc']
    ]
  end
end
