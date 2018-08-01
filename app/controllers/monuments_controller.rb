# frozen_string_literal: true

# This is the MOnuments Controller
class MonumentsController < ApplicationController
  before_action :set_monument, only: %i[show update destroy]

  # GET /monuments
  def index
    @monuments = Monument.all
    json_response(@monuments)
  end

  # POST /monuments
  def create
    @monument = Monument.create!(monument_params)
    json_response(@monument, :created)
  end

  # GET /monuments/:id
  def show
    json_response(@monument)
  end

  # PUT /monuments/:id
  def update
    @monument.update(monument_params)
    head :no_content
  end

  # DELETE /monuments/:id
  def destroy
    @monument.destroy
    head :no_content
  end

  private

  def monument_params
    params.permit(
      :monument_type, :single_or_double, :length,
      :width, :height, :color
    )
  end

  def set_monument
    @monument = Monument.find(params[:id])
  end
end
