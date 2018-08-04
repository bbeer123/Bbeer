class StaticPagesController < ApplicationController
  def home
      @items = Item.all
  end

  def help
    session[:cart] = nil
  end

  def about
      #session[:cart] = nil
  end
  
   def createOrder
 @orders = Order.all
  
   end

    def paypal
       @order = Order.find(params[:id])
       @order = update_attribute(:status, "Paid With Paypal")
    end   
       

    def profile
       @orders = Order.where(user_id: current_user.id) 
    end


  
  
end

