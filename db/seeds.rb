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
tesco_urls = ["https://www.tesco.com/groceries/en-GB/search?query=ben%20and%20jerrys", "https://www.tesco.com/groceries/en-GB/search?query=ice%20cream"]

tesco_urls.each do |url|
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

morrisons = Supermarket.create!(name: "Morrisons", website: "https://groceries.morrisons.com")
mor_urls = ["https://groceries.morrisons.com/search?entry=ben%20and%20jerrys", "https://groceries.morrisons.com/search?entry=ice%20cream"]

mor_urls.each do |url|
  doc = Nokogiri::HTML(open(url))
  doc.search(".fop-contentWrapper").each do |result_card|
    prod_name = result_card.search(".fop-title").text
    price = result_card.search(".fop-price").text
  # p size = result_card.search(".fop-catch-weight").text
    image_src = result_card.search(".fop-img").attr('src').value
  Product.create!(supermarket: morrisons, image: image_src, price: price, name: prod_name)
  end
end

# iceland = Supermarket.create!(name: "Iceland", website: "https://www.iceland.co.uk")

# url = "https://www.iceland.co.uk/search?q=ice%20cream"
# doc = Nokogiri::HTML(open(url))
# doc.search(".product-tile").each do |result_card|
#   prod_name  = result_card.search(".product-name").text
#   price = result_card.search(".product-sales-price").text
#   # image_src = result_card.search(".thumb-link").attr('src').value
#   Product.create!(supermarket: iceland, price: price, name: prod_name)
# end


