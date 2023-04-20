require 'rails_helper'

RSpec.describe Visit, type: :model do
  let(:visit) { build(:visit) }

  it "is not valid without a short URL ID" do
    expect(visit).not_to be_valid
  end

  it "is not valid without an originating geolocation" do
    visit.originating_geolocation = nil
    expect(visit).not_to be_valid
  end
end
