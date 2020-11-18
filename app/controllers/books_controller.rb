class BooksController < ApplicationController

  # GET: /books
  get "/books" do
    @books = Book.all
    erb :"/books/index"
  end

  # GET: /books/new
  get "/books/new" do
    erb :"/books/new"
  end

# POST: /books
  post "/books" do
    @books = Book.create(params)
  redirect "/books"
  end

  get "/books/:id" do
    @books = Book.find(params[:id])
    erb :"/books/show"
  end

  

  # GET: /books/5
  
  # GET: /books/5/edit
  get "/books/:id/edit" do
    erb :"/books/edit"
  end

  # PATCH: /books/5
  patch "/books/:id" do
    redirect "/books/:id"
  end

  # DELETE: /books/5/delete
  delete "/books/:id/delete" do
    redirect "/books"
  end
end
