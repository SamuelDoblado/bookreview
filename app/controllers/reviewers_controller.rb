class ReviewersController < ApplicationController
  skip_before_action :ensure_login
  before_action :set_reviewer, only: [:show, :edit, :update, :destroy]

  # GET /reviewers
  # GET /reviewers.json
  def index
    @reviewers = Reviewer.all
  end

  # GET /reviewers/1
  # GET /reviewers/1.json
  def show
  end

  # GET /reviewers/new
  def new
    @reviewer = Reviewer.new
  end

  # GET /reviewers/1/edit
  def edit
  end

  # POST /reviewers
  # POST /reviewers.json
  def create
    #captcha_message = "The data you entered for the CAPTCHA wasn't correct.  Please try again"

    @reviewer = Reviewer.new(reviewer_params)

    respond_to do |format|
     # if verify_recaptcha(model: @reviewer, message: captcha_message) && @reviewer.save
     
     #   format.html { redirect_to login_path, notice: 'Reviewer was successfully created.' }
    #    format.json { render :show, status: :created, location: @reviewer }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @reviewer.errors, status: :unprocessable_entity }
    #  end
      if verify_recaptcha
        @reviewer.save!
        redirect_to login_path, notice: 'Reviewer was successfully created.'
      else
        flash[:notice] = "The data you entered for the CAPTCHA wasn't correct.  Please try again"
        render :action => 'new'
      end
    end
  end

  # PATCH/PUT /reviewers/1
  # PATCH/PUT /reviewers/1.json
  def update
    respond_to do |format|
      if @reviewer.update(reviewer_params)
        format.html { redirect_to @reviewer, notice: 'Reviewer was successfully updated.' }
        format.json { render :show, status: :ok, location: @reviewer }
      else
        format.html { render :edit }
        format.json { render json: @reviewer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviewers/1
  # DELETE /reviewers/1.json
  def destroy
    @reviewer.destroy
    respond_to do |format|
      format.html { redirect_to reviewers_url, notice: 'Reviewer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reviewer
      @reviewer = Reviewer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reviewer_params
      params.require(:reviewer).permit(:name, :password)
    end
end
