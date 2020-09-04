require 'csv'

# rake import:schools
namespace :import do
  desc "Import schools from csv"
  task schools: :environment do
    path = File.join Rails.root, "db/csv/csv_data.csv"
    puts "path: #{path}"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << {
        id: row["id"],
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
      }
    end
    puts "start to create schools data"
    begin
      School.create!(list)
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end
end