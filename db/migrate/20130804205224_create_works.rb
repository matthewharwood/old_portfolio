class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :name
      t.text :description
      t.text :post

      t.timestamps
    end
  end
end
