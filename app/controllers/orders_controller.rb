class OrdersController < ApplicationController
  end

  def bought
    @bought_orders = current_user.bought_orders
  end

  def sold
    @sold_orders = current_user.sold_orders
  end
end
