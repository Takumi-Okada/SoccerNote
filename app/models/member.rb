class Member < ApplicationRecord
    has_secure_password
    belongs_to :team
    has_many :notes
    has_one_attached :avatar
    validates :name,presence: true,length: {maximum: 50}
    validates :name,presence: true,length: {maximum: 250}
    validates :birthday,presence: true
    validates :position,length: {maximum: 100}
end


