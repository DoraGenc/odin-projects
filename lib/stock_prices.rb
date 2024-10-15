# frozen_string_literal: true

def stock_picker(stock_prices)
  max_profit = 0
  best_days = [0, 0]

  stock_prices.each_with_index do |buy_price, buy_day_index|
    stock_prices.each_with_index do |sell_price, sell_day_index|
      next unless sell_day_index > buy_day_index

      profit = sell_price - buy_price

      if profit > max_profit
        max_profit = profit
        best_days = [buy_day_index, sell_day_index]
      end
    end
  end

  [best_days, max_profit] # als hash zurückgeben
end

user_stockprices = []

weekdays = [Monday Tuesday Wednesday Thursday Friday Saturday Sunday] # sollte konstante sein

puts 'Please enter the stock prices for the week.'

weekdays.each do |day|
  valid_input = false

  until valid_input # Die Schleife fragt so lange den gleichen Tag ab, bis die Eingabe valid ist
    puts "#{day}: "
    stockprice_of_the_day = gets.chomp

    if stockprice_of_the_day.empty? || !stockprice_of_the_day.match?(/^\d*(\.\d+)?$/)
      puts 'Please enter a valid price. Do not type in letters or other characters than numbers.'
    else
      user_stockprices << stockprice_of_the_day.to_f
      valid_input = true
    end
  end
end

# Methode ausführen
best_days, maximum_profit = stock_picker(user_stockprices) # der return Wert ist ein Array. Dadurch, dass man 2 Variablen angibt, wird das Array in 2 seperate Variablen entpackt. Das würde auch gehen, wenn man die Variablen hier umbenennen würde!

# Index-Zahlen in Tage umwandeln
buy_day = weekdays[best_days[0]]
sell_day = weekdays[best_days[1]]

puts "You will recieve maximum the profit of #{maximum_profit} by buying on #{buy_day} and selling on #{sell_day}!"

# (/^\d*(\.\d+)?$/)
# // => Syntax für Zeichenkette
# ^ -> Anker, damit die Überprüfung am Anfang beginnt, \d Ziffern 0-9, * null oder mehr, \. steht für einen Punkt, durch \ wird er ignoriert, ? = vorheriges in der Klammer ist Optional (hier: dass es eine float ist)
# $ als Anker für das Ende der Zeichenkette

# Probleme: mehrere gleiche stockprices an Tagen => der erste Tag wird genommen, Was wenn an jeder Tag gleich ist?
