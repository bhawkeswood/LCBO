require 'json'
require 'open-uri'
#Checking mattvleming github specifics for troubleshooting

class HtmlGenerator
	def index
		puts "HtmlGenerator: index"
		raw_response = open("http://lcboapi.com/products").read
		#This is filling raw response with the data from the api
		parsed_response = JSON.parse(raw_response)
		#This is actually taking that data and pushing it to parsed_response
		products = parsed_response["result"]

		product_name = products.map {|product| product["name"]}	
		product_id = products.map {|product| product["id"]}
		 product_img = products.map {|product| product["image_url"]}
		product_note = products.map {|product| product["tasting_note"]}
		product_price = products.map {|product| product["price_in_cents"]}

		product_img.map! do |indiv_img|
			puts "<li>#{indiv_img}</li>"
		end
		
		# puts "<div>#{product_name}</div>"
		# puts "<div>#{product_id}</div>"
		# puts "<div>#{product_img}</div>"
		# puts "<div>#{product_note}</div}"
		# puts "<div>#{product_price}</div>"
#use output in the terminal to output the printed data to an html file!!!
#you can even make div tags, li tags within the CLI strings right here in ruby!
	end

	def show(id)
		puts "HtmlGenerator: show"
		raw_response = open("http://lcboapi.com/products/#{id}").read
		parsed_response = JSON.parse(raw_response)
		products = parsed_response["result"]

		puts products
	end
end