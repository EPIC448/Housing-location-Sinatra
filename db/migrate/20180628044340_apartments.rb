class Apartments < ActiveRecord::Migration

  def change
    create_table :apartments do |t|
      t.integer   :user_id
      t.string    :location
    end
  end
  
end # end of the class apartment
