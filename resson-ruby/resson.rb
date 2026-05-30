names = [
  { first_name: 'taro', family_name: 'sato' },
  { first_name: 'rika', family_name: 'yamada' }
]
# 出力値 sato taro, yamada rika

format_names = names.map do |name|
  "#{name[:family_name]} #{name[:first_name]}"
end

puts names.any? { |e| e[:first_name] == "taro" }

s = gets.chomp.chars
hash = Hash.new(0)

s.each do |n|
  hash[n] += 1
end

key, value = hash.max_by { |k, v| v }
puts "#{key} #{value}"
