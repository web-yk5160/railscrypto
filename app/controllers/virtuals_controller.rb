class VirtualsController < ApplicationController
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  before_action :set_virtual, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /virtuals
  # GET /virtuals.json
  def index
    @virtuals = Virtual.all
    require 'net/http'
    require 'json'
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @lookup_coins = JSON.parse(@response)
    @lookup_virtual = JSON.parse(@response)
    @profit_loss = 0
  end

  # GET /virtuals/1
  # GET /virtuals/1.json
  def show
    @virtuals = Virtual.all
    require 'net/http'
    require 'json'
    @url = 'https://api.coinmarketcap.com/v1/ticker/'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @lookup_coins = JSON.parse(@response)
    @show_virtual = JSON.parse(@response)
  end

  # GET /virtuals/new
  def new
    @virtual = Virtual.new
  end

  # GET /virtuals/1/edit
  def edit
  end

  # POST /virtuals
  # POST /virtuals.json
  def create
    @virtual = Virtual.new(virtual_params)

    respond_to do |format|
      if @virtual.save
        format.html { redirect_to @virtual, notice: 'Virtual was successfully created.' }
        format.json { render :show, status: :created, location: @virtual }
      else
        format.html { render :new }
        format.json { render json: @virtual.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /virtuals/1
  # PATCH/PUT /virtuals/1.json
  def update
    respond_to do |format|
      if @virtual.update(virtual_params)
        format.html { redirect_to @virtual, notice: 'Virtual was successfully updated.' }
        format.json { render :show, status: :ok, location: @virtual }
      else
        format.html { render :edit }
        format.json { render json: @virtual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /virtuals/1
  # DELETE /virtuals/1.json
  def destroy
    @virtual.destroy
    respond_to do |format|
      format.html { redirect_to virtuals_url, notice: 'Virtual was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_virtual
      @virtual = Virtual.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def virtual_params
      params.require(:virtual).permit(:symbol, :user_id, :cost_per, :amount_owned)
    end

    def correct_user
      @correct = current_user.virtuals.find_by(id: params[:id])
      redirect_to virtuals_path, notice: "Not Authorized to edit this entry" if @correct.nil?
    end
end
