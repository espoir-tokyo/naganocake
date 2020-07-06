class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  acts_as_paranoid
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :shipping_addresses, dependent: :destroy
end
