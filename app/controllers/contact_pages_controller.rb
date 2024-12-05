class ContactPagesController < ApplicationController
  def show
    @contact_page = ContactPage.find(1) # Assuming the page you want is the one with ID 1
  end
end
