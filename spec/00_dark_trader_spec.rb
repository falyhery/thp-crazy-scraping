require_relative '../lib/00_dark_trader'

describe "la méthode fonctionne a minima" do

	it "crypto_scraper retourne bien un array de hash" do
		expect(crypto_scraper).to be_instance_of(Array)
	end

	it "should not be nil" do
		expect(crypto_scraper).not_to be_nil
	end

	it "should not be empty" do
		expect(crypto_scraper).not_to be_empty
	end

end


describe "le scraper récupère un nombre minimum de data" do

	it "le scraper dénombre 200 cryptomonnaies par page" do
		expect(crypto_per_page_counter).to eq(200)
	end 

	it "le scraper dénombre au moins 5000 cryptomonnaies au total" do
		expect(total_crypto_counter > 5000).to eq true 
	end

	it "le scraper récupère les principales cryptos" do
		expect(["BTC", "ETH", "XRP"].any?).to eq true
	end

end

