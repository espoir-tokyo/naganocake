class InsertInitialGenres < ActiveRecord::Migration[5.2]
  def change
    Genre.create(name: "ケーキ", flag: true)
    Genre.create(name: "プリン", flag: true)
    Genre.create(name: "焼き菓子", flag: true)
    Genre.create(name: "キャンディ", flag: true)
  end
end
