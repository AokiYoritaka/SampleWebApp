class AddColumnToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :latitude, :float
    add_column :schools, :longitude, :float
    add_column :schools, :prefecture, :string
    add_column :schools, :opentime, :string
    add_column :schools, :subgenre, :string
  end
end
