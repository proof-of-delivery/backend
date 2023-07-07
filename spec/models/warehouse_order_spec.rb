require 'rails_helper'

RSpec.describe WarehouseOrder, type: :model do

  it 'has a valid factory' do
    expect(create(:warehouse_order)).to be_valid
  end

  it {is_expected.to(validate_presence_of(:customer_address))}
  it {is_expected.to(validate_presence_of(:doc_no))}
  it {is_expected.to(validate_presence_of(:customer_id))}
  it {is_expected.to(validate_presence_of(:purchase_order_no))}

end
