class AddResIdToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :res_id, :string
  end
end
