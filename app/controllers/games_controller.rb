# Note the plural
class GamesController < ApplicationController
  def index # display a _collection_ of games
    # Equivalent:
    #   @games = Game.where(user_id: user.id)
    @games = current_user.games
  end

  def show
    id = params[:id]
    @game = current_user.games.find(id)
  end

  def create
    random_word = File.read(__FILE__).
      split(" ").reject{ |word| word.length < 5 }.sample

    game = current_user.games.create!(
      max_misses: 10,
      misses:     0,
      answer:     random_word,
      guessed:    ""
    )
    redirect_to game
  end

  def update
    game = current_user.games.find params[:id]
    game.guess params[:letter]
    redirect_to game
  end
end
