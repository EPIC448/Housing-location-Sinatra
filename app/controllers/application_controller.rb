require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    enable :sessions 
    set :views, 'app/views' 
    set :session_secret, "secret" 
  end

  get '/' do
    erb :index
  end


  helpers do

    def logged_in?
      !!current_user   
    end


    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
                                                    # start on right right
      # if current user exect---- stay the same else..... if session[:user_id] excites.  Set @current_user = User.find_by.....
    end

  end #end of the helper method.
end
