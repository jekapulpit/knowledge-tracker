class Api::TechnologiesController < ApplicationController
  def index
    technologies = Technology.all.paginate(page: params[:page])
    techs = technologies.map do |technology|
      technology.attributes
          .merge(:icon_url => technology.icon_url,
                 :average_mark => technology.average_mark || 'no votes')
    end
    render json: techs
  end
end
