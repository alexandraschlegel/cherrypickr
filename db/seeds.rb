require "open-uri"
require "nokogiri"

Product.destroy_all
Supermarket.destroy_all
Supermarket.create()

base_url = "https://www.tesco.com/groceries/en-GB/shop/fresh-food/all"

10.times do |i|
  page_number = i + 1
  page = "?page=#{page_number}"
  url = base_url + page + "&count=48"
  doc = Nokogiri::HTML(open(url))
  doc.search(".tile-content").each do |result_card|
    name = result_card.search(".sc-cSHVUG").text
    price = result_card.search(".price-per-sellable-unit").text
    Product.create!(name: name, price_cents: price.split.last.to_f, supermarket_id: Supermarket.first.id)
  end
end
