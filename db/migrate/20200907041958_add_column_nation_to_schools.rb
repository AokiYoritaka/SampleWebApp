class AddColumnNationToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :nation, :string
  end
end
