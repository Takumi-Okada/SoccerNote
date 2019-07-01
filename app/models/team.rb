class Team < ApplicationRecord
    has_many :members
    accepts_nested_attributes_for :members
    has_one_attached :image
    validates :name,presence: true,length: {maximum: 50}
    validates :url ,presence: true

end
