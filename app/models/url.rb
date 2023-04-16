class Url < ApplicationRecord
    validates :target_url, presence: true, format: URI::regexp(%w[http https])
    has_many :visits
end
