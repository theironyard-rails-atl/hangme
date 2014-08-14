# Note the plural
class GamesController < ApplicationController
  def index # display a _collection_ of games
    @games = Game.all
  end

  def show
    id = params[:id]
    @game = Game.find(id)
  end
end
