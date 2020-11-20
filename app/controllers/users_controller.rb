class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    erb :"/users/login"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new"
  end

  get '/users/logout' do
    session.clear
    redirect to '/'
  end

 

  post "/users/new" do
    if params[:username] != ""
      user = User.new(:username => params[:username], :password => params[:password])
      if user.save
        session[:user_id] = user.id
        redirect "users/show"
      else
        redirect "/failure"
      end
    else
      redirect "/failure"
    end
  end



  # POST: /users
  post "/users/login" do
    user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password]) 
        session[:user_id] = user.id
        redirect "/users/show"
      else
        redirect "/failure"
      end
      redirect "/users/:id"
  end


  get "/failure" do
    erb :"/users/failure"
  end

  get "/users/show" do
    if Helper.is_logged_in?(session)
      erb :"/users/show"
    else 
      redirect "/failure"
    end
  end


  # GET: /users/5
  get "/users/:id" do
    @user = User.find(params[:id])
    if @user.is_logged_in?
      erb :"/users/show"
    else 
      redirect "/failure"
    end
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    @user = User.find(params[:id])
    erb :"/users/edit"
  end


  # PATCH: /users/5
  patch "/users/:id" do
    @user = User.find_by(:id => params[:id])
    @user.update(:username => params[:username])
    redirect "/users/#{@user.id}"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end

