require "open-uri"
require "nokogiri"

Product.destroy_all
Supermarket.destroy_all

puts "hello"
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

waitrose = Supermarket.create!(name: "Waitrose", website: "https://www.waitrose.com"
seed_products_6 = [{price: '£2.75', name: 'Tresemme Rich Luxurious Moisture Shampoo 900Ml'},
 {price: '£3.50', name: 'Ogx Moroccan Argan Oil Shampoo 385Ml'},{price: '£2.75', name: 'Tresemme Deep Cleansing Shampoo'},
{price: '£2.75', name: 'Pantene Smooth & Sleek'},{price: '£4.00', name: 'Garnier Ultimate Blends Coconut Oil Shampoo Frizzy Hair 360Ml'},
{price: '£3.00', name: 'Herbal Essences Bio. Renew Argan Shampoo'},{price: '£3.00', name: 'Alberto Balsam Blueberry'},
{price: '£2.50', name: 'Simple Kind To Hair Gently/Gentle Care Shampoo 200Ml'},{price: '£2.75', name:'Tresemme Colour Revitalise Shampoo'},
{price: '£4.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo'},{price: '£5.00', name: 'Alpecin Caffeine'},
{price: '£4.00', name: 'Aussie Aussome Volume'},{price: '£2.75', name: 'Tresemme 24 Hour Body'},
{price: '£5.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo 360Ml'},
{price: '£3.50', name: 'Ogx Biotin & Collagen Volume Shampoo 385 Ml'},{price: '£2.50', name: 'Pantene Sheer Volume'},
{price: '£5.00', name: 'Head & Shoulders Smooth'},{price: '£3.00', name: 'Herbal Essences Manuka'},
{price: '£3.00', name: 'Herbal Essences Bio. Renew Coconut Shampoo'},{price: '£3.00', name: 'Ogx Miracle Oil Shampoo'},
{price: '£4.55', name: 'Herbal Essences Uplifting'},{price: '£4.75', name: 'Aussie Miracle Moist'},
{price: '£2.70', name: 'Dove Intensive Repair'},{price: '£5.55', name: 'Loreal Elvive Clay Oily'},
{price: '£5.50', name: 'Loreal Elvive Men'},{price: '£2.00', name: 'Vosene Mens Anti'},
]
  seed_products_6.each do |seed_product|
   if Product.where(name: seed_product[:name]).length > 0
    image_src = Product.where(name: seed_product[:name])[0].image
    Product.create(supermarket: sainsburys, image: image_src, price: seed_product[:price], name: seed_product[:name])
  end
end
asda = Supermarket.create!(name: "Asda", website: "https://www.asda.com"
seed_products_7 = [{price: '£2.75', name: 'Tresemme Rich Luxurious Moisture Shampoo 900Ml'},
{price: '£6.00', name: 'Ogx Moroccan Argan Oil Shampoo 385Ml'},{price: '£2.75', name: 'Tresemme Deep Cleansing Shampoo'},{price: '£3.50', name: 'Pantene Smooth & Sleek'},
{price: '£4.00', name: 'Garnier Ultimate Blends Coconut Oil Shampoo Frizzy Hair 360Ml'},
{price: '£3.00', name: 'Herbal Essences Bio. Renew Argan Shampoo'},{price: '£5.00', name: 'Alberto Balsam Blueberry'},
{price: '£2.50', name: 'Simple Kind To Hair Gently/Gentle Care Shampoo 200Ml'},{price: '£2.75', name:'Tresemme Colour Revitalise Shampoo'},
{price: '£4.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo'},{price: '£7.00', name: 'Alpecin Caffeine'},
{price: '£4.00', name: 'Aussie Aussome Volume'},{price: '£2.75', name: 'Tresemme 24 Hour Body'},
{price: '£5.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo 360Ml'},
{price: '£3.50', name: 'Ogx Biotin & Collagen Volume Shampoo 385 Ml'},
{price: '£2.50', name: 'Pantene Sheer Volume'},{price: '£5.00', name: 'Head & Shoulders Smooth'},
{price: '£2.00', name: 'Herbal Essences Manuka'},{price: '£3.00', name: 'Herbal Essences Bio. Renew Coconut Shampoo'},
{price: '£3.00', name: 'Ogx Miracle Oil Shampoo'},{price: '£4.55', name: 'Herbal Essences Uplifting'},
 {price: '£5.75', name: 'Aussie Miracle Moist'},{price: '£1.70', name: 'Dove Intensive Repair'},{price: '£4.55', name: 'Loreal Elvive Clay Oily'},
{price: '£5.50', name: 'Loreal Elvive Men'},{price: '£1.00', name: 'Vosene Mens Anti'},
]
  seed_products_7.each do |seed_product|
   if Product.where(name: seed_product[:name]).length > 0
    image_src = Product.where(name: seed_product[:name])[0].image
    Product.create(supermarket: sainsburys, image: image_src, price: seed_product[:price], name: seed_product[:name])
  end
end
sainsburys = Supermarket.create!(name: "sainsburys", website: "https://www.asda.com"
seed_products_8 = [{price: '£2.75', name: 'Tresemme Rich Luxurious Moisture Shampoo 900Ml'},
 {price: '£4.00', name: 'Ogx Moroccan Argan Oil Shampoo 385Ml'},{price: '£2.75', name: 'Tresemme Deep Cleansing Shampoo'},
{price: '£3.50', name: 'Pantene Smooth & Sleek'},{price: '£4.00', name: 'Garnier Ultimate Blends Coconut Oil Shampoo Frizzy Hair 360Ml'},
{price: '£3.00', name: 'Herbal Essences Bio. Renew Argan Shampoo'},{price: '£5.00', name: 'Alberto Balsam Blueberry'},
{price: '£2.50', name: 'Simple Kind To Hair Gently/Gentle Care Shampoo 200Ml'},{price: '£2.75', name:'Tresemme Colour Revitalise Shampoo'},
{price: '£3.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo'},{price: '£5.00', name: 'Alpecin Caffeine'},
{price: '£4.00', name: 'Aussie Aussome Volume'},{price: '£2.25', name: 'Tresemme 24 Hour Body'},
{price: '£5.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo 360Ml'},{price: '£3.50', name: 'Ogx Biotin & Collagen Volume Shampoo 385 Ml'},
{price: '£2.50', name: 'Pantene Sheer Volume'},{price: '£5.00', name: 'Head & Shoulders Smooth'},
{price: '£2.00', name: 'Herbal Essences Manuka'},{price: '£3.00', name: 'Herbal Essences Bio. Renew Coconut Shampoo'},
{price: '£3.00', name: 'Ogx Miracle Oil Shampoo'},{price: '£2.55', name: 'Herbal Essences Uplifting'},
{price: '£4.75', name: 'Aussie Miracle Moist'},
{price: '£1.70', name: 'Dove Intensive Repair'},{price: '£4.55', name: 'Loreal Elvive Clay Oily'},
{price: '£5.50', name: 'Loreal Elvive Men'},{price: '£3.00', name: 'Vosene Mens Anti'},
]
  seed_products_8.each do |seed_product|
   if Product.where(name: seed_product[:name]).length > 0
    image_src = Product.where(name: seed_product[:name])[0].image
    Product.create(supermarket: sainsburys, image: image_src, price: seed_product[:price], name: seed_product[:name])
  end
end
sainsburys = Supermarket.create!(name: "sainsburys", website: "https://www.asda.com"
seed_products_9 = [{price: '£21.40', name: 'Bombay Sapphire gin'},
{price: '£14.00', name: 'Gordons Special Dry London Gin'},
{price: '£21.00', name: 'Haymans London Dry Gin'},
{price: '£23.00', name: 'Martin Millers Gin'},
{price: '£21.00', name: 'Lone Wolf Cloudy Lemon London Dry Gin'},
{price: '£21.00', name: 'Haymans Sloe Gin'},
{price: '£18.00', name: 'Tanqueray London Dry Gin'},
{price: '£30.00', name: 'Hendricks gin'},
{price: '£28.50', name:'Sipsmith London'},
{price: '£37.00', name: 'Cotswolds Dry Gin'},
{price: '£30.00', name: 'Roku Gin'},
{price: '£40.00', name: 'Pink Pepper Gin'},
{price: '£31.60', name: 'Bathtub Gin'},
{price: '£38.00', name: 'Chase Pink Grapefruit & Pomelo Gin'},
{price: '£38.50', name: 'Chase Rhubarb & Bramley Apple Gin'},
{price: '£36.00', name: 'Warner Edwards Harrington Elderflower Gin'},
{price: '£35.00', name: 'Oxley London Dry Gin'},
{price: '£46.00', name: 'Monkey 47 Gin'},
{price: '£32.00', name: 'Tanqueray Sevilla Gin'},
{price: '£46.00', name: 'The Botanist Islay Dry Gin'},
]
seed_products_9.each do |seed_product|
   if Product.where(name: seed_product[:name]).length > 0
    image_src = Product.where(name: seed_product[:name])[0].image
    Product.create(supermarket: sainsburys, image: image_src, price: seed_product[:price], name: seed_product[:name])
  end
end
asda = Supermarket.create!(name: "asda", website: "https://www.asda.com"
seed_products_10 = [{price: '£16.00', name: 'Bombay Sapphire gin'},
{price: '£17.00', name: 'Gordons Special Dry London Gin'},
{price: '£22.00', name: 'Haymans London Dry Gin'},
{price: '£22.00', name: 'Martin Millers Gin'},
{price: '£25.00', name: 'Lone Wolf Cloudy Lemon London Dry Gin'},
{price: '£17.00', name: 'Haymans Sloe Gin'},
{price: '£18.00', name: 'Tanqueray London Dry Gin'},
{price: '£30.00', name: 'Hendricks gin'},
{price: '£22.50', name:'Sipsmith London'},
{price: '£35.00', name: 'Cotswolds Dry Gin'},
{price: '£25.00', name: 'Roku Gin'},
{price: '£13.00', name: 'Pink Pepper Gin'},
{price: '£31.60', name: 'Bathtub Gin'},
{price: '£38.00', name: 'Chase Pink Grapefruit & Pomelo Gin'},
{price: '£38.50', name: 'Chase Rhubarb & Bramley Apple Gin'},
{price: '£33.00', name: 'Warner Edwards Harrington Elderflower Gin'},
{price: '£35.00', name: 'Oxley London Dry Gin'},
{price: '£46.00', name: 'Monkey 47 Gin'},
{price: '£30.00', name: 'Tanqueray Sevilla Gin'},
{price: '£40.00', name: 'The Botanist Islay Dry Gin'},
]
seed_products_10.each do |seed_product|
   if Product.where(name: seed_product[:name]).length > 0
    image_src = Product.where(name: seed_product[:name])[0].image
    Product.create(supermarket: sainsburys, image: image_src, price: seed_product[:price], name: seed_product[:name])
  end
end
waitrose = Supermarket.create!(name: "waitrose", website: "https://www.asda.com"
seed_products_11 = [{price: '£27.00', name: 'Bombay Sapphire gin'},
{price: '£15.00', name: 'Gordons Special Dry London Gin'},
{price: '£15.40', name: 'Haymans London Dry Gin'},
{price: '£27.00', name: 'Martin Millers Gin'},
{price: '£20.00', name: 'Lone Wolf Cloudy Lemon London Dry Gin'},
{price: '£17.00', name: 'Haymans Sloe Gin'},
{price: '£18.00', name: 'Tanqueray London Dry Gin'},
{price: '£30.00', name: 'Hendricks gin'},
{price: '£22.50', name:'Sipsmith London'},
{price: '£35.00', name: 'Cotswolds Dry Gin'},
{price: '£30.00', name: 'Roku Gin'},
{price: '£22.00', name: 'Pink Pepper Gin'},
{price: '£31.60', name: 'Bathtub Gin'},
{price: '£36.00', name: 'Chase Pink Grapefruit & Pomelo Gin'},
{price: '£38.50', name: 'Chase Rhubarb & Bramley Apple Gin'},
{price: '£33.00', name: 'Warner Edwards Harrington Elderflower Gin'},
{price: '£31.00', name: 'Oxley London Dry Gin'},
{price: '£46.00', name: 'Monkey 47 Gin'},
{price: '£30.00', name: 'Tanqueray Sevilla Gin'},
{price: '£39.00', name: 'The Botanist Islay Dry Gin'},
]
seed_products_11.each do |seed_product|
   if Product.where(name: seed_product[:name]).length > 0
    image_src = Product.where(name: seed_product[:name])[0].image
    Product.create(supermarket: sainsburys, image: image_src, price: seed_product[:price], name: seed_product[:name])
  end
end










puts "successful seed!"

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

