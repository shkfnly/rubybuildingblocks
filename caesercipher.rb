def cipher(text, factor)
  downletters = ('a'..'z').to_a
  upletters = ('A'..'Z').to_a
  allletters = downletters + upletters
  text = text.split('')
  result = ""
  text.each do |letter|
    if allletters.include?(letter)
      if letter == letter.downcase
        newdex = downletters.index(letter)
        result += downletters[(newdex + factor) % 26]
      else
        newdex = upletters.index(letter)
        result += upletters[(newdex + factor) % 26]
      end
    else
      result += letter
    end
  end
  return result
end

puts cipher("What a string!", 5)