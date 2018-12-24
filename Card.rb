#!/usr/bin/env ruby 
class Card 
  attr_reader :charaName, :cost, :value 
  def initialize(charaName = "NoName", cardCost = 1, cardValue = 1) 
    @charaName = charaName 
    @cost = cardCost
    @value = cardValue 
  end 
end