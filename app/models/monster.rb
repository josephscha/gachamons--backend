class Monster < ApplicationRecord
    has_many :summons, dependent: :destroy
    has_many :users, through: :summons
end
