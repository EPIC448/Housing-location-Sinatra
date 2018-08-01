class User < ActiveRecord::Base
  
  validates_presence_of :name, :email, :password
  validates :name, :email, uniqueness: true
  has_secure_password
  
    has_many :apartments
  
  
  end
  