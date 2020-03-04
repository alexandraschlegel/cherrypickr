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

#Users
#User.new(email: 'eric@gmail.com', password: '123456')
#User.new(email: 'priyesh@talktalk.com', password: '123456')
#User.new(email: 'nimbala@cloudnet.com', password: '123456')
#
#Supermarkets
#Supermarket.new(name: 'Tesco Wembley', address:)
#Supermarket.new(name: 'Asda Wembley', address: )
#Supermarket.new(name: 'Sainsbury Kenton', address: )
#Supermarket.new(name: 'Sainsbury Alperton', address: )
#Supermarket.new(name: 'Tesco Perivale', address:)


#Products
#Product.new(name: "Fairtrade Bananas" price_cents: 100, weight: 1, description:"Fairtrade Bananas" )
#Product.new(name: "Cherry Vine Tomatoes" price_cents: 100, weight: 1, description:"Fairtrade Bananas" )
#Product.new(name: "Fairtrade Bananas" price_cents: 100, weight: 1, description:"Fairtrade Bananas" )
#Product.new(name: "Fairtrade Bananas" price_cents: 100, weight: 1, description:"Fairtrade Bananas" )

#user_products
#User_products.new(user_id: 1, product_id: 1)
#User_products.new(user_id: 1, product_id: 2)
#User_products.new(user_id: 2, product_id: 1)
#User_products.new(user_id: 2, product_id: 2)


#deals
#Deals.new(supermarket_id: 1,  product_id: 1)
#Deals.new(supermarket_id: 1,  product_id: 2)
#Deals.new(supermarket_id: 1,  product_id: 3)
#Deals.new(supermarket_id: 2,  product_id: 1)
#Deals.new(supermarket_id: 2,  product_id: 2)
#Deals.new(supermarket_id: 2,  product_id: 3)
