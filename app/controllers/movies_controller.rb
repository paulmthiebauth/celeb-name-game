class MoviesController < ApplicationController
  respond_to :html, :json
  def index
    @results = Imdb::Search.new(params[:search]).movies
  end

  def show


    movie_info = Imdb::Movie.new(params[:id])
    @actor_and_index = {}
    movie_info.cast_members[0..4].each_with_index {|actor, index| @actor_and_index[actor] = index}
    #SEND
    @actor_names = @actor_and_index.keys
    #SEND
    @actor_and_index = @actor_and_index.to_a.shuffle
    #SEND
    @actor_and_image = {}
    @actor_names.each do |name|
    image_url = Google::Search::Image.new(:query => name).first.uri
    @actor_and_image[name] = image_url
    end
    @picks = Pick.new

    respond_to do |format|
      format.html { render :show }
      format.json { render json: { names: @actor_names, actor_index: @actor_and_index, images: @actor_and_image, pick: @picks } }
    end


  end

  def update
  end
end
