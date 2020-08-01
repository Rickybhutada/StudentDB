class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :phone_number, numericality: { only_integer: true }
  validates :phone_number,length: { is: 10, message: 'Phone number is the wrong length (should be 10 Digit)' }
end
