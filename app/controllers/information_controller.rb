class InformationController < ApplicationController
  before_action :authenticate_user!
  before_action :set_information, only: %i[ show edit update destroy  ]
  # GET /information or /information.json
  def index
   if params[:query].present?
    @information = Information.search_by_title_and_user_id(params[:query])
   else
    @information = Information.all
   end
  end

  # GET /information/1 or /information/1.json
  def show

  end

  def keys
      @keys = Information.pluck(:title, :key)
  end
  # GET /information/new
  def new
    @information = current_user.informations.build
  end

  def unlock_form
    @information = Information.find(params[:id])
  end

  def unlock
    @information = Information.find(params[:id])
    if params[:key] == @information.key
      redirect_to @information, notice: "Unlocked successfully!"
    else
      redirect_to "/", notice: "Try something different next time"
      # render :unlock_form
    end
  end
  # def unlock_submit
  #   redirect_to information_path(params[:id])
  # end
  # GET /information/1/edit
  def edit
  end

  # POST /information or /information.json
  def create
    @information = current_user.informations.build(information_params)

    respond_to do |format|
      if @information.save
        format.html { redirect_to @information, notice: "Information was successfully created." }
        format.json { render :show, status: :created, location: @information }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /information/1 or /information/1.json
  def update
    respond_to do |format|
      if @information.update(information_params)
        format.html { redirect_to @information, notice: "Information was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @information }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /information/1 or /information/1.json
  def destroy
    @information.destroy!

    respond_to do |format|
      format.html { redirect_to information_index_path, notice: "Information was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_information
      @information = Information.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def information_params
      params.expect(information: [ :title, :main, :user_id ])
    end
end
