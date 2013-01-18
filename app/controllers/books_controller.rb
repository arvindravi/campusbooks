class BooksController < ApplicationController
  # GET /books
  # GET /books.json
  def index
    @books = Book.where(:sold => 'false').desc(:created_at).paginate(:page => params[:page], :per_page => 9)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create    
    user = User.find_by(_id: session[:user_id])
    @book = user.books.new(params[:book])
    @book.sold = false
    @book.pages = if params[:book][:pages].nil?
      '-'
    else
      params[:book][:pages]
    end

    #OPENLIB

    if !params[:book][:isbn].blank?
      details = Openlibrary::Data
      book_view = details.find_by_isbn(params[:book][:isbn])
      @book.image_url = if !book_view.nil?
        book_view.cover['large']
      else
        'http://placehold.it/180x240&text=No+Image,+Yo!'
      end
    else
      @book.image_url =  'http://placehold.it/180x240&text=No+Image,+Yo!'
    end

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    if !params[:book][:isbn].blank?
      details = Openlibrary::Data
      book_view = details.find_by_isbn(params[:book][:isbn])
      @book.image_url = if !book_view.nil?
        book_view.cover['large']
      else
        'http://placehold.it/180x240&text=No+Image,+Yo!'
      end
    else
      @book.image_url =  'http://placehold.it/180x240&text=No+Image,+Yo!'
    end

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  def buy    
    session[:buying_book_id] = params[:id]
    @book = Book.find_by(_id: params[:id])
    @user = User.find_by(_id: @book.user_id)
  end

  def mybooks
    user = User.find_by(_id: session[:user_id])    
    @books = user.books.where(user_id: user._id).paginate(:page => params[:page], :per_page => 12)
  end

  def sold
    book = Book.find_by(_id: params[:id])
    book.update_attribute(:sold, true)    
    redirect_to :back
  end

  def add_image(isbn)
    
  end
end
