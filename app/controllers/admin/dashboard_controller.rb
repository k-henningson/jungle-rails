class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['USERNAME'],
  password: ENV['PASSWORD']
  def show
    @product_all = Product.count
    @category_all = Category.count
  end
end
