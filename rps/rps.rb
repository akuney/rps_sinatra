require 'sinatra'
require 'haml'

get '/' do
  haml :new_game
end

post '/throw' do
  @sign = params[:sign]
  @message = generate_message(@sign, generate_random_sign)
  haml :outcome
end

def generate_random_sign
  random_number = rand(3)

  if random_number < 1
    return 'rock'
  elsif random_number < 2
    return 'paper'
  else
    return 'scissors'
  end
end

def generate_message(user_sign, computer_sign)
  message = ""

  if defeats(user_sign, computer_sign)
    message += "You won! "
  elsif defeats(computer_sign, user_sign)
    message += "The computer won! "
  else
    message += "It's a tie! "
  end

  message += "You played #{user_sign} and the computer played #{computer_sign}"
  message
end

def defeats(sign1, sign2)
  (sign1 == 'rock' && sign2 == 'scissors') ||
  (sign1 == 'scissors' && sign2 == 'paper') ||
  (sign1 == 'paper' && sign2 == 'rock')
end