class MoviesController < ApplicationController
  respond_to :html, :json
  def index
    @results = []
    counter = 0
    until @results.size == 4 || Imdb::Search.new(params[:search]).movies[counter].nil?
      movie = Imdb::Search.new(params[:search]).movies[counter]
      if movie.poster != nil
        @results << movie
      end
      counter += 1
    end
  end

###Look into refactoring this !!
  def show
    binding.pry
    movie_info = Imdb::Movie.new(params[:id])
    @actor_and_index = {}
    movie_info.cast_members[0..4].each_with_index {|actor, index| @actor_and_index[actor] = index}
    @actor_names = @actor_and_index.keys
    @actor_and_index = @actor_and_index.to_a.shuffle
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
end
