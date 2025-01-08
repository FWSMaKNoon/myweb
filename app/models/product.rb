class Product < ApplicationRecord
    has_rich_text :description
    has_one_attached :featured_image

    validates :name, presence: true
    validates :price, presence: true
    validates :stock, presence: true
    validates :description, presence: true
    validates :featured_image, presence: true
end
