require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(8).join(" ")
  end

  def score
    @input = params[:word]
    @game_letters = params[:letters]
    if is_included?(@input, @game_letters) 
      if in_english?(@input)
        @outcome = "You win!"
      else
       @outcome = "You lose #{@input} isnt' in english."
      end
    else
      @outcome = "You lose #{@input} can't be built out of #{params[:letters]}"
    end
  end

  def is_included?(word, grid)
    word.split("").each { |c| return false unless grid.include? c }
    return true
    # What happens when there are two of the same letters?
  end

  def in_english?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    user_serialized = open(url).read
    user = JSON.parse(user_serialized)
    return true if user["found"] == true
  end
end
