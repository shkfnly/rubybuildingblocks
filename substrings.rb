def substrings(words, list)
  words = words.downcase.split(/[.,:;!?()\s+]{1,2}/)
  result = Hash.new
  words.each do |word|
    test = ''
    word = word.split('')
    for number1 in (0...word.length)
      test = word[number1]
      if list.include?(test)
        if result[test] == nil
          result[test] = 1
        else
          result[test] += 1
        end
      end
      number2 = number1 + 1
      while number2 < word.length
      test += word[number2]
      if list.include?(test)
        if result[test] == nil
          result[test] = 1
        else
          result[test] += 1
        end
      end
      number2 += 1
    end
    
    end
  
  end
  return result
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
print substrings("Howdy partner, sit down! How's it going?", dictionary)

