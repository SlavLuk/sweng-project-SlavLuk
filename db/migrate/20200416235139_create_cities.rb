class CreateCities < ActiveRecord::Migration
  def up
    create_table :cities do |t|
      t.string :city_name
      t.string :mayor
      t.integer :population
      t.boolean :isCostal
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
  def down
      drop_table :cities
  
  end
end
