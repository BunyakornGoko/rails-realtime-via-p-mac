class Room < ApplicationRecord
    validates :name, presence: true
    has_many :messages, dependent: :destroy
end
