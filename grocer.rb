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
coupons.each do |has_coupon|
  with_coupon = has_coupon[:item]
  binding.pry
  if cart[with_coupon] && cart[with_coupon][:count] >= has_coupon[:num]
    if cart["#{with_coupon} W/ COUPON"]
      if cart["#{with_coupon} W/ COUPON"]
end


# cart_with_coupons
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
