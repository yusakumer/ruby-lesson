require 'uri'
require 'net/http'
require 'json'

class Qiita

  attr_reader :url

  def initialize(query)
    @url = "https://qiita.com/api/v2/items?query=#{query}"
  end

  def search
    uri = URI.parse(url)
    res = Net::HTTP.get(uri)
    res = JSON.parse(res)
    res.map do |item|
      "#{item['title']} by #{item['user']['name']}"
    end
  end


end