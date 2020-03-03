require "open-uri"
require "nokogiri"

Supermarket.create()

url = "https://www.tesco.com/groceries/en-GB/shop/fresh-food/all"
doc = Nokogiri::HTML(open(url))
doc.search(".tile-content").each do |result_card|
  name = result_card.search(".sc-cSHVUG").text
  price = result_card.search(".price-per-sellable-unit").text
  Product.create!(name: name, price_cents: price.split.last.to_f, supermarket_id: Supermarket.first.id)
end
