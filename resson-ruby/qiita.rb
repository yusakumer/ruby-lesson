require 'uri'
require 'net/http'
require 'json'

class Qiita

  attr_reader :url
  attr_accessor :query

  def initialize(query)
    @query = query
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