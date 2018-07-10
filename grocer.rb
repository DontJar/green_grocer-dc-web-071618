require 'pry'

def consolidate_cart(cart)
new_cart = {}
  cart.each do |in_cart|
    in_cart.each do |food, info|
      new_cart[food] ||= info
      new_cart[food].merge!(:count => cart.count(in_cart))
    end
  end
new_cart
end

def apply_coupons(cart, coupons)
# cart_with_coupons = {}
# cup_item = nil
# binding.pry
coupons.each do |has_coupon|
  with_coupon = has_coupon[:item]
  if cart[with_coupon] && cart[with_coupon][:count] >= has_coupon[:num]
    if cart["#{with_coupon} W/COUPON"] != nil
      cart["#{with_coupon} W/COUPON"][:count] += 1
    else
      cart["#{with_coupon} W/COUPON"] = {:count => 1, :price => has_coupon[:cost]}
      cart["#{with_coupon} W/COUPON"][:clearance] = cart[with_coupon][:clearance]
    end
    cart[with_coupon][:count] -= has_coupon[:num]
  end
end
# cart_with_coupons
cart
end

def apply_clearance(cart)
  cart.each do |food, info|
    if info[:clearance] == true
      info[:price] = (info[:price]*0.8).round(2)
    end
  end
end

def checkout(cart, coupons)
  small_cart = consolidate_cart(cart)
  coupons_applied = apply_coupons(small_cart, coupons)
  binding.pry
  checking_out = apply_clearance(coupons_applied)
  total_cost = nil

end
