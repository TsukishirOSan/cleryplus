class HomeController < ApplicationController
  def index
    render text: "I think you want to learn more about me here: https://github.com/SexualHealthInnovations/cleryplus", status: 418
  end
end
