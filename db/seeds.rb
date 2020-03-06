require "open-uri"
require "nokogiri"

Product.destroy_all
Supermarket.destroy_all

# base_url = "https://www.tesco.com/groceries/en-GB/shop/fresh-food/all"

# 10.times do |i|
#   page_number = i + 1
#   page = "?page=#{page_number}"
#   url = base_url + page + "&count=48"
#   doc = Nokogiri::HTML(open(url))
#   doc.search(".tile-content").each do |result_card|
#     name = result_card.search(".sc-Rmtcm bovboR").text
#     price = result_card.search(".price-per-sellable-unit").text
#     Product.create!(name: name, price_cents: price.split.last.to_f, supermarket_id: Supermarket.first.id)
#   end
# endtesco = Supermarket.create!(name: "Tesco", website: "https://www.tesco.com")
 # Tesco


tesco = Supermarket.create!(name: "Tesco", website: "https://www.tesco.com")
tesco_urls = ["https://www.tesco.com/groceries/en-GB/search?query=ben%20and%20jerrys", "https://www.tesco.com/groceries/en-GB/search?query=ice%20cream", "https://www.tesco.com/groceries/en-GB/search?query=oat%20milk"]
tesco_urls.each do |url|
 # Tesco

doc = Nokogiri::HTML(open(url))
doc.search(".tile-content").each do |result_card|
  prod_name = result_card.search("h3").text
  price = result_card.search(".price-per-sellable-unit").text
  # p description = result_card.search(".product-info-block__content-item").text
  # offer = result_card.search(".offer-text").text
  # date = result_card.search(".dates").text
  image_src = result_card.search(".product-image").attr('src').value
  Product.create!(supermarket: tesco, image: image_src, price: price, name: prod_name)
end
end


waitrose = Supermarket.create!(name: "Waitrose", website: "https://www.waitrose.com")
seed_products = [{price: '£1.85', name: 'Oatly Foamable 1 Litre'}, {price: '£1.85', name: 'Oatly Oat Drink Whole 1 Litre'},
{price: '£1.85', name: 'Oatly Oat Drink Semi 1 Litre'}, {price: '£1.85', name: 'Oatly Oat Drink Low Fat'}, {price: '£1.65', name: 'Alpro Oat Unsweetened 1000 Ml'}, {price: '£1.65', name: 'Alpro Oat Drink Alternative 1 Litre'},  {price: '£1.50', name: 'Plenish Organic Oat M*lk'},
{price: '£2.00', name: 'Innocent Oat Dairy Free 750Ml'}, {price: '£2.05', name: 'Rude Health oat drink'}, {price: '£2.00', name: 'Plenish Oat+ Enriched'},
{price: '£1.60', name: 'Alpro Chocolate Oat Drink'}, {price: '£1.55', name: 'Oatly Organic Longlife Drink Alternative 1 Litre'}, {price: '£1.75', name: 'Oatly Chocolate Longlife Drink Alternative 1 Litre'},
{price: '£1.55', name: 'Oatly H healthy oat dairy-free chocolate'}, {price: '£1.45', name: 'Alpro Unsweetened Oat Drink 1L'}]
 seed_products.each do |seed_product|
  if Product.where(name: seed_product[:name]).length > 0
    image_src = Product.where(name: seed_product[:name])[0].image
    Product.create(supermarket: waitrose, image: image_src, price: seed_product[:price], name: seed_product[:name])
  end
end


sainsburys = Supermarket.create!(name: "Sainsburys", website: "https://www.sainsburys.com")
seed_products_2 = [{price: '£1.80', name: 'Oatly Foamable 1 Litre'}, {price: '£1.80', name: 'Oatly Oat Drink Whole 1 Litre'},
{price: '£1.80', name: 'Oatly Oat Drink Semi 1 Litre'}, {price: '£1.80', name: 'Oatly Oat Drink Low Fat'}, {price: '£1.25', name: 'Alpro Oat Unsweetened 1000 Ml'}, {price: '£1.25', name: 'Alpro Oat Drink Alternative 1 Litre'},  {price: '£1.55', name: 'Plenish Organic Oat M*lk'},
{price: '£1.25', name: 'Innocent Oat Dairy Free 750Ml'}, {price: '£1.50', name: 'Rude Health oat drink'}, {price: '£1.55', name: 'Plenish Oat+ Enriched'},
{price: '£1.60', name: 'Alpro Chocolate Oat Drink'}, {price: '£1.00', name: 'Oatly Organic Longlife Drink Alternative 1 Litre'}, {price: '£1.50', name: 'Oatly Chocolate Longlife Drink Alternative 1 Litre'},
{price: '£1.50', name: 'Oatly H healthy oat dairy-free chocolate'}, {price: '£1.25', name: 'Alpro Unsweetened Oat Drink 1L'}]
  seed_products_2.each do |seed_product|
   if Product.where(name: seed_product[:name]).length > 0
    image_src = Product.where(name: seed_product[:name])[0].image
    Product.create(supermarket: sainsburys, image: image_src, price: seed_product[:price], name: seed_product[:name])
  end
end
# # sainsburys = Supermarket.create!(name: "sainsburys", website: "https://www.sainsburys.com")
# Product.create!(supermarket: sainsburys, image: image_src, price: '£1.80', name: 'Oatly Foamable 1 Litre')
# Product.create!(supermarket: sainsburys, image: image_src, price: '', name: 'Oatly Oat Drink Whole 1 Litre')
# Product.create!(supermarket: sainsburys, image: image_src, price: '£1.80', name: 'Oatly Oat Drink Semi 1 Litre')
# Product.create!(supermarket: sainsburys, image: image_src, price: '£1.80', name: 'Oatly Oat Drink Low Fat')
# Product.create!(supermarket: sainsburys, image: image_src, price: '', name: 'Alpro Oat Unsweetened 1000 Ml')
# Product.create!(supermarket: sainsburys, image: image_src, price: '£', name: 'Alpro Oat Drink Alternative 1 Litre')
# Product.create!(supermarket: sainsburys, image: image_src, price: '£', name: 'Plenish Organic Oat M*lk')
# Product.create!(supermarket: sainsburys, image: image_src, price: '£1.25', name: 'Innocent Oat Dairy Free 750Ml')
# Product.create!(supermarket: sainsburys, image: image_src, price: '', name: 'Rude Health oat drink')
# Product.create!(supermarket: sainsburys, image: image_src, price: '', name: 'Plenish Oat+ Enriched')
# Product.create!(supermarket: sainsburys, image: image_src, price: '', name: 'Alpro Chocolate Oat Drink')
# Product.create!(supermarket: sainsburys, image: image_src, price: '£', name: 'Oatly Organic Longlife Drink Alternative 1 Litre')
# Product.create!(supermarket: sainsburys, image: image_src, price: '£', name: 'Oatly Chocolate Longlife Drink Alternative 1 Litre')
# Product.create!(supermarket: sainsburys, image: image_src, price: '', name: 'Oatly H healthy oat dairy-free chocolate')
# Product.create!(supermarket: sainsburys, image: image_src, price: '', name: 'Alpro Unsweetened Oat Drink 1L')
# Product.create!(supermarket: sainsburys, image: image_src, price: '£1.25', name: 'Alpro Oat Drink Alternative 1 Litre')














# iceland = Supermarket.create!(name: "Iceland", website: "https://www.iceland.co.uk")

# url = "https://www.iceland.co.uk/search?q=ice%20cream"
# doc = Nokogiri::HTML(open(url))
# doc.search(".product-tile").each do |result_card|
#   prod_name  = result_card.search(".product-name").text
#   price = result_card.search(".product-sales-price").text
#   # image_src = result_card.search(".thumb-link").attr('src').value
#   Product.create!(supermarket: iceland, price: price, name: prod_name)
# end


# Product.create!(supermarket: waitrose, image: image_src, price: '£1.85', name: 'Oatly Foamable 1 Litre')
# Product.create!(supermarket: waitrose, image: image_src, price: '£1.85', name: 'Oatly Oat Drink Whole 1 Litre')
# Product.create!(supermarket: waitrose, image: image_src, price: '£1.85', name: 'Oatly Oat Drink Semi 1 Litre')
# Product.create!(supermarket: waitrose, image: image_src, price: '£1.85', name: 'Oatly Oat Drink Low Fat')
# Product.create!(supermarket: waitrose, image: image_src, price: '£1.65', name: 'Alpro Oat Unsweetened 1000 Ml')

