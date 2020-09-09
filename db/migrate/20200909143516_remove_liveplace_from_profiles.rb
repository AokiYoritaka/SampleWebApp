class RemoveLiveplaceFromProfiles < ActiveRecord::Migration[5.2]
  def up
    remove_column :profiles, :liveplace
  end
end
