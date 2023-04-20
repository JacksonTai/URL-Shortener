class ShortUrl < ApplicationRecord
    validates :short_code, presence: true, length: { minimum: 6 }, uniqueness: true, on: :create
    validates :target_url, presence: true, format: URI::regexp(%w[http https])
    validates :title_tag, presence: true
    validates :clicks, presence: true, numericality: { greater_than_or_equal_to: 0 }
    has_many :visits
end
