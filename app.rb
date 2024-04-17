require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1> Hola </h1>
  "
end

get("/square/new") do
  erb(:new_square_calc)

end

get("/square/results") do
  user_input = params.fetch("users_number").to_f
  @the_num = user_input
  @the_result = user_input ** 2
  erb(:square_results)
end


get("/square_root/new") do
  erb(:new_square_root_calc)

end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = Math.sqrt(@the_num)
  erb(:square_root_results)
end


get("/payment/new") do
  erb(:new_payment)

end

get("/payment/results") do
  @user_apr = params.fetch("user_apr").to_f
  @user_years = params.fetch("user_years").to_i
  @user_pv = params.fetch("user_pv").to_f

  # Convert APR to a monthly interest rate
  monthly_interest_rate = (@user_apr / 100) / 12

  # Convert years to months
  total_payments = @user_years * 12

  # Calculate monthly payment using the formula: P = [r*PV] / [1 - (1 + r)^-n]
  if monthly_interest_rate == 0
    @monthly_payment = @user_pv / total_payments
  else
    @numerator = monthly_interest_rate * @user_pv
    @denominator = 1 - (1 + monthly_interest_rate) ** -total_payments
    @monthly_payment = @numerator / @denominator
  end

  erb(:payment_results)
end

get("/random/new") do
  erb(:new_random)
end

get("/random/results") do
  @min = params.fetch("user_min").to_f
  @max = params.fetch("user_max").to_f

  # Generate a random number between min and max
  @random_number = rand(@min..@max)
  
  erb(:random_results)
end
