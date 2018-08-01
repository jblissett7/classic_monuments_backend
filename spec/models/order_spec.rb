# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:date_order_created) }
  it { should validate_presence_of(:ordered_by) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:email) }
end
