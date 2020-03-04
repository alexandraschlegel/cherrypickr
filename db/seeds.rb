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
# end
tesco = Supermarket.create!(name: "Tesco", website: "https://www.tesco.com")
 # Tesco
url = "https://www.tesco.com/groceries/en-GB/search?query=ice%20cream"
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

aldi = Supermarket.create!(name: "Aldi", website: "https://www.aldi.co.uk")

url = "https://www.aldi.co.uk/c/groceries/frozen-food/ice-cream-and-desserts"
doc = Nokogiri::HTML(open(url))
doc.search(".category-item__wrapper-link").each do |result_card|
  doc2 = Nokogiri::HTML(open(result_card.attr('href')))
  prod_name = doc2.search(".product-details__name").text
  price = "£ " + doc2.search(".product-price__value").text.strip
  image_src = doc2.search(".product-image-viewer-section__large").search("img").attr('src').value
  Product.create!(supermarket: aldi, image: image_src, price: price, name: prod_name)
end

