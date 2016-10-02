class GreetingsController < ApplicationController
  def hello_world
    render json: {greeting: "Hello World! Welcome to Joinify"}
  end
end
