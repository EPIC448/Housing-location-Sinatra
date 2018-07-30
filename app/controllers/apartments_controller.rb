require_relative "./application_controller"

class ApartmentsController < ApplicationController

    configure do
      enable :sessions
      set :session_secret, "secret"
    end

  get '/apartments' do
    if logged_in?
      @users = current_user  
      @apartments = Apartment.all
      erb :'/apartments/index'
    else
      redirect to "/login"
    end

  end


  get '/apartments/new' do
    if logged_in?
      @user = current_user
      erb :'/apartments/new'
    else
      redirect "/login"
    end
  end

  post '/apartments' do
    @apartment = Apartment.new(params)
    @user = current_user 
    if logged_in? && !@apartment.location.blank? && @apartment.save
      # @user.apartments << @apartment
      redirect to "/apartments/#{@apartment.id}"  
    else
      redirect "/apartments/new"  
    end
  end

  get "/apartments/:id" do
    if logged_in? 
      @apartment = Apartment.find_by_id(params[:id])
      erb :'/apartments/show' 
    else
      redirect to "/login"
    end
  end


  get '/apartments/:id/edit' do  
     if logged_in? 
    @apartment = Apartment.find_by_id(params[:id]) 
    erb :'/apartments/edit'
   else
    redirect to "/login"
    end
  end


  patch "/apartments/:id" do
    @apartment = Apartment.find(params[:id])
      if logged_in? && !params[:location].blank? && @apartment.user == current_user
        @apartment.update(location: params[:location])             
        @apartment.save
        redirect to "/apartments/#{@apartment.id}"
      else
        # redirect to "/apartments/#{@apartment.id}/edit", locals: {message: "You can't edit this location"}
       redirect to "/apartments"
      end
    end


  delete "/apartments/:id/delete" do
    @apartment = Apartment.find_by_id(params[:id])
    if logged_in? && @apartment.user == current_user
      @apartment.delete
      redirect to '/apartments'
    else
      redirect to "/login"
    end
  end


end #end of class method