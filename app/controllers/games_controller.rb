# Note the plural
class GamesController < ApplicationController
  def index # display a _collection_ of games
    @games = Game.all
  end
end
