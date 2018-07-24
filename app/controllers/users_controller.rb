class UsersController < ApplicationController

    configure do
      enable :sessions 
      # Session is an object like hash that stores data describing a clients interaction with a website as a given point in time…
      set :session_secret, "secret"
    end

   # note...  Explain straigh through

    get '/signup' do
      if !logged_in?
        erb :'users/create_user', locals: {message: "Please sign up before you sign in"}
      else
        redirect to '/apartments'
      end
    end
  
    post '/signup' do
      if params[:name] == "" || params[:email] == "" || params[:password] == ""
        redirect to '/signup'
      else
        @user = User.new(:name => params[:name], :email => params[:email], :password => params[:password])
        @user.save
        session[:user_id] = @user.id
        redirect to '/apartments'
      end
    end
  
  
    # >>>>>Log in part<<<
  
    # Dummy log in data   "name"=>"becky567", "password"=>"kittens"
  
    get '/login' do
  
      if !logged_in?
        erb :'/users/login'
      else
        redirect '/apartments'  #apartments control
      end
    end
  
  
    #session goes here.
  
    post '/login' do
      #handles logged in input of user from the params / Match that infor
      # with existing entries in the user database.
      user = User.find_by(:name => params[:name])  # Take name to get users  name
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect to '/apartments'
      else
        redirect to '/signup'
      end
    end
  
  
    get '/logout' do
  
      if !logged_in?
        redirect '/'
      else
        # log user out by clearing the session
  
        session.clear
        redirect to "/login"
      end
    end
  
  
    get "/users/:id" do
  
      @user = User.find_by_id(params[:id])
  
      erb :'/users/show'
  
    end
  

  end #UserController end


  