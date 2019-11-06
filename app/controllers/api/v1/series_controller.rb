class API::V1::SeriesController < ApplicationController
  before_action :set_series, except: [:index, :new, :create]

  def index
    @series = Series.all
  end

  def create
  end

  def new
  end

  def destroy
  end

  def show
  end

  def update
  end

  def edit
  end

  private

  def set_series
    @series ||= Series.find(params[:id])
  end
end
