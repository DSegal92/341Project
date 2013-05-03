class MoviesController < ApplicationController
  # GET /movies
  # GET /movies.json
  def index
    @threeOrMore = Director.find_by_sql(" SELECT D.name, D.id
                                  FROM Directors D, Movies M, Directors_Movies C
                                  WHERE D.id = C.director_id AND C.movie_id = M.id AND
                                    M.rating >= 3
                                  GROUP BY D.id
                                  HAVING COUNT(M.id) >= 3")
    @hasMost = Person.find_by_sql("SELECT P.name
                                   FROM People P, Movies M, (SELECT COUNT(G1.id) AS num_movies, G1.person_id 
                                   FROM Movies G1
                                   GROUP BY G1.person_id) AS T1
                                    WHERE NOT EXISTS (
                                      SELECT COUNT(G2.id) AS num_movies, G2.person_id 
                                      FROM Movies G2
                                      GROUP BY G2.person_id
                                      HAVING COUNT(G2.id) > T1.num_movies)").first()
     @genreOnly = Director.find_by_sql("SELECT D.name
                                     FROM Directors D
                                     WHERE NOT EXISTS (
                                       SELECT *
                                       FROM Movies M, Directors_Movies C
                                       WHERE C.director_id = D.id AND C.movie_id = M.id AND M.genre <> 'Comedy Horror')")
    @good = Director.find_by_sql("SELECT D.name
                                FROM Directors D
                                WHERE NOT EXISTS (
                                  SELECT *
                                  FROM Movies M, Directors_Movies C
                                  WHERE M.rating < 3 AND D.id = C.Director_id
                                    AND C.movie_id = M.id)")
    @fan = Person.find_by_sql("SELECT P.name
                               FROM People P
                               WHERE NOT EXISTS(
                                 SELECT M.title
                                 FROM Movies M, Directors D, Directors_Movies C
                                 WHERE M.director_id = C.director_id AND C.director_id = D.id
                                   AND D.name = 'Bethesda'
                                   AND M.person_id NOT IN(
                                     SELECT P1.id
                                     FROM People P1
                                     WHERE P1.id = M.person_id))")
    @movies = Movie.find_by_sql("SELECT * FROM Movies Order By title")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movies }
    end
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @movie = Movie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movie }
    end
  end

  # GET /movies/new
  # GET /movies/new.json
  def new
    @movie = Movie.new
    @people = Person.all
    @directors = Director.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @movie }
    end
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
    @people = Person.all
    @directors = Director.all
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(params[:movie])

    respond_to do |format|
      if @movie.save
        format.html { redirect_to "/movies", notice: 'Movie was successfully created.' }
        format.json { render json: @movie, status: :created, location: @movie }
      else
        format.html { render action: "new" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /movies/1
  # PUT /movies/1.json
  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        format.html { redirect_to "/movies", notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to "/movies" }
      format.json { head :no_content }
    end
  end
end
