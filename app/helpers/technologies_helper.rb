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

  def views_image
    image_url('view.png')
  end

  def rating_image
    image_url('star.jpg')
  end

  def no_photo
    image_url('no-photo.jpg')
  end
end
