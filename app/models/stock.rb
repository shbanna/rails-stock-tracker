class Stock < ActiveRecord::Base
    
    def self.new_from_lookup(ticker_symbol)
        begin
            st = StockQuote::Stock.quote(ticker_symbol)
            new(name: st.company_name, ticker: st.symbol, last_price: st.latest_price.to_i)
            rescue Exception => e
                return nil
            end
    end
end
