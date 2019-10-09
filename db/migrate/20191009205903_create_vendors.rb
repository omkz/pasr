class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.string :name, null: false
      t.string :email
      t.string :avatar
      t.string :tagline
      t.text :description
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country
      t.string :phone
      t.references :user, foreign_key: true, unique: true

      t.timestamps
    end
  end
end
