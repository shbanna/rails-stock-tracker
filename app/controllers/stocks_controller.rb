class StocksController < ApplicationController
    def search
        if params[:stock].blank?
            flash[:danger] = "empty string"
        else
            @stock = Stock.new_from_lookup(params[:stock])
            flash.now[:danger] = "wrong symbol" unless @stock
        end
        render partial: 'users/result'
    end

end