class Member < ApplicationRecord
    has_secure_password
    belongs_to :team
    has_many :notes
    has_one_attached :avatar
end
