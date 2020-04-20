class BooksController < ApplicationController

	def index
		@books = Book.all
		@book = Book.new
	end



	def create
		@book = Book.new(book_params)
		@books = Book.all
		@book.user_id = current_user.id
		if @book.save
  		flash[:notice] = "Book was successfully created."
  		redirect_to book_path(@book.id)
	    else
	    	render "index"
	    end
	end


	def show
		@book = Book.new
		@books = Book.find(params[:id])
	end


	def edit
	end

	def update
	end

	def destroy
	end

private

	def book_params
		params.require(:book).permit(:title, :body)
	end


end
