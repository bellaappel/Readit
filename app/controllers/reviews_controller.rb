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
    @review = Review.create(params)
    @review.user_id = session[:user_id]
    @review.save
    redirect "/reviews/#{@review.id}"
  end

  # GET: /reviews/5
  get "/reviews/:id" do
    @review = Review.find(params[:id])
    erb :"/reviews/show"
  end

  # PATCH: /reviews/5
  patch "/reviews/:id" do
    redirect "/reviews/:id"
  end

  get "/reviews/:id/delete" do
    @review = Review.find(params[:id])
    erb :"/reviews/delete"
  end

  # DELETE: /reviews/5/delete
  delete "/reviews/:id" do
    @review = Review.find(params[:id])
    @review.delete
    redirect "/reviews"
  end
end
