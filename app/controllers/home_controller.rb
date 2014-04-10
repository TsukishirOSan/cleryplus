class HomeController < ApplicationController
  def index
    redirect_to 'https://cleryplus.s3.amazonaws.com/index.html', status: 303
  end
end
