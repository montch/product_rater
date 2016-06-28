class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  # GET /ratings
  # GET /ratings.json
  def index
    @ratings = Rating.all
    @by_product = Product.all.map { |g| {g.product_name => Rating.where(product_id: g.id)} }
    scores_desc
    top_active
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
  end

  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # GET /ratings/1/edit
  def edit
  end

  # POST /ratings
  # POST /ratings.json
  def create
    @rating = Rating.new(rating_params)

    respond_to do |format|
      if @rating.save
        format.html { redirect_to @rating, notice: 'Rating was successfully created.' }
        format.json { render :show, status: :created, location: @rating }
      else
        format.html { render :new }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  def update
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to @rating, notice: 'Rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @rating }
      else
        format.html { render :edit }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating.destroy
    respond_to do |format|
      format.html { redirect_to ratings_url, notice: 'Rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_rating
    @rating = Rating.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rating_params
    params.require(:rating).permit(:score, :product_id, :source_id)
  end

  def scores_desc
    product_scores = []
    Product.all.each do |p|
      c= 0
      score_sum = {p.product_name => ( c + p.ratings.map { |r| r.score }.reduce(0, :+).to_f  / p.ratings.count ).to_f }
      product_scores.push(score_sum)
    end
    @scores_desc = product_scores.sort_by { |hsh| hsh.values }.reverse
  end


  def top_active
    product_scores = []
    Product.where(status: 'active').each do |p|
      c= 0
      score_sum = {p.product_name => ( c + p.ratings.map { |r| r.score }.reduce(0, :+).to_f  / p.ratings.count ).to_f }
      product_scores.push(score_sum)
    end
    @top_active = product_scores.sort_by { |hsh| hsh.values }.reverse
  end


end
