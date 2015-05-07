class LeadersController < ApplicationController

  def index
    @leaders = Leader.all
  end
end
