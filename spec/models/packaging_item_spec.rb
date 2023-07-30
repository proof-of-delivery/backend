require 'rails_helper'

RSpec.describe PackagingItem, type: :model do
  it 'has a valid factory' do
    expect(create(:packaging_item)).to be_valid
  end

  it {is_expected.to(validate_presence_of(:quantity))}
  it{is_expected.to(belong_to(:packaging_detail))}
  it{is_expected.to(belong_to(:pickup_item))}

end
