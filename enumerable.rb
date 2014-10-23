module Enumerable
  def my_each
    return self unless block_given?
    for i in self
      yield(i)
    end
  end

  def my_each_with_index
    for number in (0...array.length)
      yield self[number], number
    end
  end

  #redo these all with each or the other methods?
  #understand using the other blocks if a block is not given
=begin
  def my_select
    results = []
    for i in self
      if (yield(i) == true)
        results.push(i)
      end
    end
    return results
  end
=end
  def my_select
    results = []
    my_each {|i| results.push(i) if yield(i)}
    results
  end




=begin
  def my_all    
    for i in self
      if (yield(i) == false)
        marker = false
        break
      end
    end
    return marker
  end
=end
  def my_all
    if block_given?
      my_each{|i| return false unless yield(i)}
    end
    true
  end

=begin  
  def my_any
    marker = false
    for i in self
      if (yield(i) == true)
        marker = true
        break
      end
    end
    return marker
  end
=end
  def my_any
    if block_given?
      my_each{|i| return true if yield(i)}
    end
    false
  end
=begin
  def my_none
   marker = true
    for i in self
      if (yield(i) != false)
        marker = false
        break
      end
    end
    return marker
  end
=end
  def my_none
    if block_given?
      my_each{|i| return false if yield(i)}
    end
    true
  end

=begin
  def my_count(val=nil)
    count = 0
    if block_given?
      for i in self
        if yield(i) == true
        count += 1
        end
      end
    else
      if val == nil
        self.my_each {|x| count +=1}
      elsif val != nil
        self.my_each {|x| 
          if x == val
            count += 1
          end}
      end
    end
    return count
  end
=end

def my_count(val=nil)
  count = 0
  if block_given?
    my_each{|i| count += 1 if yield(i)}
  elsif val == nil
      my_each{|i| count += 1}
  else val != nil
      my_each{|i| count += 1 if x == val}
  end      
  count
end



def my_map(proc=nil)
    results = []
    if block_given? && !(proc==nil)
      my_each{|i| results.push(yield(proc.call(i)))}
    else
      my_each{|i| results.push(proc.call(i))}
    end
    return results
end


def my_inject
  memo = nil
  my_each{|i|
    if memo.nil?
      memo = i
    else
      memo = yield(memo, i)
    end
  }
  return memo
end

  def multiply_els(array)
    array.my_inject {|memo, x| memo * x }
  end



end