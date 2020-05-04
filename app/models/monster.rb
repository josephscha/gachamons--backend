class Monster < ApplicationRecord
    has_many :summons
    has_many :users, through: :summons
end
