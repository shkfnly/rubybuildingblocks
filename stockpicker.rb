def stockpicker(array)
  greatest_diff = 0
  pos1 = 0
  pos2 = 0
  for number1 in (0...array.length)
    number2 = number1 + 1
    while number2 < array.length
      if (array[number1] - array[number2]) < greatest_diff
        greatest_diff = array[number1] - array[number2]
        pos1 = number1
        pos2 = number2
      end
      number2 += 1
    end
  end
  return [pos1,pos2]
end

puts stockpicker([17,3,6,9,15,8,6,1,10])