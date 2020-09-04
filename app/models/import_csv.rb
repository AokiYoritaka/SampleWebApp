class ImportCsv < ApplicationRecord
  def self.import(path)
    CSV.foreach(path, headers: true) do |row|
      School.create(
        name: row["name"],
        address: row["address"],
        tell: row["tell"],
        genre: row["genre"],
        detail: row["detail"],
        image_url_a: row["image_url_a"],
        image_url_b: row["image_url_b"],
        created_at: row["created_at"],
        updated_at: row["updated_at"],
        latitude: row["latitude"],
        longitude: row["longitude"],
        opentime: row["opentime"],
        subgenre: row["subgenre"],
        res_id: row["res_id"],
      )
      end
    end
end