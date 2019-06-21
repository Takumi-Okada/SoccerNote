class Member < ApplicationRecord
    has_secure_password
    has_many :notes
    has_one_attached :avatar
end
