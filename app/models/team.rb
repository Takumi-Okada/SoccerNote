class Team < ApplicationRecord
    has_many :members
    accepts_nested_attributes_for :members
    has_one_attached :image

end
