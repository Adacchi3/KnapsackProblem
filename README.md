# Knapsack Solver for the Specific Domain 
## Overview 
The Knapscak Problem is a problem in combinational optimization[ [Click here for details](https://en.wikipedia.org/wiki/Knapsack_problem)]. 

This project is solved the knapsack problem for the specific domain: we have characters who have 2 parameters such as name(Charactor Name: String) and 5 cards(Array of Card). Each card has 3 parameters such as character name, cost and value. 

This project automatically extracts 6 cards from the collection of characters' cards. We would like to choose the cards within the maximum value and the deck cost. This project addresses this problem as knapsack problem with dynamic programming. 

### Running
` $ruby main.rb `

## Memo (in Japanese)

二次元配列の初期化で参照渡しになってしまう問題に直面して2時間ほど悩んだ．
[同じような悩みを抱えていた人がいることを見つけて，疑問を解消した．](https://qiita.com/Ryutaro/items/989b178a92bebb305386) Rubyで多次元配列を扱う際には気をつけたい．

普段，dp(動的計画法)でイテレータ変数を使う際には`i`や`j`を使うのだが，今回はコードの可読性向上のため，意味のある変数を用いた（実際，このおかげでデバッグが捗った）．ただ，用語によっては紛らわしいものがあるため，頭を抱える変数があるかもしれない．