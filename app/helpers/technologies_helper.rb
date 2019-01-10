module TechnologiesHelper
  def technologies_sort_options
    [
      ['views', 'views-desc'],
      %w[newest created_at-desc],
      ['oldest', 'created_at-asc'],
      ['highest marks', 'average_mark-desc'],
      ['lowest marks', 'average_mark-asc']
    ]
  end
end
