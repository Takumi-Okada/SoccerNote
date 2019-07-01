class Note < ApplicationRecord
    belongs_to :member
    validates :title,presence: true,length: {maximum: 50}
    validates :play_date,presence: true
    validates :contents,length: {maximum: 1000}
    validates :bad,length: {maximum: 1000}
    validates :good,length: {maximum: 1000}
    validates :goal,length: {maximum: 1000}
    validates :comment,length: {maximum: 1000}
end


