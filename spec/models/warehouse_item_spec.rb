# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WarehouseItem, type: :model do
  it 'has a valid factory' do
    expect(create(:warehouse_item)).to be_valid
  end

  it { is_expected.to(validate_presence_of(:quantity)) }
  it { is_expected.to(belong_to(:item)) }
  it { is_expected.to(belong_to(:warehouse_order)) }
  it { is_expected.to(validate_numericality_of(:quantity)) }
  it { is_expected.to(validate_numericality_of(:total_confirmed_quantity)) }
  it { is_expected.to(validate_numericality_of(:total_requested_quantity)) }
  it { is_expected.to(validate_numericality_of(:picked_up_quantity)) }
end
