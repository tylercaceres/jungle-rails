class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['admin_name'], password: ENV['admin_pw']
  # http_basic_authenticate_with name: "Jungle", password: "book"

  def show
  end
end
