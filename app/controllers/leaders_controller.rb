class LeadersController < ApplicationController
  def index
    @leaders = Leader.all
    @leaders = @leaders.sort_by{|x| x.score }.reverse
  end
end
