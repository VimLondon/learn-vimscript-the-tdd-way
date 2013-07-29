" http://learnvimscriptthehardway.stevelosh.com/chapters/22.html
function! ___(value)
  return a:value
endfunction

describe '== operator'

  it 'compares strings respecting user-defined &ignorecase setting'
    set noignorecase
    let equal = ('abc' == 'abc')
    Expect ___(1) == equal
    let equal = ('abc' == 'ABC')
    Expect ___(0) == equal

    set ignorecase
    let equal = ('abc' == 'abc')
    Expect ___(1) == equal
    let equal = ('abc' == 'ABC')
    Expect ___(1) == equal
  end

end

describe '==# operator'

  it 'compares strings case-sensitively'
    set ignorecase
    let equal = ('abc' ==# 'abc')
    Expect ___(1) == equal
    let equal = ('abc' ==# 'ABC')
    Expect ___(0) == equal

    set noignorecase
    let equal = ('abc' ==# 'abc')
    Expect ___(1) == equal
    let equal = ('abc' ==# 'ABC')
    Expect ___(0) == equal
  end

end

describe '==? operator'

  it 'compares strings ignoring case'
    set ignorecase
    let equal = ('abc' ==? 'abc')
    Expect ___(1) == equal
    let equal = ('abc' ==? 'ABC')
    Expect ___(1) == equal

    set noignorecase
    let equal = ('abc' ==? 'abc')
    Expect ___(1) == equal
    let equal = ('abc' ==? 'ABC')
    Expect ___(1) == equal
  end

end
