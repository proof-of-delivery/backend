# frozen_string_literal: true

require "rails_helper"

RSpec.describe PackagingDetail, type: :model do
  it "has a valid factory" do
    expect(create(:packaging_detail)).to be_valid
  end

  it { is_expected.to(validate_presence_of(:package_type)) }
  it { is_expected.to(validate_presence_of(:weight)) }
  it { is_expected.to(validate_presence_of(:height)) }
  it { is_expected.to(validate_presence_of(:length)) }
  it { is_expected.to(validate_presence_of(:cbm)) }
end
