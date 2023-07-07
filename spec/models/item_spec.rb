require 'rails_helper'

RSpec.describe Item, type: :model do

  it 'has a valid factory' do
    expect(create(:item)).to be_valid
  end

  it {is_expected.to(validate_presence_of(:position))}
  it {is_expected.to(validate_presence_of(:item_no))}
  it {is_expected.to(validate_presence_of(:description))}
  it {is_expected.to(validate_presence_of(:supplier_item_id))}
  it {is_expected.to(validate_presence_of(:quantity))}
  it {is_expected.to(validate_numericality_of(:position))}
  it {is_expected.to(validate_numericality_of(:item_no))}
  it {is_expected.to(validate_numericality_of(:quantity))}
  it{is_expected.to(belong_to(:warehouse_order))}

end
