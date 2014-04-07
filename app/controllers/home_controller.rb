class HomeController < ApplicationController
  def index
    redirect_to 'https://shifiles.s3.amazonaws.com/cleryplus/index.html'
  end
end
