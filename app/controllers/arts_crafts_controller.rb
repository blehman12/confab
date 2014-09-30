class ArtsCraftsController < ApplicationController
  before_action :set_arts_craft, only: [:show, :edit, :update, :destroy]

  # GET /arts_crafts
  # GET /arts_crafts.json
  def index
    @arts_crafts = ArtsCraft.all
  end

  # GET /arts_crafts/1
  # GET /arts_crafts/1.json
  def show
  end

  # GET /arts_crafts/new
  def new
    @arts_craft = ArtsCraft.new
  end

  # GET /arts_crafts/1/edit
  def edit
  end

  # POST /arts_crafts
  # POST /arts_crafts.json
  def create
    @arts_craft = ArtsCraft.new(arts_craft_params)

    respond_to do |format|
      if @arts_craft.save
        format.html { redirect_to @arts_craft, notice: 'Arts craft was successfully created.' }
        format.json { render action: 'show', status: :created, location: @arts_craft }
      else
        format.html { render action: 'new' }
        format.json { render json: @arts_craft.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arts_crafts/1
  # PATCH/PUT /arts_crafts/1.json
  def update
    respond_to do |format|
      if @arts_craft.update(arts_craft_params)
        format.html { redirect_to @arts_craft, notice: 'Arts craft was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @arts_craft.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arts_crafts/1
  # DELETE /arts_crafts/1.json
  def destroy
    @arts_craft.destroy
    respond_to do |format|
      format.html { redirect_to arts_crafts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arts_craft
      @arts_craft = ArtsCraft.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def arts_craft_params
      params.require(:arts_craft).permit(:name, :parent_id)
    end
end
