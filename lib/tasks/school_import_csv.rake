require 'import.rb'
require 'csv'

namespace :school_import_csv do
  desc "CSVデータをschoolsテーブルにインポート"
    task schools: :environment do
      path = File.join Rails.root, "db/csv_data/csv_data.csv"
      # import.rb呼び出し
        list = Import.csv_data(path: path)
      
        puts "インポート処理を開始"
      begin
        School.create!(list)
        puts "インポート完了!!"
      rescue ActiveModel::UnknownAttributeError => invalid
        puts "インポートに失敗::UnknownAttributeError"
      end
  end
end