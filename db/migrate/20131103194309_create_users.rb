class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :secondname, :default => ""
      t.string :father_lastname
      t.string :mother_lastname, :default => ""
      t.integer :phone_number, :limit => 8, :default => 0
      t.string :speciality, :default => ""
      t.string :email
      t.string :password
      t.boolean :is_admin, :default => false

      t.timestamps
    end
  end
end
