class UserStocksController < ApplicationController
    
    def create
        stock = Stock.find_by_ticker(params[:stock_ticker])
        if stock.blank?
            stock = Stock.new_from_lookup(params[:stock_ticker])
            stock.save
        end
        @user_stock = UserStock.create(user:current_user, stock: stock)
        flash[:success] = "added successfully"
        redirect_to my_portfolio_path
    end
    
    def destroy
        stock = Stock.find(params[:id])
        @ustock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
        @ustock.destroy
        flash[:notice] = "removed"
        redirect_to my_portfolio_path
    end
end
