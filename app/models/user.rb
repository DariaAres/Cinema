class User < ApplicationRecord
    validates :password, confirmation: true
    validates :password, presence: true
    validates :password_confirmation, presence: true
    
    
end
