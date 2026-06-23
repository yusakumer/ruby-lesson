require 'csv'

array = []
csv = CSV.read("fishing_logs.csv")
csv.each do |row|
  if row[2] == "アジ"
    array.push(row)
  end
end