require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  get '/error' do
    erb :error
  end

  post '/login' do
    if User.find_by(username: params[:username], password: params[:password])
      @user = User.find_by(username: params[:username])
      session[:user_id] = @user.id
      redirect to '/account'
    else

      redirect to '/error'
    end
  end

  get '/account' do
    erb :account
  end

  get '/logout' do
    session.clear
  end



end
