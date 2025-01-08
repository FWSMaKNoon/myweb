class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :stock

      t.timestamps
    end
  end
  class RemoveDescriptionFromProducts < ActiveRecord::Migration[7.0]
    def change
      remove_column :products, :description, :text
    end
  end
  
end
