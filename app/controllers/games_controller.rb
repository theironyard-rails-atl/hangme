# Note the plural
class GamesController < ApplicationController
  def index # display a _collection_ of games
    @games = Game.all
  end

  def show
    id = params[:id]
    @game = Game.find(id)
  end

  def create
    random_word = File.read(__FILE__).
      split(" ").reject{ |word| word.length < 5 }.sample

    game = Game.create!(
      max_misses: 10,
      misses:     0,
      answer:     random_word,
      guessed:    ""
    )
    redirect_to game
  end

  def update
    game = Game.find params[:id]
    game.guess params[:letter]
    redirect_to game
  end
end
