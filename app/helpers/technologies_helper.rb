module TechnologiesHelper
  def get_sort_options
    [
        ['most viewed', 'views-desc'],
        ['less viewed', 'views'],
        ['newest', 'created_at'],
        ['oldest', 'created_at-desc'],
    ]
  end
end
