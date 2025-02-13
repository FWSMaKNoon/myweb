class Product < ApplicationRecord
    include Notifications

    has_many :subscribers, dependent: :destroy
    has_rich_text :description
    has_one_attached :featured_image

    validates :name, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :description, presence: true
    validates :featured_image, presence: true


    after_update_commit :notify_subscribers, if: :back_in_stock?

    def back_in_stock?
        stock_previously_was.zero? && stock > 0
    end

    def notify_subscribers
        subscribers.each do |subscriber|
        ProductMailer.with(product: self, subscriber: subscriber).in_stock.deliver_later
        end
    end
end
