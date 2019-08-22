class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['admin_name'], password: ENV['admin_pw']
  # http_basic_authenticate_with name: "Jungle", password: "book"

  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end
