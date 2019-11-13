class API::V1::DataController < ApplicationController
  def create
    @datum = Datum.new(datum_params)
    if @datum.save
      render json: { datum: @datum, status: :ok }
    else
      render json: { status: :unprocessable_entity }
    end
  end
end
