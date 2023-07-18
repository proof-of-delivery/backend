require 'rails_helper'

RSpec.describe PickupItem, type: :model do
  it 'has a valid factory' do
    expect(create(:pickup_item)).to be_valid
  end

  it{is_expected.to(validate_presence_of(:quantity))}
  it{is_expected.to(belong_to(:item))}
  it{is_expected.to(belong_to(:warehouse_order))}
  it{is_expected.to(belong_to(:pickup_order))}
end
