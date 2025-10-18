class CreateProducts < ActiveRecord::Migration[8.2]
  def change
    create_table :products do |t|
      t.string :name

      t.timestamps
    end
  end
end
