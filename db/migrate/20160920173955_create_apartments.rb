class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.float :latitude
      t.float :longitude
      t.string :street1
      t.string :street2
      t.string :city
      t.string :postalcode
      t.string :state
      t.string :country
      t.string :ownerfullname
      t.time :time
      t.string :phonenumber

      t.timestamps null: false
    end
  end
end
