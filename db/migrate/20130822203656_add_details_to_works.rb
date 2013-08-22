class AddDetailsToWorks < ActiveRecord::Migration
  def change
    add_column :works, :startdate, :string
    add_column :works, :stopdate, :string
    add_column :works, :personA, :string
    add_column :works, :personB, :string
    add_column :works, :personC, :string
    add_column :works, :personD, :string
    add_column :works, :personE, :string
    add_column :works, :personF, :string
    add_column :works, :department, :string
    add_column :works, :details, :string
    add_column :works, :teacher, :string
    add_column :works, :assistant, :string
  end
end
