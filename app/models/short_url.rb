class ShortUrl < ApplicationRecord
    validates :target_url, presence: true, format: URI::regexp(%w[http https])
    validates :title_tag, presence: true
    has_many :visits
end
