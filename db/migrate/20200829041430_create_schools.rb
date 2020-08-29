class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :tell
      t.string :genre
      t.text   :detail
      t.text   :image_url_a
      t.text   :image_url_b

      t.timestamps
    end
  end
end
