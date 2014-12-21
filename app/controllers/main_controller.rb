class MainController < ApplicationController
  def index
    @eugen = 'Eugen Moroz'
  end

  def calculate
    extend MainHelper
    @result = calculate_nyton(params[:equation], 0.001, params[:a].to_i, params[:b].to_i)
    @result[:y_vals], @result[:step] = calculate_function_in_range(params[:equation], params[:a].to_i..params[:b].to_i)
    @result[:chart_start] = params[:a].to_i

  end
end
