class MainController < ApplicationController
  def index
    @eugen = 'Eugen Moroz'
  end

  def calculate
    extend MainHelper
    @x = calculate_nyton(params[:equation], 0.001, params[:a].to_i, params[:b].to_i)
  end
end
