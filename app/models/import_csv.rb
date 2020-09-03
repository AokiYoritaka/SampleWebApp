class ImportCsv < ApplicationRecord
  # CSVデータのパスを引数として受け取り、インポート処理を実行
  def self.schools_data
    # インポートするファイルのパスを取得
    path = File.join Rails.root, "db/csv/csv_data.csv"
    # インポートするデータを格納するための配列
    list = []
    # CSVファイルからインポートするデータを取得し配列に格納
    CSV.foreach(path, headers: true) do |row|
      list << {
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
    puts "インポート処理を開始"
    # インポートができなかった場合の例外処理
    begin
      school.create!(list)
      puts "インポート完了!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "インポートに失敗：UnknownAttributeError"
    end
  end
end