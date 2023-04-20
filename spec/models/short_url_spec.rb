require 'rails_helper'

RSpec.describe ShortUrl, type: :model do
  let(:short_url) { build(:short_url) }

  it "is valid with valid attributes" do
    expect(short_url).to be_valid
  end

  # Short Code
  it "is not valid without a short_code" do
    short_url.short_code = nil
    expect(short_url).to_not be_valid
  end

  it "is not valid without 6 characters of short_code" do
    short_url.short_code = "123"
    expect(short_url).to_not be_valid
  end

  it "is not valid with a existing short_code" do
    short_url.save!
    duplicate_short_url = build(:short_url, short_code: short_url.short_code)
    expect(duplicate_short_url).to_not be_valid
  end

  # Target URL
  it "is not valid without a target_url" do
    short_url.target_url = nil
    expect(short_url).to_not be_valid
  end

  it "is not valid with a non http/https target_url" do
    short_url.target_url = "ftp://example.com"
    expect(short_url).to_not be_valid
  end

  # Title tag
  it "is not valid without a title_tag" do
    short_url.title_tag = nil
    expect(short_url).to_not be_valid
  end

  # Clicks
  it "is not valid with a negative number of clicks" do
    short_url.clicks = -1
    expect(short_url).to_not be_valid
  end
end
