# frozen_string_literal: true

# This is the Order Model
class Order < ApplicationRecord
  # validates_presence_of :last_name, :first_name

  validates_presence_of :last_name, :first_name, :status,
                        :date_order_created, :ordered_by,
                        :address, :phone_number, :email
end
