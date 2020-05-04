class User < ApplicationRecord
    has_many :summons
    has_many :monsters, through: :summons
    has_many :inventories
    has_many :items, through: :inventories
end

