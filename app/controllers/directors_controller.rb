class DirectorsController < ApplicationController
  # GET /directors
  # GET /directors.json
  def index
    @directors = Director.find_by_sql("SELECT * FROM Directors")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @directors }
    end
  end

  # GET /directors/1
  # GET /directors/1.json
  def show
    @director = Director.find_by_sql("SELECT * From Directors D WHERE D.id = " + params[:id]).first()
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @director }
    end
  end

  # GET /directors/new
  # GET /directors/new.json
  def new
    @director = Director.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @director }
    end
  end

  # GET /directors/1/edit
  def edit
    @director = Director.find_by_sql("SELECT * From Directors D WHERE D.id = " + params[:id]).first()
  end

  # POST /directors
  # POST /directors.json
  def create
    @director = Director.new(params[:director])

    respond_to do |format|
      if @director.save
        format.html { redirect_to "/movies", notice: 'Director was successfully created.' }
        format.json { render json: @director, status: :created, location: @director }
      else
        format.html { render action: "new" }
        format.json { render json: @director.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /directors/1
  # PUT /directors/1.json
  def update
     @director = Director.find_by_sql("SELECT * From Directors D WHERE D.id = " + params[:id]).first()

    respond_to do |format|
      if @director.update_attributes(params[:director])
        format.html { redirect_to "/movies", notice: 'Director was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @director.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /directors/1
  # DELETE /directors/1.json
  def destroy
    @director = Director.find(params[:id])
    @director.destroy

    respond_to do |format|
      format.html { redirect_to directors_url }
      format.json { head :no_content }
    end
  end
end
