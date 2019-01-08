module TechnologiesHelper
  def technologies_sort_options
    [
      ['views', 'views-desc'],
      %w[newest created_at-asc],
      ['oldest', 'created_at-desc'],
      ['highest marks', 'average_mark-desc'],
      ['lowest marks', 'average_mark-asc']
    ]
  end
end
