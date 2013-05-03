class MusicsController < ApplicationController
  # GET /musics
  # GET /musics.json
  def index
    @threeOrMore = Artist.find_by_sql(" SELECT A.name, A.id
                              FROM Artists A, Musics M, Artists_Musics C
                              WHERE A.id = C.artist_id AND C.music_id = M.id AND
                                M.rating >= 3
                              GROUP BY A.id
                              HAVING COUNT(M.id) >= 3")
    @hasMost = Person.find_by_sql("SELECT P.name
                                   FROM People P, Musics M, (SELECT COUNT(G1.id) AS num_musics, G1.person_id 
                                   FROM Musics G1
                                   GROUP BY G1.person_id) AS T1
                                    WHERE NOT EXISTS (
                                      SELECT COUNT(G2.id) AS num_musics, G2.person_id 
                                      FROM Musics G2
                                      GROUP BY G2.person_id
                                      HAVING COUNT(G2.id) > T1.num_musics)").first()
    @genreOnly = Artist.find_by_sql("SELECT A.name
                                    FROM Artists A
                                    WHERE NOT EXISTS (
                                      SELECT *
                                      FROM Musics M, Artists_Musics C
                                      WHERE C.artist_id = A.id AND C.music_id = M.id AND M.genre <> 'Anti-folk')")
    @good = Artist.find_by_sql("SELECT A.name
                                FROM Artists A
                                WHERE NOT EXISTS (
                                  SELECT *
                                  FROM Musics M, Artists_Musics C
                                  WHERE M.rating < 3 AND A.id = C.Artist_id
                                    AND C.music_id = M.id)")
    @fan = Person.find_by_sql("SELECT P.name
                               FROM People P
                               WHERE NOT EXISTS(
                                 SELECT M.title
                                 FROM Musics M, Artists A, Artists_Musics C
                                 WHERE M.artist_id = C.artist_id AND C.artist_id = A.id
                                   AND A.name = 'Bethesda'
                                   AND M.person_id NOT IN(
                                     SELECT P1.id
                                     FROM People P1
                                     WHERE P1.id = M.person_id))")
    @musics = Music.find_by_sql("SELECT * FROM Musics Order By title")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @musics }
    end
  end

  # GET /musics/1
  # GET /musics/1.json
  def show
    @music = Music.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @music }
    end
  end

  # GET /musics/new
  # GET /musics/new.json
  def new
    @music = Music.new
    @people = Person.all
    @artists = Artist.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @music }
    end
  end

  # GET /musics/1/edit
  def edit
    @music = Music.find(params[:id])
    @people = Person.all
    @artists = Artist.all
  end

  # POST /musics
  # POST /musics.json
  def create
    @music = Music.new(params[:music])

    respond_to do |format|
      if @music.save
        format.html { redirect_to "/musics", notice: 'Music was successfully created.' }
        format.json { render json: @music, status: :created, location: @music }
      else
        format.html { render action: "new" }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /musics/1
  # PUT /musics/1.json
  def update
    @music = Music.find(params[:id])

    respond_to do |format|
      if @music.update_attributes(params[:music])
        format.html { redirect_to "/musics", notice: 'Music was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @music.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /musics/1
  # DELETE /musics/1.json
  def destroy
    @music = Music.find(params[:id])
    @music.destroy

    respond_to do |format|
      format.html { redirect_to "/musics" }
      format.json { head :no_content }
    end
  end
end
