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
    itemAlreadyInCart = find_item_by_name_in_collection(cart[item][:item], consolidatedCart) 
      if !itemAlreadyInCart 
        cart[item][:count] = 0 
        consolidatedCart << cart[item]  
      end
    cart[item][:count] += 1
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
   sub_cart = apply_clearance(coupon_applied_cart)
   total = 0 
   d = 0 
   while d < sub_cart.count
     sub_cart[d][:price].round(2)
     sum = sub_cart[d][:price] * sub_cart[d][:count]
     total +=sum.round(2)
     d +=1
   end
   if total >= 100
     total *= 0.9
   end
   total
end
