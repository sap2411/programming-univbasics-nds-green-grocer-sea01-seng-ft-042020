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
g
answer
  # Implement me first!
  #
  # Consult README for inputs and outputs
end

def consolidate_cart(cart) #combines like items from a 'cart', adds a 'count' of that item, and puts it in a new consolidated Cart
  consolidatedCart = [] #create our new cart which is currently empty
  item = 0 #this is the item we are selecting from the old cart, lets start with the first (which is zero)
  while item < cart.count #run the code below until it ends (we run out of items from the old cart) (in that case go to line 34)
    grocery = cart[item] #lets assigne the shortcut 'grocery' to the 'item' we're currently holding from the old cart
    name = cart[item][:item] #lets retrieve the coded :item-name of that 'grocery' and give it a shortcut 'name'
    itemAlreadyInCart = find_item_by_name_in_collection(name, consolidatedCart) #a shortcut searching the new cart for the item
      if !itemAlreadyInCart #do the next 3 lines of code, "if" its "not true (= !)" the "item is already in the cart", else go to 30
        grocery[:count] = 1 #that means its the '1st' of that 'item/grocery' from the old 'cart', we need to add that to a 'count'.
        consolidatedCart << grocery #and add that new item/grocery to the new cart
        item+=1 #now grab the next item in the old cart and go to line 33
      else #do the next 2 lines of code if the 'item is Already In the Cart'
        itemAlreadyInCart[:count] += 1 #since we already put one of this grocery in the new cart, we just have to add 1 to its count
        item+=1 #then select the next item in out old cart and go to line 33
      end #go to line 22 to see if this new item is already in our cart
  end #if you are here, its because you have finished consolidating your Cart, go to the next line
  consolidatedCart #lets now display what our complete cart looks like and finish the task
end #all done

def apply_coupons(cart, coupons)
  t = 0 
  while t < cart.count
    name1 = cart[t][:item]
    grocery1 = cart[t]
    appliedGrocery = {}
    itemHasACoupon = find_item_by_name_in_collection(name1, coupons)
    if !itemHasACoupon
      #item doesn't have a coupon, so do nothing
    else itemHasACoupon
      couponCost = itemHasACoupon[:cost] / itemHasACoupon[:num]
      couponCount = itemHasACoupon[:num] * (grocery1[:count] / itemHasACoupon[:num])
      remainder = grocery1[:count] % itemHasACoupon[:num]
      appliedGrocery = {
          :item => itemHasACoupon[:item] + " W/COUPON",
          :price => couponCost,
          :clearance => grocery1[:clearance],
          :count => couponCount
        }
      cart << appliedGrocery
      grocery1[:count] -= couponCount
    end
  t+=1 
  end
  cart
end

def apply_clearance(cart)
  b = 0 
  while b < cart.count
  clearance = cart[b][:clearance]
  grocery2 = cart[b]
   if clearance
      grocery2[:price] = grocery2[:price] * 0.80
      
     grocery2[:price].round(2)
     b += 1
   else !clearance
     grocery2[:price].round(2)
     b += 1
   end
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
