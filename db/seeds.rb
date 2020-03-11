require "open-uri"
require "nokogiri"

Product.destroy_all
Supermarket.destroy_all
Branch.destroy_all


# Supermarkets
puts 'creating supermarkets!'
tesco = Supermarket.create!(name: "Tesco", website: "https://www.tesco.com", image: 'tesco.png')
waitrose = Supermarket.create!(name: "Waitrose", website: "https://www.waitrose.com", image:'waitrose.png')
sainsburys = Supermarket.create!(name: "Sainsburys", website: "https://www.sainsburys.com", image:'Sainsburys.png')
# asda = Supermarket.create!(name: "Sainsburys", website: "https://www.sainsburys.com", image:'Sainsburys.png')

puts "create #{tesco}, #{waitrose} and #{sainsburys}"

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


# tesco = Supermarket.create!(name: "Tesco", website: "https://www.tesco.com", )
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
    product = Product.create!(supermarket: tesco, image: image_src, price: price, name: prod_name)
    puts "created #{product.name}"
  end
end


#waitrose = Supermarket.create!(name: "Waitrose", website: "https://www.waitrose.com")
# seed_products = [{price: '£1.85', name: 'Oatly Foamable 1 Litre'}, {price: '£1.85', name: 'Oatly Oat Drink Whole 1 Litre'},
# {price: '£1.85', name: 'Oatly Oat Drink Semi 1 Litre'}, {price: '£1.85', name: 'Oatly Oat Drink Low Fat'}, {price: '£1.65', name: 'Alpro Oat Unsweetened 1000 Ml'}, {price: '£1.65', name: 'Alpro Oat Drink Alternative 1 Litre'},  {price: '£1.50', name: 'Plenish Organic Oat M*lk'},
# {price: '£2.00', name: 'Innocent Oat Dairy Free 750Ml'}, {price: '£2.05', name: 'Rude Health oat drink'}, {price: '£2.00', name: 'Plenish Oat+ Enriched'},
# {price: '£1.60', name: 'Alpro Chocolate Oat Drink'}, {price: '£1.55', name: 'Oatly Organic Longlife Drink Alternative 1 Litre'}, {price: '£1.75', name: 'Oatly Chocolate Longlife Drink Alternative 1 Litre'},
# {price: '£1.55', name: 'Oatly H healthy oat dairy-free chocolate'}, {price: '£1.45', name: 'Alpro Unsweetened Oat Drink 1L'}]
#  seed_products.each do |seed_product|
#   if Product.where(name: seed_product[:name]).length > 0
#     image_src = Product.where(name: seed_product[:name])[0].image
#     Product.create(supermarket: waitrose, image: image_src, price: seed_product[:price], name: seed_product[:name])
#   end
# end


#sainsburys = Supermarket.create!(name: "Sainsburys", website: "https://www.sainsburys.com")
# seed_products_2 = [{price: '£1.80', name: 'Oatly Foamable 1 Litre'}, {price: '£1.80', name: 'Oatly Oat Drink Whole 1 Litre'},
# {price: '£1.80', name: 'Oatly Oat Drink Semi 1 Litre'}, {price: '£1.80', name: 'Oatly Oat Drink Low Fat'}, {price: '£1.25', name: 'Alpro Oat Unsweetened 1000 Ml'}, {price: '£1.25', name: 'Alpro Oat Drink Alternative 1 Litre'},  {price: '£1.55', name: 'Plenish Organic Oat M*lk'},
# {price: '£1.25', name: 'Innocent Oat Dairy Free 750Ml'}, {price: '£1.50', name: 'Rude Health oat drink'}, {price: '£1.55', name: 'Plenish Oat+ Enriched'},
# {price: '£1.60', name: 'Alpro Chocolate Oat Drink'}, {price: '£1.00', name: 'Oatly Organic Longlife Drink Alternative 1 Litre'}, {price: '£1.50', name: 'Oatly Chocolate Longlife Drink Alternative 1 Litre'},
# {price: '£1.50', name: 'Oatly H healthy oat dairy-free chocolate'}, {price: '£1.25', name: 'Alpro Unsweetened Oat Drink 1L'}]
#   seed_products_2.each do |seed_product|
#    if Product.where(name: seed_product[:name]).length > 0
#     image_src = Product.where(name: seed_product[:name])[0].image
#     Product.create(supermarket: sainsburys, image: image_src, price: seed_product[:price], name: seed_product[:name])
#   end
# end

# OAT PRODUCTS
## SAINSBURYS
seed_products_3 = [
  {price: '£0.75', name: 'Growers Harvest Porridge Oats'},
  {price: '£1.00', name: 'Quaker Oat So Simple Golden Syrup Porridge 57G'},
  {price: '£1.00', name: 'Kelloggs Crunchy Nut Chocolate Oat Granola 380G'},
  {price: '£1.10', name: 'Oat & Barley Loaf 800G'},
  {price: '£2.99', name: 'Quaker Oat Granola Raisin 500G'},
  {price: '£2.60', name: 'Activia Grains & Nuts Walnuts & Oats Yogurt 4X120g'},
  {price: '£2.50', name: 'Nescafe Gold Oat Latte (6X16g) Gb'},
  {price: '£2.60', name: 'Nestle Cheerios Oat Low Sugar Cereal 325G'},
  {price: '£3.00', name:'Jordans Crunchy Oat Tropical Fruits Granola 750G'},
  {price: '£1.50', name: 'Nomadic Oats Chocolate & Natural Yogurt 169G'},
  {price: '£2.50', name: 'Trek Flapjack Cocoa Oat 50G 3 Pack'},
  {price: '£2.20', name: 'Quaker Oat So Simple Big Golden Syrup Porridge 6 Pack 298G'},
  {price: '£2.00', name: 'Free From Pure Oats 450G'},
  {price: '£4.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo 360Ml'},
  {price: '£2.50', name: 'Nairns Gluten Free Oat Bar Cacao & Orange 160G'},
  {price: '£2.75', name: 'Quaker Oat So Simple Apple & Blueberry Porridge 10 X36g'},
  {price: '£1.99', name: 'Belvita Golden Oats Biscuits 225G'},
  {price: '£2.50', name: 'Nairns Gluten Free Oat Bar Apple & Cinnamon 160G'},
  {price: '£2.75', name: 'Quaker Oat So Simple Sultana Raisin Apple Porridge 10 X38.5G'},
  {price: '£1.55', name: 'Oatly Creamy Oat Fraiche 200Ml'},
  {price: '£2.75', name: 'Quaker Oat So Simple Protein Original Porridge 8Pk302g'},
  {price: '£2.50', name: 'Graze Honey And Oat Bar 4 X 30G'},
  {price: '£0.75', name: 'Oomf Protein Oats Golden Syrup Porridge 75G'},
  {price: '£3.00', name: 'Stockans Thick Oatcakes 200G (L)'},
  {price: '£3.50', name: 'Goodbelly Oat Flakes With Banana & Blueberry 350G'},
  {price: '£2.00', name: 'Berry Oat & Flax Seed Smoothie Mix 500G'},
  {price: '£2.75', name: 'Fro Oat & Sunflower Seed Crisp Bread 200G'},
  {price: '£1.60', name: 'Ryvita Pumpkin & Oats Crisp Bread 4X50g'},
  {price: '£1.85', name: 'Mornflake Mighty Creamy Superfast Oats 1.25Kg'},
  {price: '£2.75', name: 'Quaker Oat So Simple Protein Golden Syrup Porridge 8X 43G'},
  {price: '£2.75', name: 'Quaker Oat So Simple Protein Cinnamon Porridge 8Pack 46G'}
]
   seed_products_3.each do |seed_product|
    if Product.where(name: seed_product[:name]).length > 0
     image_src = Product.where(name: seed_product[:name])[0].image
     Product.create(supermarket: sainsburys, image: image_src, price: seed_product[:price], name: seed_product[:name])
   end
end

## WAITROSE
seed_products_4 = [
  {price: '£0.95', name: 'Growers Harvest Porridge Oats'},
  {price: '£2.15', name: 'Quaker Oat So Simple Golden Syrup Porridge 57G'},
  {price: '£2.20', name: 'Kelloggs Crunchy Nut Chocolate Oat Granola 380G'},
  {price: '£1.30', name: 'Oat & Barley Loaf 800G'},
  {price: '£2.99', name: 'Quaker Oat Granola Raisin 500G'},
  {price: '£2.60', name: 'Activia Grains & Nuts Walnuts & Oats Yogurt 4X120g'},
  {price: '£2.50', name: 'Nescafe Gold Oat Latte (6X16g) Gb'},
  {price: '£3.10', name: 'Nestle Cheerios Oat Low Sugar Cereal 325G'},
  {price: '£3.50', name:'Jordans Crunchy Oat Tropical Fruits Granola 750G'},
  {price: '£1.80', name: 'Nomadic Oats Chocolate & Natural Yogurt 169G'},
  {price: '£3.00', name: 'Trek Flapjack Cocoa Oat 50G 3 Pack'},
  {price: '£2.40', name: 'Quaker Oat So Simple Big Golden Syrup Porridge 6 Pack 298G'},
  {price: '£2.20', name: 'Free From Pure Oats 450G'},
  {price: '£5.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo 360Ml'},
  {price: '£2.70', name: 'Nairns Gluten Free Oat Bar Cacao & Orange 160G'},
  {price: '£2.75', name: 'Quaker Oat So Simple Apple & Blueberry Porridge 10 X36g'},
  {price: '£1.99', name: 'Belvita Golden Oats Biscuits 225G'},
  {price: '£2.80', name: 'Nairns Gluten Free Oat Bar Apple & Cinnamon 160G'},
  {price: '£2.95', name: 'Quaker Oat So Simple Sultana Raisin Apple Porridge 10 X38.5G'},
  {price: '£2.55', name: 'Oatly Creamy Oat Fraiche 200Ml'},
  {price: '£3.75', name: 'Quaker Oat So Simple Protein Original Porridge 8Pk302g'},
  {price: '£2.70', name: 'Graze Honey And Oat Bar 4 X 30G'},
  {price: '£1.75', name: 'Oomf Protein Oats Golden Syrup Porridge 75G'},
  {price: '£3.00', name: 'Stockans Thick Oatcakes 200G (L)'},
  {price: '£3.50', name: 'Goodbelly Oat Flakes With Banana & Blueberry 350G'},
  {price: '£2.50', name: 'Berry Oat & Flax Seed Smoothie Mix 500G'},
  {price: '£3.05', name: 'Fro Oat & Sunflower Seed Crisp Bread 200G'},
  {price: '£2.00', name: 'Ryvita Pumpkin & Oats Crisp Bread 4X50g'},
  {price: '£2.85', name: 'Mornflake Mighty Creamy Superfast Oats 1.25Kg'},
  {price: '£2.65', name: 'Quaker Oat So Simple Protein Golden Syrup Porridge 8X 43G'},
  {price: '£2.95', name: 'Quaker Oat So Simple Protein Cinnamon Porridge 8Pack 46G'}
]
  seed_products_4.each do |seed_product|
    if Product.where(name: seed_product[:name]).length > 0
    # image_src = Product.where(name: seed_product[:name])[0].image
   Product.create(supermarket: waitrose, price: seed_product[:price], name: seed_product[:name])
   end
end

# asda = Supermarket.create!(name: "Asda", website: "https://www.asda.com")
# seed_products_5 = [{price: '£0.65', name: 'Growers Harvest Porridge Oats'}, {price: '£1.00', name: 'Quaker Oat So Simple Golden Syrup Porridge 57G'},
# {price: '£1.10', name: 'Kelloggs Crunchy Nut Chocolate Oat Granola 380G'}, {price: '£1.30', name: 'Oat & Barley Loaf 800G'}, {price: '£2.99', name: 'Quaker Oat Granola Raisin 500G'}, {price: '£2.60', name: 'Activia Grains & Nuts Walnuts & Oats Yogurt 4X120g'},  {price: '£2.50', name: 'Nescafe Gold Oat Latte (6X16g) Gb'},
# {price: '£3.10', name: 'Nestle Cheerios Oat Low Sugar Cereal 325G'}, {price: '£3.50', name:'Jordans Crunchy Oat Tropical Fruits Granola 750G'}, {price: '£1.80', name: 'Nomadic Oats Chocolate & Natural Yogurt 169G'},
# {price: '£2.90', name: 'Trek Flapjack Cocoa Oat 50G 3 Pack'}, {price: '£2.40', name: 'Quaker Oat So Simple Big Golden Syrup Porridge 6 Pack 298G'}, {price: '£2.10', name: 'Free From Pure Oats 450G'},
# {price: '£5.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo 360Ml'}, {price: '£2.70', name: 'Nairns Gluten Free Oat Bar Cacao & Orange 160G'}, {price: '£2.75', name: 'Quaker Oat So Simple Apple & Blueberry Porridge 10 X36g'}, {price: '£1.99', name: 'Belvita Golden Oats Biscuits 225G'}, {price: '£1.99', name: 'Belvita Golden Oats Biscuits 225G'},
# {price: '£2.80', name: 'Nairns Gluten Free Oat Bar Apple & Cinnamon 160G'}, {price: '£2.95', name: 'Quaker Oat So Simple Sultana Raisin Apple Porridge 10 X38.5G'},  {price: '£2.55', name: 'Oatly Creamy Oat Fraiche 200Ml'}, {price: '£3.75', name: 'Quaker Oat So Simple Protein Original Porridge 8Pk302g'}, {price: '£2.70', name: 'Graze Honey And Oat Bar 4 X 30G'}, {price: '£1.75', name: 'Oomf Protein Oats Golden Syrup Porridge 75G'},
# {price: '£3.20', name: 'Stockans Thick Oatcakes 200G (L)'}, {price: '£3.30', name: 'Goodbelly Oat Flakes With Banana & Blueberry 350G'},
# {price: '£2.30', name: 'Berry Oat & Flax Seed Smoothie Mix 500G'}, {price: '£3.00', name: 'Fro Oat & Sunflower Seed Crisp Bread 200G'},
# {price: '£1.40', name: 'Ryvita Pumpkin & Oats Crisp Bread 4X50g'}, {price: '£1.65', name: 'Mornflake Mighty Creamy Superfast Oats 1.25Kg'},
# {price: '£3.65', name: 'Quaker Oat So Simple Protein Golden Syrup Porridge 8X 43G'}, {price: '£3.95', name: 'Quaker Oat So Simple Protein Cinnamon Porridge 8Pack 46G'}]
#    seed_products_5.each do |seed_product|
#     if Product.where(name: seed_product[:name]).length > 0
#      image_src = Product.where(name: seed_product[:name])[0].image
#      Product.create(supermarket: sainsburys, image: image_src, price: seed_product[:price], name: seed_product[:name])
#    end
# end

#SHAMPOO

# waitrose = Supermarket.create!(name: "Waitrose", website: "https://www.waitrose.com")
# seed_products_6 = [{price: '£2.75', name: 'Tresemme Rich Luxurious Moisture Shampoo 900Ml'},
#  {price: '£3.50', name: 'Ogx Moroccan Argan Oil Shampoo 385Ml'}, {price: '£2.75', name: 'Tresemme Deep Cleansing Shampoo'},
# {price: '£2.75', name: 'Pantene Smooth & Sleek'}, {price: '£4.00', name: 'Garnier Ultimate Blends Coconut Oil Shampoo Frizzy Hair 360Ml'},
# {price: '£3.00', name: 'Herbal Essences Bio. Renew Argan Shampoo'}, {price: '£3.00', name: 'Alberto Balsam Blueberry'},
# {price: '£2.50', name: 'Simple Kind To Hair Gently/Gentle Care Shampoo 200Ml'}, {price: '£2.75', name:'Tresemme Colour Revitalise Shampoo'},
# {price: '£4.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo'},{price: '£5.00', name: 'Alpecin Caffeine'},
# {price: '£4.00', name: 'Aussie Aussome Volume'}, {price: '£2.75', name: 'Tresemme 24 Hour Body'},
# {price: '£5.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo 360Ml'},
# {price: '£3.50', name: 'Ogx Biotin & Collagen Volume Shampoo 385 Ml'}, {price: '£2.50', name: 'Pantene Sheer Volume'},
# {price: '£5.00', name: 'Head & Shoulders Smooth'}, {price: '£3.00', name: 'Herbal Essences Manuka'},
# {price: '£3.00', name: 'Herbal Essences Bio. Renew Coconut Shampoo'}, {price: '£3.00', name: 'Ogx Miracle Oil Shampoo'},
# {price: '£4.55', name: 'Herbal Essences Uplifting'}, {price: '£4.75', name: 'Aussie Miracle Moist'},
# {price: '£2.70', name: 'Dove Intensive Repair'}, {price: '£5.55', name: 'Loreal Elvive Clay Oily'},
# {price: '£5.50', name: 'Loreal Elvive Men'}, {price: '£2.00', name: 'Vosene Mens Anti'}]
#    seed_products_6.each do |seed_product|
#    if Product.where(name: seed_product[:name]).length > 0
#     # image_src = Product.where(name: seed_product[:name])[0].image
#     Product.create(supermarket: sainsburys,  price: seed_product[:price], name: seed_product[:name])
#    end
# end


# asda = Supermarket.create!(name: "Asda", website: "https://www.asda.com")
# seed_products_7 = [{price: '£2.75', name: 'Tresemme Rich Luxurious Moisture Shampoo 900Ml'},
# {price: '£6.00', name: 'Ogx Moroccan Argan Oil Shampoo 385Ml'},{price: '£2.75', name: 'Tresemme Deep Cleansing Shampoo'},{price: '£3.50', name: 'Pantene Smooth & Sleek'},
# {price: '£4.00', name: 'Garnier Ultimate Blends Coconut Oil Shampoo Frizzy Hair 360Ml'},
# {price: '£3.00', name: 'Herbal Essences Bio. Renew Argan Shampoo'},{price: '£5.00', name: 'Alberto Balsam Blueberry'},
# {price: '£2.50', name: 'Simple Kind To Hair Gently/Gentle Care Shampoo 200Ml'},{price: '£2.75', name:'Tresemme Colour Revitalise Shampoo'},
# {price: '£4.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo'},{price: '£7.00', name: 'Alpecin Caffeine'},
# {price: '£4.00', name: 'Aussie Aussome Volume'}, {price: '£2.75', name: 'Tresemme 24 Hour Body'},
# {price: '£5.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo 360Ml'},
# {price: '£3.50', name: 'Ogx Biotin & Collagen Volume Shampoo 385 Ml'},
# {price: '£2.50', name: 'Pantene Sheer Volume'}, {price: '£5.00', name: 'Head & Shoulders Smooth'},
# {price: '£2.00', name: 'Herbal Essences Manuka'}, {price: '£3.00', name: 'Herbal Essences Bio. Renew Coconut Shampoo'},
# {price: '£3.00', name: 'Ogx Miracle Oil Shampoo'}, {price: '£4.55', name: 'Herbal Essences Uplifting'},
#  {price: '£5.75', name: 'Aussie Miracle Moist'}, {price: '£1.70', name: 'Dove Intensive Repair'},{price: '£4.55', name: 'Loreal Elvive Clay Oily'},
# {price: '£5.50', name: 'Loreal Elvive Men'}, {price: '£1.00', name: 'Vosene Mens Anti'}]
#    seed_products_7.each do |seed_product|
#     if Product.where(name: seed_product[:name]).length > 0
#   #   image_src = Product.where(name: seed_product[:name])[0].image
#     Product.create(supermarket: sainsburys, price: seed_product[:price], name: seed_product[:name])
#    end
# end

# sainsburys = Supermarket.create!(name: "sainsburys", website: "https://www.sainsbury.com")
# seed_products_8 = [{price: '£2.75', name: 'Tresemme Rich Luxurious Moisture Shampoo 900Ml'},
#  {price: '£4.00', name: 'Ogx Moroccan Argan Oil Shampoo 385Ml'},{price: '£2.75', name: 'Tresemme Deep Cleansing Shampoo'},
# {price: '£3.50', name: 'Pantene Smooth & Sleek'},{price: '£4.00', name: 'Garnier Ultimate Blends Coconut Oil Shampoo Frizzy Hair 360Ml'},
# {price: '£3.00', name: 'Herbal Essences Bio. Renew Argan Shampoo'},{price: '£5.00', name: 'Alberto Balsam Blueberry'},
# {price: '£2.50', name: 'Simple Kind To Hair Gently/Gentle Care Shampoo 200Ml'},{price: '£2.75', name:'Tresemme Colour Revitalise Shampoo'},
# {price: '£3.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo'},{price: '£5.00', name: 'Alpecin Caffeine'},
# {price: '£4.00', name: 'Aussie Aussome Volume'},{price: '£2.25', name: 'Tresemme 24 Hour Body'},
# {price: '£5.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo 360Ml'},{price: '£3.50', name: 'Ogx Biotin & Collagen Volume Shampoo 385 Ml'},
# {price: '£2.50', name: 'Pantene Sheer Volume'},{price: '£5.00', name: 'Head & Shoulders Smooth'},
# {price: '£2.00', name: 'Herbal Essences Manuka'},{price: '£3.00', name: 'Herbal Essences Bio. Renew Coconut Shampoo'},
# {price: '£3.00', name: 'Ogx Miracle Oil Shampoo'},{price: '£2.55', name: 'Herbal Essences Uplifting'},
# {price: '£4.75', name: 'Aussie Miracle Moist'},
# {price: '£1.70', name: 'Dove Intensive Repair'},{price: '£4.55', name: 'Loreal Elvive Clay Oily'},
# {price: '£5.50', name: 'Loreal Elvive Men'},{price: '£3.00', name: 'Vosene Mens Anti'}]
#    seed_products_8.each do |seed_product|
#     if Product.where(name: seed_product[:name]).length > 0
#   #   image_src = Product.where(name: seed_product[:name])[0].image
#      Product.create(supermarket: sainsburys, price: seed_product[:price], name: seed_product[:name])
#    end
# end

# #BOOZE



# sainsburys = Supermarket.create!(name: "Sainsburys", website: "https://www.sainsburys.com")
# seed_products_9 = [{price: '£21.40', name: 'Bombay Sapphire gin'},
# {price: '£14.00', name: 'Gordons Special Dry London Gin'},
# {price: '£21.00', name: 'Haymans London Dry Gin'},
# {price: '£23.00', name: 'Martin Millers Gin'},
# {price: '£21.00', name: 'Lone Wolf Cloudy Lemon London Dry Gin'},
# {price: '£21.00', name: 'Haymans Sloe Gin'},
# {price: '£18.00', name: 'Tanqueray London Dry Gin'},
# {price: '£30.00', name: 'Hendricks gin'},
# {price: '£28.50', name:'Sipsmith London'},
# {price: '£37.00', name: 'Cotswolds Dry Gin'},
# {price: '£30.00', name: 'Roku Gin'},
# {price: '£40.00', name: 'Pink Pepper Gin'},
# {price: '£31.60', name: 'Bathtub Gin'},
# {price: '£38.00', name: 'Chase Pink Grapefruit & Pomelo Gin'},
# {price: '£38.50', name: 'Chase Rhubarb & Bramley Apple Gin'},
# {price: '£36.00', name: 'Warner Edwards Harrington Elderflower Gin'},
# {price: '£35.00', name: 'Oxley London Dry Gin'},
# {price: '£46.00', name: 'Monkey 47 Gin'},
# {price: '£32.00', name: 'Tanqueray Sevilla Gin'},
# {price: '£46.00', name: 'The Botanist Islay Dry Gin'}]
#  seed_products_9.each do |seed_product|
#     if Product.where(name: seed_product[:name]).length > 0
# #     image_src = Product.where(name: seed_product[:name])[0].image
#      Product.create(supermarket: sainsburys, price: seed_product[:price], name: seed_product[:name])
#    end
# end




# asda = Supermarket.create!(name: "Asda", website: "https://www.asda.com")
# seed_products_10 = [{price: '£16.00', name: 'Bombay Sapphire gin'},
# {price: '£17.00', name: 'Gordons Special Dry London Gin'},
# {price: '£22.00', name: 'Haymans London Dry Gin'},
# {price: '£22.00', name: 'Martin Millers Gin'},
# {price: '£25.00', name: 'Lone Wolf Cloudy Lemon London Dry Gin'},
# {price: '£17.00', name: 'Haymans Sloe Gin'},
# {price: '£18.00', name: 'Tanqueray London Dry Gin'},
# {price: '£30.00', name: 'Hendricks gin'},
# {price: '£22.50', name:'Sipsmith London'},
# {price: '£35.00', name: 'Cotswolds Dry Gin'},
# {price: '£25.00', name: 'Roku Gin'},
# {price: '£13.00', name: 'Pink Pepper Gin'},
# {price: '£31.60', name: 'Bathtub Gin'},
# {price: '£38.00', name: 'Chase Pink Grapefruit & Pomelo Gin'},
# {price: '£38.50', name: 'Chase Rhubarb & Bramley Apple Gin'},
# {price: '£33.00', name: 'Warner Edwards Harrington Elderflower Gin'},
# {price: '£35.00', name: 'Oxley London Dry Gin'},
# {price: '£46.00', name: 'Monkey 47 Gin'},
# {price: '£30.00', name: 'Tanqueray Sevilla Gin'},
# {price: '£40.00', name: 'The Botanist Islay Dry Gin'}]
#  seed_products_10.each do |seed_product|
#     if Product.where(name: seed_product[:name]).length > 0
# #     image_src = Product.where(name: seed_product[:name])[0].image
#      Product.create(supermarket: Asda, price: seed_product[:price], name: seed_product[:name])
#    end
# end

# waitrose = Supermarket.create!(name: "Waitrose", website: "https://www.waitrose.com")
# seed_products_11 = [{price: '£27.00', name: 'Bombay Sapphire gin'},
# {price: '£15.00', name: 'Gordons Special Dry London Gin'},
# {price: '£15.40', name: 'Haymans London Dry Gin'},
# {price: '£27.00', name: 'Martin Millers Gin'},
# {price: '£20.00', name: 'Lone Wolf Cloudy Lemon London Dry Gin'},
# {price: '£17.00', name: 'Haymans Sloe Gin'},
# {price: '£18.00', name: 'Tanqueray London Dry Gin'},
# {price: '£30.00', name: 'Hendricks gin'},
# {price: '£22.50', name:'Sipsmith London'},
# {price: '£35.00', name: 'Cotswolds Dry Gin'},
# {price: '£30.00', name: 'Roku Gin'},
# {price: '£22.00', name: 'Pink Pepper Gin'},
# {price: '£31.60', name: 'Bathtub Gin'},
# {price: '£36.00', name: 'Chase Pink Grapefruit & Pomelo Gin'},
# {price: '£38.50', name: 'Chase Rhubarb & Bramley Apple Gin'},
# {price: '£33.00', name: 'Warner Edwards Harrington Elderflower Gin'},
# {price: '£31.00', name: 'Oxley London Dry Gin'},
# {price: '£46.00', name: 'Monkey 47 Gin'},
# {price: '£30.00', name: 'Tanqueray Sevilla Gin'},
# {price: '£39.00', name: 'The Botanist Islay Dry Gin'}]
#  seed_products_11.each do |seed_product|
#     if Product.where(name: seed_product[:name]).length > 0
# #     image_src = Product.where(name: seed_product[:name])[0].image
#      Product.create(supermarket: Waitrose, price: seed_product[:price], name: seed_product[:name])
#    end
# end
puts "creating branches"

Branch.create(address:'E2 8DY London', supermarket: tesco)
Branch.create(address:'W1D 3RF London', supermarket: tesco)
Branch.create(address:'SW1V 1DT London', supermarket: sainsburys)
Branch.create(address:'E14 4QT London', supermarket: waitrose)
Branch.create(address:'SE17 2DL London', supermarket: waitrose)
Branch.create(address:'SE1 5AG London', supermarket: tesco)
Branch.create(address:'E15 1HP London', supermarket: sainsburys)
Branch.create(address:'SW8 2LF London', supermarket: waitrose)
Branch.create(address:'E17 7AD London', supermarket: tesco)


Branch.create(address: 'SW1Y 4LR London', supermarket: tesco)
Branch.create(address: 'SW1A 2JR London', supermarket: tesco)
Branch.create(address: 'W1J 7UP London', supermarket: tesco)
Branch.create(address: 'WC2R 0AP London', supermarket: tesco)
Branch.create(address: 'WC2R 0AP London', supermarket: tesco)
Branch.create(address: 'WC2R 0AP London', supermarket: tesco)
Branch.create(address: 'SE1 7AA London', supermarket: tesco)
Branch.create(address: 'SE1 8UL London', supermarket: tesco)
Branch.create(address: 'SW1P 2BW London', supermarket: tesco)
Branch.create(address: 'W1D 3RF London', supermarket: tesco)
Branch.create(address: 'WC2R 0AP London', supermarket: tesco)

Branch.create(address: 'N1 6AA London', supermarket: tesco)
Branch.create(address: 'N1 3JE London', supermarket: tesco)
Branch.create(address: 'E8 4DG London', supermarket: tesco)
Branch.create(address: 'E2 7QU London', supermarket: tesco)
Branch.create(address: 'N1 8SY London', supermarket: tesco)
Branch.create(address: 'N1 2EB London', supermarket: tesco)
Branch.create(address: 'E1 6HP London', supermarket: tesco)
Branch.create(address: 'N1 8DU London', supermarket: tesco)
Branch.create(address: 'EC1V 3AF London', supermarket: tesco)
Branch.create(address: 'EC1Y 1AG London', supermarket: tesco)

Branch.create(address: 'EC1V 9EY London', supermarket: sainsburys)
Branch.create(address: 'E2 8DJ London', supermarket: sainsburys)
Branch.create(address: 'EC1Y 1BD London', supermarket: sainsburys)
Branch.create(address: 'EC1V 1NR London', supermarket: sainsburys)
Branch.create(address: 'E1 6HZ London', supermarket: sainsburys)
Branch.create(address: 'E2 7SJ London', supermarket: sainsburys)
Branch.create(address: 'E1  London', supermarket: sainsburys)
Branch.create(address: 'N1 8 London', supermarket: sainsburys)
Branch.create(address: 'EC1V 3 London', supermarket: sainsburys)
Branch.create(address: 'EC1Y 1 London', supermarket: sainsburys)
Branch.create(address:'E15 1 London', supermarket: sainsburys)

Branch.create(address: 'W1A 1EX London', supermarket: waitrose)
Branch.create(address: 'SW1E 6QP London', supermarket: waitrose)
Branch.create(address: 'SW1V 1QT London', supermarket: waitrose)
Branch.create(address: 'SW1E 5DH London', supermarket: waitrose)
Branch.create(address: 'SE1 9LS London', supermarket: waitrose)
Branch.create(address: 'WC1V 7EX London', supermarket: waitrose)


# Branch.create(address: 'E1 5BW London', supermarket: asda)
# Branch.create(address: 'E1 4UJ London', supermarket: asda)
# Branch.create(address: 'SE1 5AG London', supermarket: asda)
# Branch.create(address: 'E10 5NH London', supermarket: asda)
# Branch.create(address: 'N15 4QD London', supermarket: asda)
# Branch.create(address: ' N17 9JF London', supermarket: asda)



# Branch.create(address: 'N7 6PL London', supermarket: morrisons)
# Branch.create(address: 'N16 5TB London', supermarket: morrisons)
# Branch.create(address: 'NW1 8AA London', supermarket: morrisons)
# Branch.create(address: 'SE17 2DLLondon', supermarket: morrisons)
# Branch.create(address: 'E15 1HP London', supermarket: morrisons)
# Branch.create(address: 'SE5 8RR London', supermarket: morrisons)
# Branch.create(address: 'SE15 5EW London', supermarket: morrisons)
# Branch.create(address: 'E16 1ED London', supermarket: morrisons)
# Branch.create(address: 'N22 6SU London', supermarket: morrisons)












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

# waitrose = Supermarket.create!(name: "Waitrose", website: "https://www.waitrose.com"
# seed_products_6 = [{price: '£2.75', name: 'Tresemme Rich Luxurious Moisture Shampoo 900Ml'},
#  {price: '£3.50', name: 'Ogx Moroccan Argan Oil Shampoo 385Ml'},{price: '£2.75', name: 'Tresemme Deep Cleansing Shampoo'},
# {price: '£2.75', name: 'Pantene Smooth & Sleek'},{price: '£4.00', name: 'Garnier Ultimate Blends Coconut Oil Shampoo Frizzy Hair 360Ml'},
# {price: '£3.00', name: 'Herbal Essences Bio. Renew Argan Shampoo'},{price: '£3.00', name: 'Alberto Balsam Blueberry'},
# {price: '£2.50', name: 'Simple Kind To Hair Gently/Gentle Care Shampoo 200Ml'},{price: '£2.75', name:'Tresemme Colour Revitalise Shampoo'},
# {price: '£4.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo'},{price: '£5.00', name: 'Alpecin Caffeine'},
# {price: '£4.00', name: 'Aussie Aussome Volume'},{price: '£2.75', name: 'Tresemme 24 Hour Body'},
# {price: '£5.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo 360Ml'},
# {price: '£3.50', name: 'Ogx Biotin & Collagen Volume Shampoo 385 Ml'},{price: '£2.50', name: 'Pantene Sheer Volume'},
# {price: '£5.00', name: 'Head & Shoulders Smooth'},{price: '£3.00', name: 'Herbal Essences Manuka'},
# {price: '£3.00', name: 'Herbal Essences Bio. Renew Coconut Shampoo'},{price: '£3.00', name: 'Ogx Miracle Oil Shampoo'},
# {price: '£4.55', name: 'Herbal Essences Uplifting'},{price: '£4.75', name: 'Aussie Miracle Moist'},
# {price: '£2.70', name: 'Dove Intensive Repair'},{price: '£5.55', name: 'Loreal Elvive Clay Oily'},
# {price: '£5.50', name: 'Loreal Elvive Men'},{price: '£2.00', name: 'Vosene Mens Anti'},
# ]
#   seed_products_6.each do |seed_product|
#    if Product.where(name: seed_product[:name]).length > 0
#     image_src = Product.where(name: seed_product[:name])[0].image
#     Product.create(supermarket: sainsburys, image: image_src, price: seed_product[:price], name: seed_product[:name])
#   end
# end
# asda = Supermarket.create!(name: "Asda", website: "https://www.asda.com"
# seed_products_7 = [{price: '£2.75', name: 'Tresemme Rich Luxurious Moisture Shampoo 900Ml'},
# {price: '£6.00', name: 'Ogx Moroccan Argan Oil Shampoo 385Ml'},{price: '£2.75', name: 'Tresemme Deep Cleansing Shampoo'},{price: '£3.50', name: 'Pantene Smooth & Sleek'},
# {price: '£4.00', name: 'Garnier Ultimate Blends Coconut Oil Shampoo Frizzy Hair 360Ml'},
# {price: '£3.00', name: 'Herbal Essences Bio. Renew Argan Shampoo'},{price: '£5.00', name: 'Alberto Balsam Blueberry'},
# {price: '£2.50', name: 'Simple Kind To Hair Gently/Gentle Care Shampoo 200Ml'},{price: '£2.75', name:'Tresemme Colour Revitalise Shampoo'},
# {price: '£4.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo'},{price: '£7.00', name: 'Alpecin Caffeine'},
# {price: '£4.00', name: 'Aussie Aussome Volume'},{price: '£2.75', name: 'Tresemme 24 Hour Body'},
# {price: '£5.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo 360Ml'},
# {price: '£3.50', name: 'Ogx Biotin & Collagen Volume Shampoo 385 Ml'},
# {price: '£2.50', name: 'Pantene Sheer Volume'},{price: '£5.00', name: 'Head & Shoulders Smooth'},
# {price: '£2.00', name: 'Herbal Essences Manuka'},{price: '£3.00', name: 'Herbal Essences Bio. Renew Coconut Shampoo'},
# {price: '£3.00', name: 'Ogx Miracle Oil Shampoo'},{price: '£4.55', name: 'Herbal Essences Uplifting'},
#  {price: '£5.75', name: 'Aussie Miracle Moist'},{price: '£1.70', name: 'Dove Intensive Repair'},{price: '£4.55', name: 'Loreal Elvive Clay Oily'},
# {price: '£5.50', name: 'Loreal Elvive Men'},{price: '£1.00', name: 'Vosene Mens Anti'},
# ]
#   seed_products_7.each do |seed_product|
#    if Product.where(name: seed_product[:name]).length > 0
#     image_src = Product.where(name: seed_product[:name])[0].image
#     Product.create(supermarket: sainsburys, image: image_src, price: seed_product[:price], name: seed_product[:name])
#   end
# end
# sainsburys = Supermarket.create!(name: "sainsburys", website: "https://www.asda.com"
# seed_products_8 = [{price: '£2.75', name: 'Tresemme Rich Luxurious Moisture Shampoo 900Ml'},
#  {price: '£4.00', name: 'Ogx Moroccan Argan Oil Shampoo 385Ml'},{price: '£2.75', name: 'Tresemme Deep Cleansing Shampoo'},
# {price: '£3.50', name: 'Pantene Smooth & Sleek'},{price: '£4.00', name: 'Garnier Ultimate Blends Coconut Oil Shampoo Frizzy Hair 360Ml'},
# {price: '£3.00', name: 'Herbal Essences Bio. Renew Argan Shampoo'},{price: '£5.00', name: 'Alberto Balsam Blueberry'},
# {price: '£2.50', name: 'Simple Kind To Hair Gently/Gentle Care Shampoo 200Ml'},{price: '£2.75', name:'Tresemme Colour Revitalise Shampoo'},
# {price: '£3.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo'},{price: '£5.00', name: 'Alpecin Caffeine'},
# {price: '£4.00', name: 'Aussie Aussome Volume'},{price: '£2.25', name: 'Tresemme 24 Hour Body'},
# {price: '£5.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo 360Ml'},{price: '£3.50', name: 'Ogx Biotin & Collagen Volume Shampoo 385 Ml'},
# {price: '£2.50', name: 'Pantene Sheer Volume'},{price: '£5.00', name: 'Head & Shoulders Smooth'},
# {price: '£2.00', name: 'Herbal Essences Manuka'},{price: '£3.00', name: 'Herbal Essences Bio. Renew Coconut Shampoo'},
# {price: '£3.00', name: 'Ogx Miracle Oil Shampoo'},{price: '£2.55', name: 'Herbal Essences Uplifting'},
# {price: '£4.75', name: 'Aussie Miracle Moist'},
# {price: '£1.70', name: 'Dove Intensive Repair'},{price: '£4.55', name: 'Loreal Elvive Clay Oily'},
# {price: '£5.50', name: 'Loreal Elvive Men'},{price: '£3.00', name: 'Vosene Mens Anti'},
# ]
#   seed_products_8.each do |seed_product|
#    if Product.where(name: seed_product[:name]).length > 0
#     image_src = Product.where(name: seed_product[:name])[0].image
#     Product.create(supermarket: sainsburys, image: image_src, price: seed_product[:price], name: seed_product[:name])
#   end
# end
# sainsburys = Supermarket.create!(name: "sainsburys", website: "https://www.asda.com"
# seed_products_9 = [{price: '£21.40', name: 'Bombay Sapphire gin'},
# {price: '£14.00', name: 'Gordons Special Dry London Gin'},
# {price: '£21.00', name: 'Haymans London Dry Gin'},
# {price: '£23.00', name: 'Martin Millers Gin'},
# {price: '£21.00', name: 'Lone Wolf Cloudy Lemon London Dry Gin'},
# {price: '£21.00', name: 'Haymans Sloe Gin'},
# {price: '£18.00', name: 'Tanqueray London Dry Gin'},
# {price: '£30.00', name: 'Hendricks gin'},
# {price: '£28.50', name:'Sipsmith London'},
# {price: '£37.00', name: 'Cotswolds Dry Gin'},
# {price: '£30.00', name: 'Roku Gin'},
# {price: '£40.00', name: 'Pink Pepper Gin'},
# {price: '£31.60', name: 'Bathtub Gin'},
# {price: '£38.00', name: 'Chase Pink Grapefruit & Pomelo Gin'},
# {price: '£38.50', name: 'Chase Rhubarb & Bramley Apple Gin'},
# {price: '£36.00', name: 'Warner Edwards Harrington Elderflower Gin'},
# {price: '£35.00', name: 'Oxley London Dry Gin'},
# {price: '£46.00', name: 'Monkey 47 Gin'},
# {price: '£32.00', name: 'Tanqueray Sevilla Gin'},
# {price: '£46.00', name: 'The Botanist Islay Dry Gin'},
# ]
# seed_products_9.each do |seed_product|
#    if Product.where(name: seed_product[:name]).length > 0
#     image_src = Product.where(name: seed_product[:name])[0].image
#     Product.create(supermarket: sainsburys, image: image_src, price: seed_product[:price], name: seed_product[:name])
#   end
# end
# asda = Supermarket.create!(name: "asda", website: "https://www.asda.com"
# seed_products_10 = [{price: '£16.00', name: 'Bombay Sapphire gin'},
# {price: '£17.00', name: 'Gordons Special Dry London Gin'},
# {price: '£22.00', name: 'Haymans London Dry Gin'},
# {price: '£22.00', name: 'Martin Millers Gin'},
# {price: '£25.00', name: 'Lone Wolf Cloudy Lemon London Dry Gin'},
# {price: '£17.00', name: 'Haymans Sloe Gin'},
# {price: '£18.00', name: 'Tanqueray London Dry Gin'},
# {price: '£30.00', name: 'Hendricks gin'},
# {price: '£22.50', name:'Sipsmith London'},
# {price: '£35.00', name: 'Cotswolds Dry Gin'},
# {price: '£25.00', name: 'Roku Gin'},
# {price: '£13.00', name: 'Pink Pepper Gin'},
# {price: '£31.60', name: 'Bathtub Gin'},
# {price: '£38.00', name: 'Chase Pink Grapefruit & Pomelo Gin'},
# {price: '£38.50', name: 'Chase Rhubarb & Bramley Apple Gin'},
# {price: '£33.00', name: 'Warner Edwards Harrington Elderflower Gin'},
# {price: '£35.00', name: 'Oxley London Dry Gin'},
# {price: '£46.00', name: 'Monkey 47 Gin'},
# {price: '£30.00', name: 'Tanqueray Sevilla Gin'},
# {price: '£40.00', name: 'The Botanist Islay Dry Gin'},
# ]
# seed_products_10.each do |seed_product|
#    if Product.where(name: seed_product[:name]).length > 0
#     image_src = Product.where(name: seed_product[:name])[0].image
#     Product.create(supermarket: sainsburys, image: image_src, price: seed_product[:price], name: seed_product[:name])
#   end
# end
# waitrose = Supermarket.create!(name: "waitrose", website: "https://www.asda.com"
# seed_products_11 = [{price: '£27.00', name: 'Bombay Sapphire gin'},
# {price: '£15.00', name: 'Gordons Special Dry London Gin'},
# {price: '£15.40', name: 'Haymans London Dry Gin'},
# {price: '£27.00', name: 'Martin Millers Gin'},
# {price: '£20.00', name: 'Lone Wolf Cloudy Lemon London Dry Gin'},
# {price: '£17.00', name: 'Haymans Sloe Gin'},
# {price: '£18.00', name: 'Tanqueray London Dry Gin'},
# {price: '£30.00', name: 'Hendricks gin'},
# {price: '£22.50', name:'Sipsmith London'},
# {price: '£35.00', name: 'Cotswolds Dry Gin'},
# {price: '£30.00', name: 'Roku Gin'},
# {price: '£22.00', name: 'Pink Pepper Gin'},
# {price: '£31.60', name: 'Bathtub Gin'},
# {price: '£36.00', name: 'Chase Pink Grapefruit & Pomelo Gin'},
# {price: '£38.50', name: 'Chase Rhubarb & Bramley Apple Gin'},
# {price: '£33.00', name: 'Warner Edwards Harrington Elderflower Gin'},
# {price: '£31.00', name: 'Oxley London Dry Gin'},
# {price: '£46.00', name: 'Monkey 47 Gin'},
# {price: '£30.00', name: 'Tanqueray Sevilla Gin'},
# {price: '£39.00', name: 'The Botanist Islay Dry Gin'},
# ]
# seed_products_11.each do |seed_product|
#    if Product.where(name: seed_product[:name]).length > 0
#     image_src = Product.where(name: seed_product[:name])[0].image
#     Product.create(supermarket: sainsburys, image: image_src, price: seed_product[:price], name: seed_product[:name])
#   end
# end


puts "successful seed!"



# waitrose *

# url = "https://www.waitrose.com/ecom/shop/search?&searchTerm=oat%20milk"
# doc = Nokogiri::HTML(open(url))
# doc.search(".products___2kMi1").each do |result_card|
# prod_name = 'check'
#   price = result_card.search(".prices___1JkR4")
#   image_src = result_card.search("placeholder___2ydJA").value
#   Product.create!(supermarket: waitrose, image: image_src, price: price, name: prod_name)

# end

# aldi => good to go doesnt seem to work for icecream
# url = "https://www.aldi.co.uk/c/groceries/frozen-food/ice-cream-and-desserts"
# doc = Nokogiri::HTML(open(url))
# doc.search(".category-item__wrapper-link").each do |result_card|
#   doc2 = Nokogiri::HTML(open(result_card.attr('href')))
#   name = doc2.search(".product-details__name").text
#   price = "£ " + doc2.search(".product-price__value").text.strip
#   binding.pry
#   image = doc2.search("img").attr('src').value

# end

#podImage___1ajLe
#details___2RheR

# productPod___2BPU9
#productPod___3mbxG podImage___1ajLe

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
puts "done!"
