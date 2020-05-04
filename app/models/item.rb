class Item < ApplicationRecord
    has_many :inventories, dependent: :destroy
    has_many :users, through: :inventories
end
