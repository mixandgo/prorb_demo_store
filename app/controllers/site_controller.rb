class SiteController < ApplicationController
  def index
    @categories = Category.all
  end
end
