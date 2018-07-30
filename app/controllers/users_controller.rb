class UsersController < ApplicationController

    configure do
      enable :sessions 
      set :session_secret, "secret"
    end


    get '/signup' do
      if !logged_in?
        erb :'users/new_user', locals: {message: "Please sign up before you sign in"}
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
  
  
    get '/login' do
      if !logged_in?
        erb :'/users/login'
      else
        redirect '/apartments'  #apartments control
      end
    end
  
  
  
    post '/login' do
      
      user = User.find_by(:name => params[:name])  
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
        session.clear
        redirect to "/login"
      end
    end
  
  
    get "/users/:id" do
      @user = User.find_by_id(params[:id])
      erb :'/users/show'
    end
  

  end #UserController end


  