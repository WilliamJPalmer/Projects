class SellsController < ApplicationController

  def  show
    @shoes = Product.all
    @sold = Product.where.not('user_id=?', current_user.id)

  end

end
