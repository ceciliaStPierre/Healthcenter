class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :firstname, null: false, limit: 100
      t.string :secondname, null: false, limit: 100
      t.string :father_lastname, null: false, limit: 100
      t.string :mother_lastname, null: false, limit: 100
      t.date :born_date, null: false
      t.string :sex, null: false
      t.text :home_adress, null: false, limit: 200
      t.integer :phone_number, :limit => 8
      t.integer :contact_number
      t.string :genogram_url
      t.string :record_url

      t.timestamps
    end
  end
end
