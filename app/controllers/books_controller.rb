class BooksController < ApplicationController
  # GET /books
  # GET /books.json

  def index
    @threeOrMore = Author.find_by_sql(" SELECT A.name, A.id
                                        FROM Authors A, Books B, Authors_Books C
                                        WHERE A.id = C.author_id AND C.book_id = B.id AND
                                          B.rating >= 3
                                        GROUP BY A.id
                                        HAVING COUNT(B.id) >= 3")

    @hasMost = Person.find_by_sql("SELECT P.name
                                   FROM People P, (SELECT COUNT(B1.id) AS num_books, B1.person_id AS id
                                                   FROM Books B1
                                                   GROUP BY B1.person_id) AS B1
                                   WHERE B1.id = P.id 
                                    AND NOT EXISTS (SELECT COUNT(B2.id), B2.person_id
                                                    FROM Books B2
                                                    GROUP BY B2.person_id
                                                    HAVING COUNT(B2.id) > B1.num_books)").first()


    @genreOnly = Author.find_by_sql("
  SELECT A.name
  FROM Authors A
  WHERE NOT EXISTS (
    SELECT *
    FROM Books B, Authors_Books C
    WHERE C.author_id = A.id AND C.book_id = B.id AND B.genre <> 'Fantasy')
  "
  )

    @good = Author.find_by_sql("
  SELECT A.name
  FROM Authors A
  WHERE NOT EXISTS (
    SELECT *
    FROM Books B, Authors_Books C
    WHERE B.rating < 3 AND A.id = C.Author_id
      AND C.book_id = B.id)
  ")

        @fan = Person.find_by_sql("SELECT P.name
                               FROM People P
                               WHERE NOT EXISTS (
                                 SELECT B.title
                                 FROM Books B, Authors D, Authors_Books A
                                 WHERE B.id = A.book_id AND D.id = A.author_id AND D.name = 'Neil Gaiman'
                                   AND P.id NOT IN(
                                     SELECT P1.id
                                     FROM People P1
                                     WHERE P1.id = B.person_id))")
  
    @books = Book.find_by_sql("SELECT * FROM BOOKS ORDER BY title")
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
    @people = Person.all
    @authors = Author.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
    @people = Person.all
    @authors = Author.all
  end

  # POST /books
  # POST /books.json
  def create

    @book = Book.new(params[:book])

    respond_to do |format|
      if @book.save
        format.html { redirect_to "/books", notice: 'Book was successfully created.' }
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

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to '/books', notice: 'Book was successfully updated.' }
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
      format.html { redirect_to "/books" }
      format.json { head :no_content }
    end
  end
end
