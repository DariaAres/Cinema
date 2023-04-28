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

    validates :password, confirmation: true
    validates :password, presence: true
    validates :password_confirmation, presence: true
    validates :first_name, presence: true
    validates :email, presence: true
    validates :email, format: { with: /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/, message: "wrong format email" }
    
end
