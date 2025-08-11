class CreatePeople < ActiveRecord::Migration[8.0]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :phone_number
      t.string :website_url
      t.integer :unique_visitors
      t.string :email
      t.string :password
      t.boolean :confirmation
      t.string :state, default: "hidden"

      t.timestamps
    end
  end
end
