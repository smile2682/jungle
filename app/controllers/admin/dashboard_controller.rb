class Admin::DashboardController < ApplicationController
 http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD']

  def show
    @product_sum = Product.count
    @category_sum = Category.count
  end
end
