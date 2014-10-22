def bubblesort(array)
  switches = 1
  while switches != 0
    switches = 0
    for number in (0...array.length)
      if (array[number] <=> array[number+1]) == 1
        placeholder = array[number]
        array[number] = array[number+1]
        array[number+1] = placeholder
        switches += 1
      end
    end
  end
  return array
end



def bubble_sort_by(array)
  switches = 1
  while switches != 0
    switches = 0
    for number in (0...array.length)
      for number2 in (number+1...array.length)
      if ((yield array[number], array[number2]) < 0)
        placeholder = array[number]
        array[number] = array[number2]
        array[number2] = placeholder
        switches += 1
      end
    end
    end
  end
  return array
end

