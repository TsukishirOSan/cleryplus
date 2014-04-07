class HomeController < ApplicationController
  def index
    redirect_to 'https://cleryplus.s3.amazonaws.com/index.html'
  end
end
