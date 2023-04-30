# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    belongs_to :country
    has_secure_password
    
    validates :password, confirmation: true
    validates :password, presence: true
    validates :password_confirmation, presence: true
    validates :first_name, presence: true
    validates :email, presence: true
    #validates :email, format: { with: /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/, message: "wrong format email" }
    def username 
        "#{first_name} #{last_name}"
    end
end
