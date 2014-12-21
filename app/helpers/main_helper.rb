module MainHelper
  require 'mathn'
  include Math
  # Вычисляет значение функции, записанной в виде строки в точке х
  # @param [String] function строковое представление функции
  # @param [Float] x точка, в которой вычисляем значение функции
  def calculate_function_in_x(function, x)
    eval function.downcase.gsub(/x/, x.to_s)
  end
  alias func_x calculate_function_in_x

  def calculate_nyton(function, precision, a, b)
    convex = func_x(function, b) * deriv_x_p(function,b,2) > 0
    start_value = convex ? b : a
    iterative_proc(function, start_value, precision)
  end

  def iterative_proc(function, start_value, precision)
    x = start_value
    counter = 0
    10000.times do
      counter += 1
      prev_x = x
      f_val = func_x(function, x)
      d_val = deriv_x(function, x)
      x = x - (f_val / d_val)
      break if (x - prev_x).abs <= precision
    end
    {x: x, count: counter}
  end

  def calculate_function_derivative_in_x(function, x)
    h = 1e-7
    ( -1 * func_x(function, x + 2*h) + 8*func_x(function, x + h) - 8*func_x(function, x-h) + func_x(function, x - 2*h)) / (12*h)
    # (func_x(function, x + h) - func_x(function, x - h)) / ( 2 * h)
  end
  alias deriv_x calculate_function_derivative_in_x

  def calculate_function_derivative_in_x_in_power(function, x, p)
    h = 1e-7
    if p > 1
      # ( -1 * func_x(function, x + 2*h) + 8*func_x(function, x + h) - 8*func_x(function, x-h) + func_x(function, x - 2*h)) / (12*h)
      (-1 * deriv_x_p(function, x + 2*h, p-1) + 8*deriv_x_p(function, x+h,p-1) -
          8*deriv_x_p(function, x-h, p-1) +deriv_x_p(function, x - 2*h, p-1) ) / (12*h)
    else
      ( -1 * func_x(function, x + 2*h) + 8*func_x(function, x + h) - 8*func_x(function, x-h) + func_x(function, x - 2*h)) / (12*h)
     end
  end
  alias deriv_x_p calculate_function_derivative_in_x_in_power
end
