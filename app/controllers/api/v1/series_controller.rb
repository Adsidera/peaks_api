class API::V1::SeriesController < ApplicationController
  def index
    @series = Series.all

    if params[:threshold] && params[:sensitivity]
      render json:  @series,
                    threshold: params[:threshold],
                    sensitivity: params[:sensitivity],
                    start: params[:start],
                    end: params[:end]
    else
        render json: { error: "Invalid Request"}
    end
  end
end
