FactoryBot.define do
  factory :short_url do
    short_code { "123abc" }
    target_url { "https://example.com" }
    title_tag { "Example Title" }
    clicks { 0 }
  end
end
