require 'uri'
require 'net/http'
require 'json'

url = "https://qiita.com/api/v2/items"

uri = URI.parse(url)

res = Net::HTTP.get(uri)
res = JSON.parse(res)
puts res.class
