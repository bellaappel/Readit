class BooksController < ApplicationController

  # GET: /books
  get "/books" do
    @books = Book.all
    erb :"/books/index"
  end

  # GET: /books/new
  get "/books/new" do
    if Helper.is_logged_in? (session) 
      erb :"/books/new"
    else
       "Please login or signup to add a new book!"
    end
    erb :"/books/new"
  end

  get "/books/most_reviewed" do
    b = Book.all
    @most_reviewed_book = b.max_by {|book| book.reviews.count}
    erb :"/books/most_reviewed"
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

  
    
  # GET: /books/5/edit
  get "/books/:id/edit" do
    @books = Book.find(params[:id])
    erb :"/books/edit"
  end

  # PATCH: /books/5
  patch "/books/:id" do
    @books = Book.find_by(:id => params[:id])
    @books.title = params[:title]
    @books.author = params[:author]
    @books.content = params[:content]
    @books.save
    redirect "/books/:id"
  end

  get "/books/:id/delete" do
    
    
      @books = Book.find(params[:id])
    erb :"/books/delete"
  end

  # DELETE: /books/5/delete
  delete "/books/:id" do
    @books = Book.find(params[:id])
    @books.delete
    redirect "/books"
  end
end


#Write a custom route so that when a user visits /books/most-reviewed the user sees the book with the most reviews
#HINTL Use the max_by Ruby method to help you get the book with the most reviews