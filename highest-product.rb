def highest_product_of_3(array_of_ints)
  arr = array_of_ints.sort
  result = 1
  max_index = arr.length - 1
  i = 0
  j = 0
  return error if max_index < 3
  # if all are negative the max will be the smallest negatives multiplied
  return arr[max_index-2..max_index].inject(:*) if arr[max_index] < 0 || arr[0] > 0
  while i + j < 3 
    return error if max_index-i <= j 
    if arr[max_index-i] < arr[j] * arr[j+1] && i + j < 2
      result *= arr[j] * arr[j+1]
      j += 2
    else
      result *= arr[max_index-i]
      i += 1
    end

  end
  return result

end


















# Tests

def run_tests
  actual = highest_product_of_3([1, 2, 3, 4])
  expected = 24
  assert_equal(actual, expected, 'short array')

  actual = highest_product_of_3([6, 1, 3, 5, 7, 8, 2])
  expected = 336
  assert_equal(actual, expected, 'longer array')

  actual = highest_product_of_3([-5, 4, 8, 2, 3])
  expected = 96
  assert_equal(actual, expected, 'array has one negative')

  actual = highest_product_of_3([-10, 1, 3, 2, -10])
  expected = 300
  assert_equal(actual, expected, 'array has two negatives')

  actual = highest_product_of_3([-5, -1, -3, -2])
  expected = -6
  assert_equal(actual, expected, 'array is all negatives')

  assert_raises('empty array raises error') do
    highest_product_of_3([])
  end

  assert_raises('one number raises error') do
    highest_product_of_3([1])
  end

  assert_raises('two numbers raises error') do
    highest_product_of_3([1, 1])
  end
end

def assert_equal(a, b, desc)
  puts "#{desc} ... #{a == b ? 'PASS' : "FAIL: #{a.inspect} != #{b.inspect}"}"
end

def assert_raises(desc)
  yield
  puts "#{desc} ... FAIL"
rescue
  puts "#{desc} ... PASS"
end

run_tests