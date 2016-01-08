class CreateObjectives < ActiveRecord::Migration
  def change
    create_table :objectives do |t|
      t.string :description
      t.boolean :is_done

      t.timestamps
    end
    add_reference :objectives, :activity, index: true
  end
end
