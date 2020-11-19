class ReviewsController < ApplicationController

  # GET: /reviews
  get "/reviews" do
    @reviews = Review.all
    erb :"/reviews/index"
  end

  # GET: /reviews/new
  get "/reviews/new" do
    if Helper.is_logged_in? (session) 
      erb :"/reviews/new"
    else
       "Please login or signup to write a review!"
    end
  end

  # POST: /reviews
  post "/reviews" do
    @reviews = Review.create(params)
    redirect "/reviews/:id"
  end

  # GET: /reviews/5
  get "/reviews/:id" do
    @reviews = Review.find(params[:id])
    erb :"/reviews/show"
  end

  # GET: /reviews/5/edit
  get "/reviews/:id/edit" do
    erb :"/reviews/edit"
  end

  # PATCH: /reviews/5
  patch "/reviews/:id" do
    redirect "/reviews/:id"
  end

  # DELETE: /reviews/5/delete
  delete "/reviews/:id/delete" do
    redirect "/reviews"
  end
end
