require 'rails_helper'

RSpec.describe PickupOrder, type: :model do
  it 'has a valid factory' do
    expect(create(:pickup_order)).to be_valid
  end

  it{is_expected.to(validate_presence_of(:pickup_date))}
  it{is_expected.to(validate_presence_of(:pickup_time))}
  it{is_expected.to(validate_presence_of(:pickup_order_no))}
  it{is_expected.to(belong_to(:customer))}
  it{is_expected.to(belong_to(:contact))}
end
