class StaticPagesController < ApplicationController
  def index
  end
  def index
  	@products = Product.limit(3)
  end
  def landing_page
  	@featured_product = Product.first
  	@products = Product.limit(3)
  end  
end
