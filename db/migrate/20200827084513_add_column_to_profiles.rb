class AddColumnToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :age, :string
    add_column :profiles, :liveplace, :string
    add_column :profiles, :introduce, :text
  end
end
