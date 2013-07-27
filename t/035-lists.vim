" http://learnvimscriptthehardway.stevelosh.com/chapters/35.html

describe 'list indexing'

  it 'starts at zero'
    let letters = ['a', 'b', 'c', 'd', 'e']
    Expect letters[0] == 'a'
  end

  it 'negative numbers count from the end backwards'
    let letters = ['a', 'b', 'c', 'd', 'e']
    Expect letters[-1] == 'e'
    Expect letters[-2] == 'd'
  end

end

describe 'list slicing'

  it '[n:m] returns all items from index n to m inclusive'
    let letters = ['a', 'b', 'c', 'd', 'e']
    Expect letters[0:1] == ['a', 'b']
    Expect letters[2:4] == ['c', 'd', 'e']
    Expect letters[0:-1] == ['a', 'b', 'c', 'd', 'e']
  end

  it '[n:m] omit "n" or "m" implies from 0 to -1'
    let letters = ['a', 'b', 'c', 'd', 'e']
    Expect letters[:3] == ['a', 'b', 'c', 'd']
    Expect letters[1:] == ['b', 'c', 'd', 'e']
    Expect letters[:] == ['a', 'b', 'c', 'd', 'e']
  end

end

describe 'list concatenation'

  it '[list] + [list] produces a new [list]'
    Expect ['a', 'b'] + ['c'] == ['a', 'b', 'c']
  end

  it '[list] + other raises an exception'
    try
      let disallowed = ['a', 'b'] + 'c'
    catch /Using a List as a Number/
      let caught = !0
    endtry
    Expect caught to_be_true
  end

end

describe 'unpacking a list'

  it 'assign to multiple variables at once'
    let [a, b, c] = [1, 2, 3]
    Expect a == 1
    Expect b == 2
    Expect c == 3
  end

  it 'gather surplus elements in a list'
    let [a, b, c; d] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    Expect a == 1
    Expect b == 2
    Expect c == 3
    Expect d == [4, 5, 6, 7, 8, 9]
  end

end

" describe 'list modification'
  " refer to :help list-modification

  " it 'let list[index] = value'
  " it 'let list[b:e] = [values]'
  " it 'insert(list, value)'
  " it 'add(list, value)'
  " it 'remove(list, index)'
  " it 'pop === remove(list, -1)'
  " it 'unshift === remove(list, 0)'

" end

describe 'list identity'
  " refer to :help list-identity

  it 'lists are assigned by reference'
    let aa = [1, 2, 3]
    let bb = aa
    call add(aa, 4)
    Expect bb == [1, 2, 3, 4]
  end

  it 'copy() gets you a shallow copy of a list'
    let aa = [[1,'a'], [2,'b'], [3, 'c']]
    let bb = copy(aa)

    call add(aa, [4, 'd'])
    Expect aa == [[1,'a'], [2,'b'], [3, 'c'], [4, 'd']]
    Expect bb == [[1,'a'], [2,'b'], [3, 'c']]

    let aa[0][1] = 'A'
    Expect aa == [[1,'A'], [2,'b'], [3, 'c'], [4, 'd']]
    Expect bb == [[1,'A'], [2,'b'], [3, 'c']]
  end

  it 'deepcopy() gets you a deep copy of a list'
    let aa = [[1,'a'], [2,'b'], [3, 'c']]
    let bb = deepcopy(aa)

    call add(aa, [4, 'd'])
    Expect aa == [[1,'a'], [2,'b'], [3, 'c'], [4, 'd']]
    Expect bb == [[1,'a'], [2,'b'], [3, 'c']]

    let aa[0][1] = 'A'
    Expect aa == [[1,'A'], [2,'b'], [3, 'c'], [4, 'd']]
    Expect bb == [[1,'a'], [2,'b'], [3, 'c']]
  end

end
