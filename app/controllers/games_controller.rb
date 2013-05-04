class GamesController < ApplicationController
  # GET /games
  # GET /games.json
  def index
      @threeOrMore = Studio.find_by_sql(" SELECT S.name, S.id
                                        FROM Studios S, Games G, Games_Studios C
                                        WHERE S.id = C.studio_id AND C.game_id = G.id AND
                                          G.rating >= 3
                                        GROUP BY S.id
                                        HAVING COUNT(G.id) >= 3")

      @hasMost = Person.find_by_sql("SELECT P.name
                                     FROM People P, (SELECT COUNT(G1.id) AS num_games, G1.person_id AS id
                                                     FROM Games G1
                                                     GROUP BY G1.person_id) AS G1
                                     WHERE G1.id = P.id 
                                      AND NOT EXISTS (SELECT COUNT(G2.id), G2.person_id
                                                      FROM Games G2
                                                      GROUP BY G2.person_id
                                                      HAVING COUNT(G2.id) > G1.num_games)").first()


       @genreOnly = Studio.find_by_sql("SELECT S.name
                                       FROM Studios S
                                       WHERE NOT EXISTS (
                                         SELECT *
                                         FROM Games G, Games_Studios C
                                         WHERE C.studio_id = S.id AND C.game_id = G.id AND G.genre <> 'Sports')")

        @good = Studio.find_by_sql("SELECT S.name
                                    FROM Studios S
                                    WHERE NOT EXISTS (
                                      SELECT *
                                      FROM Games G, Games_Studios C
                                      WHERE G.rating < 3 AND S.id = C.Studio_id
                                        AND C.game_id = G.id)")

        @fan = Person.find_by_sql("SELECT P.name
                         FROM People P
                         WHERE NOT EXISTS (
                           SELECT G.title
                           FROM Games G, Studios S, Games_Studios SG
                           WHERE G.id = SG.game_id AND S.id = SG.studio_id AND S.name = 'Bethesda'
                             AND P.id NOT IN(
                               SELECT P1.id
                               FROM People P1
                               WHERE P1.id = G.person_id))")
  

    @games = Game.find_by_sql("SELECT * FROM Games Order By title")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/new
  # GET /games/new.json
  def new
    @game = Game.new
    @people = Person.all
    @studios = Studio.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
    @studios = Studio.all
    @people = Person.all
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(params[:game])

    respond_to do |format|
      if @game.save
        format.html { redirect_to "/games", notice: 'Game was successfully created.' }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html { render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to "/games", notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to "/games" }
      format.json { head :no_content }
    end
  end
end
