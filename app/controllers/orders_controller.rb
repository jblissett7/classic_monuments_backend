# frozen_string_literal: true

# This is the ORders Controller
class OrdersController < ApplicationController
  before_action :set_order, only: %i[show update destroy]

  # GET /orders
  def index
    @orders = Order.all
    json_response(@orders)
  end

  # POST /orders
  def create
    @order = Order.create!(order_params)
    json_response(@order, :created)
  end

  # GET /orders/:id
  def show
    json_response(@order)
  end

  # PUT /orders/:id
  def update
    @order.update(order_params)
    head :no_content
  end

  # DELETE /orders/:id
  def destroy
    @order.destroy
    head :no_content
  end

  private

  def order_params
    # params whitelist
    params.permit(
      :last_name, :first_name, :status, :date_order_created,
      :date_approval_sent, :date_order_approved, :date_order_cut,
      :date_monument_ordered, :date_monument_set, :ordered_by,
      :address, :phone_number, :email
    )
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
