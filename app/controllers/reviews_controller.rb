class ReviewsController < ApplicationController
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
    @title = "Reviews"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = Review.find(params[:id])
    @title = "Show review"

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/new
  # GET /reviews/new.json
  def new
    @review = Review.new
    @title = "New review"

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
    @title = "Edit review"
  end

  # POST /reviews
  # POST /reviews.json
  def create
   @review = current_user.reviews.build(params[:review])
   if @review.save
     flash[:success] = "Review created!"
     redirect_to root_path
   else
     render 'pages/home'
   end
  end

  # PUT /reviews/1
  # PUT /reviews/1.json
  def update
    @review = Review.find(params[:id])
    @title = "Update review"

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    @title = "Destroy review"
    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :ok }
    end
  end
end