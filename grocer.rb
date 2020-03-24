def find_item_by_name_in_collection(name, collection)
  g = 0 
  while g < collection.count
    if name == collection[g][:item]
     answer = collection[g]
     break
    else
     answer = nil
     g+=1
  end
end
answer
end

def consolidate_cart(cart)
  consolidatedCart = [] 
  item = 0 
  while item < cart.count 
    grocery = cart[item] 
    itemAlreadyInCart = find_item_by_name_in_collection(grocery[:item], consolidatedCart) 
      if !itemAlreadyInCart 
        grocery[:count] = 0 
        consolidatedCart << grocery 
      end
    grocery[:count] += 1
    item+=1
  end 
  consolidatedCart
end 

def apply_coupons(cart, coupons)
  t = 0 
  while t < cart.count
    grocery1 = cart[t]
    appliedGrocery = {}
    itemHasACoupon = find_item_by_name_in_collection(grocery1[:item], coupons)
    if itemHasACoupon
      appliedGrocery = {
          :item => itemHasACoupon[:item] + " W/COUPON",
          :price => itemHasACoupon[:cost] / itemHasACoupon[:num],
          :clearance => grocery1[:clearance],
          :count => itemHasACoupon[:num] * (grocery1[:count] / itemHasACoupon[:num])
       }
      cart << appliedGrocery
      grocery1[:count] -= appliedGrocery[:count]
    end
  t+=1 
  end
  cart
end

def apply_clearance(cart)
  b = 0 
  while b < cart.count
   if cart[b][:clearance]
     cart[b][:price] *= 0.80
     cart[b][:price].round(2)
   end
    b += 1
  end
cart
end

def checkout(cart, coupons)
    consolidated_cart = consolidate_cart(cart)
    coupon_applied_cart = apply_coupons(consolidated_cart, coupons)
    clearance_applied_cart = apply_clearance(coupon_applied_cart)
   total = 0 
   d = 0 
   while d < clearance_applied_cart.count
     grocery3 = clearance_applied_cart[d]
     grocery3[:price].round(2)
     sum = grocery3[:price] * grocery3[:count]
     total +=sum.round(2)
     d +=1
   end
   if total >= 100
     total *= 0.9
   end
   total
    
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
