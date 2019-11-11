class API::V1::DataController < ApplicationController
  before_action :set_datum, except: [:index, :new, :create]
  before_action :set_data, only: [:index]
  before_action :threshold_params, only: [:index]

  def index
    data_values = @data.map(&:value)
    render json: {
      data: data_values,
      signal: SignalCreator.new(@threshold, @sensitivity).analyse(data_values),
      days: @data.map(&:day)
    }
  end

  def create
    @datum = Datum.new(datum_params)
    if @datum.save
      render json: { datum: @datum, status: :ok }
    else
      render json: { status: :unprocessable_entity }
    end
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

  def threshold_params
    @threshold = params[:threshold].to_f
    @sensitivity = params[:sensitivity].to_f
  end

  def set_data
    @data = if params[:start] && params[:end]
              Datum.where(day: params[:start]..params[:end])
            else
              Datum.all
            end
    render json: { error: "No results found" } if @data.blank?
  end

  def set_datum
    @datum ||= Datum.find(params[:id])
  end

  def datum_params
    params.permit(:value, :day)
  end

  def invalid_params
    params[:start] > 50 && params[:end] > 50
  end
end
