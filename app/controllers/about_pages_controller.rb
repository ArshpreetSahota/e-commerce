class AboutPagesController < ApplicationController
  def show
    @about_page = AboutPage.find(1) # Assuming the page you want is the one with ID 1
  end
end
