class User < ActiveRecord::Base
  
  validates_presence_of :name, :email, :password
  validates :name, :emails, :password, uniqueness: true
  has_secure_password
  
    has_many :apartments
  
  
  end
  