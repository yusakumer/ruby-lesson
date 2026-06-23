# CSV読み込み、書き込み練習

require 'csv'

array = []
csv = CSV.read("fishing_logs.csv", headers: true)
csv.each do |row|
  if row["fish_name"] == "アジ"
    array.push(row)
  end
end

CSV.open("aji_list.csv", "wb") do |r|
  r << csv.headers
  array.each do |row|
    r << row
  end
end

CSV.open("big_fish_summary.csv", "wb") do |r|
  r << ["user_name", "count"]
  h = Hash.new(0)
  csv.each do |row|
    if row["size_cm"].to_i >= 30
      h[row["user_name"]] += 1

    end
  end

  h.each do |k, v|
    r << [k, v]
  end

end