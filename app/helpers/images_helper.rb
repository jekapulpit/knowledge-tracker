module ImagesHelper
  def views_image
    image_url('view.png')
  end

  def rating_image
    image_url('star.jpg')
  end

  def no_photo
    image_url('no-photo.jpg')
  end

  def delete_image
    image_url('delete.png')
  end

  def edit_image
    image_url('edit.png')
  end

  def save_image
    image_url('save.png')
  end
end
