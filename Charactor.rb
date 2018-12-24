#!/usr/bin/env ruby 
require "./Card"

class Charactor
  attr_reader :name, :cards

  def initialize(charaName = "NoName", cardsParams = [{cost: 1, value: 1}, {cost: 1, value: 1}, {cost: 1, value: 1}, {cost: 2, value: 3}, {cost: 3, value: 4}])
    @name = charaName 
    @cards = Array.new
    cardsParams.each do |cp|
      @cards << Card.new(@name, cp[:cost], cp[:value])
    end 
  end
end

if __FILE__ == $0
  karen = Charactor.new("華蓮", [{cost: 1, value: 1}, {cost: 1, value: 1}, {cost: 1, value: 1}, {cost: 2, value: 3}, {cost: 3, value: 4}])
  puts karen.name 
  karen.cards.each do |card| 
    puts "charaName: #{card.charaName}, cost: #{card.cost}, value: #{card.value}"
  end 
end 