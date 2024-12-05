class CartsController < ApplicationController

    def add_item
      
  @user = current_user
      product_id = params[:product_id].to_s
  
      item = cart[product_id] || { "quantity" => 0 }
      item["quantity"] += 1
      cart[product_id] = item
      update_cart cart
      if request.referrer.include?("cart")
        redirect_to cart_path
      else
        redirect_to root_path
      end
    end
  
    def remove_item
      product_id = params[:product_id].to_s
  
      if cart[product_id]
        cart[product_id]["quantity"] -= 1
        cart.delete(product_id) if cart[product_id]["quantity"] <= 0
        update_cart(cart)
      end
  
      redirect_to cart_path
    end

    def remove_product
      product_id = params[:product_id].to_s
  
      cart.delete(product_id)
      update_cart(cart)
      
      flash[:notice] = "Product successfully removed from the cart."
      redirect_to cart_path
    end
    
    
  end
  
  
