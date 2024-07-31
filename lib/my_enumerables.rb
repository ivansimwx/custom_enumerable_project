module Enumerable
  # Your code goes here
  # def my_each
  def my_each_with_index
    count = -1
    self.my_each do |elem|
      count += 1
      yield(elem, count)
    end
  end

  def my_select
    array_store = []
    # self.my_each_with_index do |elem, index|
    #   array_store.push(elem) if yield(elem)
    # end
    self.my_each do |elem|
      array_store.push(elem) if yield(elem)
    end
    array_store
  end

  def my_all?
    self.my_each do |elem|
      return false unless yield(elem)
    end
    true
  end

  def my_any?
    self.my_each do |elem|
      return true if yield(elem)
    end
    false
  end

  def my_none?
    self.my_each do |elem|
      return false if yield(elem)
    end
    true
  end

  def my_count
    count = 0
    self.my_each do |elem|
      return self.length unless block_given?

      count += 1 if yield(elem)
    end
    count
  end

  def my_map
    array_store = []
    self.my_each_with_index do |elem,index|
      if block_given?
        array_store.push(yield(elem))
      end
    end
    array_store
  end

  def my_inject(initial_value)
    cal_value = initial_value
    self.my_each do |elem|
      cal_value = yield(cal_value, elem)
    end
    cal_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self
      yield(item)
    end
  end
end