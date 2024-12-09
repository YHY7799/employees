class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :employees, dependent: :destroy
  has_many :mains, dependent: :destroy
  
  enum business_type: {
  restuarant: 0,
  coffee: 1,
  retail: 2,
  other: 3}

 enum status: {
  Pending: 0,
  Active: 1,
  Suspended: 2}

  scope :admins, -> { where(admin: true) }

  # Method to check if user is an admin
  def admin?
    admin == true
  end
end
