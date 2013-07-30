" REMEMBER TO RUN :source conceal_solutions.vim
function! ___(value)
  return a:value
endfunction

describe 'About Lists'

  it 'lists are created with [] notation'
    " Refer to :help type()
    let empty_list = []
    Expect ___(3) ==# type(empty_list)
  end

  it 'list elements can be accessed by index'
    let letters = ['a', 'b', 'c', 'd', 'e']
    Expect ___('a') ==# letters[0]
    Expect ___('b') ==# letters[1]
    Expect ___('e') ==# letters[-1]
    Expect ___('d') ==# letters[-2]
  end

  it 'lists can be sliced into a sublist by [n:m] notation'
    let letters = ['a', 'b', 'c', 'd', 'e']
    Expect ___(['a', 'b']) ==# letters[0:1]
    Expect ___(['c', 'd', 'e']) ==# letters[2:4]
    Expect ___(['a', 'b', 'c', 'd', 'e']) ==# letters[0:-1]
    Expect ___(['a', 'b', 'c', 'd']) ==# letters[:3]
    Expect ___(['b', 'c', 'd', 'e']) ==# letters[1:]
    Expect ___(['a', 'b', 'c', 'd', 'e']) ==# letters[:]
  end

  it 'lists can concatenated with the + operator'
    let new_list = ['a', 'b'] + ['c']
    Expect ___(['a', 'b', 'c']) ==# new_list
  end

  it 'list concatenation requires LHS and RHS of + to be lists'
    let caught = 'no'
    try
      let disallowed = ['a', 'b'] + 'c'
    catch /Using a List as a Number/
      let caught = 'yes'
    endtry
    Expect ___('yes') ==# caught
  end

  it 'list elements can be unpacked to variables'
    let [a, b, c; d] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    Expect ___(1) ==# a
    Expect ___(2) ==# b
    Expect ___(3) ==# c
    Expect ___([4, 5, 6, 7, 8, 9]) ==# d
  end

  it 'insert()'
    let list = [1, 2, 3, 4, 5]
    call insert(list, 0)
    Expect ___([0, 1, 2, 3, 4, 5]) ==# list
  end

  " You're on your own for these...
  " Write some tests to explore the behavior of these list functions
  it 'add()'
  end

  it 'extend()'
  end

  it 'get()'
  end

  it 'remove()'
  end

  it 'index()'
  end

end
