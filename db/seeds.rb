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


sainsburys = Supermarket.create!(name: "Sainsburys", website: "https://www.sainsburys.com")
seed_products_3 = [{price: '£0.75', name: 'Growers Harvest Porridge Oats'}, {price: '£1.00', name: 'Quaker Oat So Simple Golden Syrup Porridge 57G'},
{price: '£1.00', name: 'Kelloggs Crunchy Nut Chocolate Oat Granola 380G'}, {price: '£1.10', name: 'Oat & Barley Loaf 800G'}, {price: '£2.99', name: 'Quaker Oat Granola Raisin 500G'}, {price: '£2.60', name: 'Activia Grains & Nuts Walnuts & Oats Yogurt 4X120g'},  {price: '£2.50', name: 'Nescafe Gold Oat Latte (6X16g) Gb'},
{price: '£2.60', name: 'Nestle Cheerios Oat Low Sugar Cereal 325G'}, {price: '£3.00', name:'Jordans Crunchy Oat Tropical Fruits Granola 750G'}, {price: '£1.50', name: 'Nomadic Oats Chocolate & Natural Yogurt 169G'},
{price: '£2.50', name: 'Trek Flapjack Cocoa Oat 50G 3 Pack'}, {price: '£2.20', name: 'Quaker Oat So Simple Big Golden Syrup Porridge 6 Pack 298G'}, {price: '£2.00', name: 'Free From Pure Oats 450G'},
{price: '£4.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo 360Ml'}, {price: '£2.50', name: 'Nairns Gluten Free Oat Bar Cacao & Orange 160G'},{price: '£2.75', name: 'Quaker Oat So Simple Apple & Blueberry Porridge 10 X36g'},{price: '£1.99', name: 'Belvita Golden Oats Biscuits 225G'},{price: '£1.99', name: 'Belvita Golden Oats Biscuits 225G'},
{price: '£2.50', name: 'Nairns Gluten Free Oat Bar Apple & Cinnamon 160G'},{price: '£2.75', name: 'Quaker Oat So Simple Sultana Raisin Apple Porridge 10 X38.5G'},  {price: '£1.55', name: 'Oatly Creamy Oat Fraiche 200Ml'}, {price: '£2.75', name: 'Quaker Oat So Simple Protein Original Porridge 8Pk302g'}, {price: '£2.50', name: 'Graze Honey And Oat Bar 4 X 30G'},{price: '£0.75', name: 'Oomf Protein Oats Golden Syrup Porridge 75G'},
{price: '£3.00', name: 'Stockans Thick Oatcakes 200G (L)'},{price: '£3.50', name: 'Goodbelly Oat Flakes With Banana & Blueberry 350G'},
{price: '£2.00', name: 'Berry Oat & Flax Seed Smoothie Mix 500G'},{price: '£2.75', name: 'Fro Oat & Sunflower Seed Crisp Bread 200G'},
{price: '£1.60', name: 'Ryvita Pumpkin & Oats Crisp Bread 4X50g'},{price: '£1.85', name: 'Mornflake Mighty Creamy Superfast Oats 1.25Kg'},
{price: '£2.75', name: 'Quaker Oat So Simple Protein Golden Syrup Porridge 8X 43G'},{price: '£2.75', name: 'Quaker Oat So Simple Protein Cinnamon Porridge 8Pack 46G'},
]
  seed_products_3.each do |seed_product|
   if Product.where(name: seed_product[:name]).length > 0
    image_src = Product.where(name: seed_product[:name])[0].image
    Product.create(supermarket: sainsburys, image: image_src, price: seed_product[:price], name: seed_product[:name])
  end
end

 waitrose = Supermarket.create!(name: "Waitrose", website: "https://www.asda.com/")
seed_products_4 = [{price: '£0.95', name: 'Growers Harvest Porridge Oats'}, {price: '£2.15', name: 'Quaker Oat So Simple Golden Syrup Porridge 57G'},
{price: '£2.20', name: 'Kelloggs Crunchy Nut Chocolate Oat Granola 380G'}, {price: '£1.30', name: 'Oat & Barley Loaf 800G'}, {price: '£2.99', name: 'Quaker Oat Granola Raisin 500G'}, {price: '£2.60', name: 'Activia Grains & Nuts Walnuts & Oats Yogurt 4X120g'},  {price: '£2.50', name: 'Nescafe Gold Oat Latte (6X16g) Gb'},
{price: '£3.10', name: 'Nestle Cheerios Oat Low Sugar Cereal 325G'}, {price: '£3.50', name:'Jordans Crunchy Oat Tropical Fruits Granola 750G'}, {price: '£1.80', name: 'Nomadic Oats Chocolate & Natural Yogurt 169G'},
{price: '£3.00', name: 'Trek Flapjack Cocoa Oat 50G 3 Pack'}, {price: '£2.40', name: 'Quaker Oat So Simple Big Golden Syrup Porridge 6 Pack 298G'}, {price: '£2.20', name: 'Free From Pure Oats 450G'},
{price: '£5.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo 360Ml'}, {price: '£2.70', name: 'Nairns Gluten Free Oat Bar Cacao & Orange 160G'},{price: '£2.75', name: 'Quaker Oat So Simple Apple & Blueberry Porridge 10 X36g'},{price: '£1.99', name: 'Belvita Golden Oats Biscuits 225G'},{price: '£1.99', name: 'Belvita Golden Oats Biscuits 225G'},
{price: '£2.80', name: 'Nairns Gluten Free Oat Bar Apple & Cinnamon 160G'},{price: '£2.95', name: 'Quaker Oat So Simple Sultana Raisin Apple Porridge 10 X38.5G'},  {price: '£2.55', name: 'Oatly Creamy Oat Fraiche 200Ml'}, {price: '£3.75', name: 'Quaker Oat So Simple Protein Original Porridge 8Pk302g'}, {price: '£2.70', name: 'Graze Honey And Oat Bar 4 X 30G'},{price: '£1.75', name: 'Oomf Protein Oats Golden Syrup Porridge 75G'},
{price: '£3.00', name: 'Stockans Thick Oatcakes 200G (L)'},{price: '£3.50', name: 'Goodbelly Oat Flakes With Banana & Blueberry 350G'},
{price: '£2.50', name: 'Berry Oat & Flax Seed Smoothie Mix 500G'},{price: '£3.05', name: 'Fro Oat & Sunflower Seed Crisp Bread 200G'},
{price: '£2.00', name: 'Ryvita Pumpkin & Oats Crisp Bread 4X50g'},{price: '£2.85', name: 'Mornflake Mighty Creamy Superfast Oats 1.25Kg'},
{price: '£2.65', name: 'Quaker Oat So Simple Protein Golden Syrup Porridge 8X 43G'},{price: '£2.95', name: 'Quaker Oat So Simple Protein Cinnamon Porridge 8Pack 46G'},
]
  seed_products_4.each do |seed_product|
   if Product.where(name: seed_product[:name]).length > 0
    image_src = Product.where(name: seed_product[:name])[0].image
    Product.create(supermarket: sainsburys, image: image_src, price: seed_product[:price], name: seed_product[:name])
  end
end

asda = Supermarket.create!(name: "Asda", website: "https://www.asda.com/")
seed_products_5 = [{price: '£0.65', name: 'Growers Harvest Porridge Oats'}, {price: '£1.00', name: 'Quaker Oat So Simple Golden Syrup Porridge 57G'},
{price: '£1.10', name: 'Kelloggs Crunchy Nut Chocolate Oat Granola 380G'}, {price: '£1.30', name: 'Oat & Barley Loaf 800G'}, {price: '£2.99', name: 'Quaker Oat Granola Raisin 500G'}, {price: '£2.60', name: 'Activia Grains & Nuts Walnuts & Oats Yogurt 4X120g'},  {price: '£2.50', name: 'Nescafe Gold Oat Latte (6X16g) Gb'},
{price: '£3.10', name: 'Nestle Cheerios Oat Low Sugar Cereal 325G'}, {price: '£3.50', name:'Jordans Crunchy Oat Tropical Fruits Granola 750G'}, {price: '£1.80', name: 'Nomadic Oats Chocolate & Natural Yogurt 169G'},
{price: '£2.90', name: 'Trek Flapjack Cocoa Oat 50G 3 Pack'}, {price: '£2.40', name: 'Quaker Oat So Simple Big Golden Syrup Porridge 6 Pack 298G'}, {price: '£2.10', name: 'Free From Pure Oats 450G'},
{price: '£5.00', name: 'Garnier Ultimate Blends Oat Milk Sensitive Scalp Shampoo 360Ml'}, {price: '£2.70', name: 'Nairns Gluten Free Oat Bar Cacao & Orange 160G'},{price: '£2.75', name: 'Quaker Oat So Simple Apple & Blueberry Porridge 10 X36g'},{price: '£1.99', name: 'Belvita Golden Oats Biscuits 225G'},{price: '£1.99', name: 'Belvita Golden Oats Biscuits 225G'},
{price: '£2.80', name: 'Nairns Gluten Free Oat Bar Apple & Cinnamon 160G'},{price: '£2.95', name: 'Quaker Oat So Simple Sultana Raisin Apple Porridge 10 X38.5G'},  {price: '£2.55', name: 'Oatly Creamy Oat Fraiche 200Ml'}, {price: '£3.75', name: 'Quaker Oat So Simple Protein Original Porridge 8Pk302g'}, {price: '£2.70', name: 'Graze Honey And Oat Bar 4 X 30G'},{price: '£1.75', name: 'Oomf Protein Oats Golden Syrup Porridge 75G'},
{price: '£3.20', name: 'Stockans Thick Oatcakes 200G (L)'},{price: '£3.30', name: 'Goodbelly Oat Flakes With Banana & Blueberry 350G'},
{price: '£2.30', name: 'Berry Oat & Flax Seed Smoothie Mix 500G'},{price: '£3.00', name: 'Fro Oat & Sunflower Seed Crisp Bread 200G'},
{price: '£1.40', name: 'Ryvita Pumpkin & Oats Crisp Bread 4X50g'},{price: '£1.65', name: 'Mornflake Mighty Creamy Superfast Oats 1.25Kg'},
{price: '£3.65', name: 'Quaker Oat So Simple Protein Golden Syrup Porridge 8X 43G'},{price: '£3.95', name: 'Quaker Oat So Simple Protein Cinnamon Porridge 8Pack 46G'},
]
  seed_products_5.each do |seed_product|
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

