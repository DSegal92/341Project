class PeopleController < ApplicationController
  # GET /peoples
  # GET /peoples.json
  def index
    @people = Person.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @peoples }
    end
  end

  # GET /peoples/1
  # GET /peoples/1.json
  def show
    @people = Person.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @people }
    end
  end

  # GET /peoples/new
  # GET /peoples/new.json
  def new
    @people = Person.new
    @people = Person.all
    @studios = Studio.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @people }
    end
  end

  # GET /peoples/1/edit
  def edit
    @people = Person.find(params[:id])
    @studios = Studio.all
    @people = Person.all
  end

  # POST /peoples
  # POST /peoples.json
  def create
    @people = Person.new(params[:people])

    respond_to do |format|
      if @people.save
        format.html { redirect_to @people, notice: 'Person was successfully created.' }
        format.json { render json: @people, status: :created, location: @people }
      else
        format.html { render action: "new" }
        format.json { render json: @people.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /peoples/1
  # PUT /peoples/1.json
  def update
    @people = Person.find(params[:id])

    respond_to do |format|
      if @people.update_attributes(params[:people])
        format.html { redirect_to @people, notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @people.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peoples/1
  # DELETE /peoples/1.json
  def destroy
    @people = Person.find(params[:id])
    @people.destroy

    respond_to do |format|
      format.html { redirect_to peoples_url }
      format.json { head :no_content }
    end
  end
end
