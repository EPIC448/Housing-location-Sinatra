class Apartment < ActiveRecord::Base
    
      belongs_to :user
        validates :location, presence: true
  end
  