require 'rails_helper'

RSpec.describe Monument, type: :model do
  
  it { should validate_presence_of(:monument_type) }
  it { should validate_presence_of(:single_or_double) }
  it { should validate_presence_of(:length) }
  it { should validate_presence_of(:width) }
  it { should validate_presence_of(:height) }
  it { should validate_presence_of(:color) }
end
