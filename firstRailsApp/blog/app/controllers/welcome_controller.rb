class WelcomeController < ApplicationController
  http_basic_authenticate_with name: "name", password: "name"

  def index
  end
end
