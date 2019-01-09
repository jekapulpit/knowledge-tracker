class IncrementViewsJob < ApplicationJob
  queue_as :default

  def perform(technology)
    technology.update(views: technology.views + 1)
  end
end
