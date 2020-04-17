class CreateCountries < ActiveRecord::Migration
  def up
    create_table :countries do |t|
      t.string :country_name

      t.timestamps null: false
    end
  end
  def down
     
    drop_table :countries
  end
end
