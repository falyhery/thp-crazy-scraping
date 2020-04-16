require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'


def crypto_per_page_counter
	source_page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) #page à partir de laquelle on va extraire les data

	crypto_rows = source_page.css('tr.cmc-table-row') #200 cryptos par page 
	return nb_of_crypto_rows = source_page.css('tr.cmc-table-row').count
end 


def total_crypto_counter
	source_page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) #page à partir de laquelle on va extraire les data

	#on récupère le nombre total de cryptos qui sont listées sur CoinMarketCap
	return total = source_page.css('div.cmc-global-stats__inner-content span.sc-12ja2s9-0.gRrpzm a')[3].text.gsub(',','').to_i #Cryptocurrencies: 5348
end


def crypto_scraper
	source_page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) #page à partir de laquelle on va extraire les data

	crypto_name_array = Array.new #on crée un tableau de cryptos 

	crypto_rows = source_page.css('tr.cmc-table-row') #désigne chaque ligne du tableau
	crypto_rows.each do |crypto_row| #pour chaque ligne du tableau 

		crypto_symbol = crypto_row.css('td.cmc-table__cell.cmc-table__cell--sortable.cmc-table__cell--left.cmc-table__cell--sort-by__symbol').text #on extrait le symbole de la crypto 
		crypto_price = crypto_row.css('td.cmc-table__cell.cmc-table__cell--sortable.cmc-table__cell--right.cmc-table__cell--sort-by__price').text.gsub('$','').to_f #et son prix 

		crypto_hash = Hash.new #on initie un nouveau hash de cryptos
		crypto_hash[crypto_symbol] = crypto_price #symbole de la crypto => son prix 

		crypto_name_array << crypto_hash #on stocke chaque hash dans un tableau de cryptos 
		puts crypto_name_array
	end
	#binding.pry
	puts crypto_name_array.size
	return crypto_name_array
end

crypto_scraper

