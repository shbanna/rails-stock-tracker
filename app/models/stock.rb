class Stock < ActiveRecord::Base
    
    has_many :user_stocks
    has_many :users, through: :user_stocks
    
    def self.new_from_lookup(ticker_symbol)
        begin
            st = StockQuote::Stock.quote(ticker_symbol)
            new(name: st.company_name, ticker: st.symbol, last_price: st.latest_price.to_i)
            rescue Exception => e
                return nil
        end
    end
    
  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
end
