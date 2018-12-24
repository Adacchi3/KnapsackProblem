#!/usr/bin/env ruby 

require './Charactor'

@MAX_DECK_COST = 6
@MAX_CARD_NUMBER = 5

def cardsValue(cards)
  if cards.size == 0
    return 0
  end 
  return cards.reduce(0) {|sum, card| sum + card.value}
end 

def cardSelecter(cards)
  dp = Array.new(@MAX_CARD_NUMBER+1){Array.new(@MAX_DECK_COST+1,0)}
  for itemNum in 0..@MAX_CARD_NUMBER do 
    for deckCost in 0..@MAX_DECK_COST do 
      if itemNum == 0
        dp[itemNum][deckCost] = Array.new 
      elsif deckCost < cards[itemNum-1].cost
        dp[itemNum][deckCost] = dp[itemNum-1][deckCost]
      else 
        currentValue = cardsValue(dp[itemNum-1][deckCost])
        updateValue = cardsValue(dp[itemNum-1][deckCost-cards[itemNum-1].cost])+cards[itemNum-1].value
        maxValue = [currentValue, updateValue].max 
        if maxValue == currentValue
          dp[itemNum][deckCost] = dp[itemNum-1][deckCost]
        else 
          cardArr = Array.new 
          cardArr << (cards[itemNum-1])
          cardArr.concat(dp[itemNum-1][deckCost-cards[itemNum-1].cost])
          dp[itemNum][deckCost] = cardArr
        end 
      end 
    end 
  end 
  return dp[@MAX_CARD_NUMBER][@MAX_DECK_COST]
end

if __FILE__ == $0
  karen = Charactor.new("Karen Aijo", [{cost: 1, value: 1}, {cost: 1, value: 1}, {cost: 1, value: 1}, {cost: 2, value: 3}, {cost: 3, value: 6}])
  hikari = Charactor.new("Hikari Kagura", [{cost: 1, value: 1}, {cost: 1, value: 1}, {cost: 1, value: 1}, {cost: 2, value: 3}, {cost: 3, value: 6}])
  nana = Charactor.new("Nana Daiba", [{cost: 1, value: 2}, {cost: 1, value: 2}, {cost: 1, value: 2}, {cost: 2, value: 3}, {cost: 3, value: 3}])
  junna = Charactor.new("Junna Hoshimi", [{cost: 1, value: 1}, {cost: 1, value: 1}, {cost: 1, value: 1}, {cost: 2, value: 3}, {cost: 3, value: 6}])

  @cards = karen.cards + hikari.cards + nana.cards + junna.cards
  @extractCards = @cards.shuffle[0..4]
  puts "Act' candidates are in below."
  @extractCards.each do |ec|
    puts "[#{ec.charaName[0..5]}]\tCOST: #{ec.cost},\tVALUE: #{ec.value}"
  end 
  puts ""
  
  @selectedCards = cardSelecter(@extractCards)
  
  puts "Selected acts are in below."
  @selectedCards.each do |sc|
    puts "[#{sc.charaName[0..5]}]\tCOST: #{sc.cost},\tVALUE: #{sc.value}"
  end 
  puts ""

  totalValue = @selectedCards.reduce(0) {|sum, hash| sum + hash.value}
  puts "This total value is #{totalValue}!"
end 