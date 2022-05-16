class User < ApplicationRecord
    has_secure_password
    has_many :orders, dependent: :delete_all
    validates :email, presence: true
    validates :name, presence: true

    def orderBelongsToCurrentUser?(order)
        orders.include?(order)
    end
end
