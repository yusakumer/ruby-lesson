names = [
  { first_name: 'taro', family_name: 'sato' },
  { first_name: 'rika', family_name: 'yamada' }
]
# 出力値 sato taro, yamada rika

format_names = names.map do |name|
  "#{name[:family_name]} #{name[:first_name]}"
end

p format_names