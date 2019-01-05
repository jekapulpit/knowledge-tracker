class SearchController < ApplicationController
  def start
    @found_techs = Technology.search(params[:q]).records
  end
end
