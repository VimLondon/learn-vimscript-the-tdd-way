" REMEMBER TO RUN :source conceal_solutions.vim
" http://learnvimscriptthehardway.stevelosh.com/chapters/25.html

function! ___(value)
  return a:value
endfunction

describe 'numbers'

  it 'assume decimal format'
    Expect ___(9) ==# 9
    Expect ___(10) ==# 5 + 5
  end

  it 'numbers prefixed with 0 are interpreted as octal'
    Expect ___(1) ==# 001
    Expect ___(8) ==# 010
    Expect ___(15) ==# 017
    Expect ___(19) ==# 019
    Expect ___(16) ==# 020
    " NOTE: 019 is not a valid octal number, so Vim coerces it to decimal 19
  end

  it 'numbers prefixed with 0x are interpreted as hexadecimal'
    Expect ___(1) ==# 0x1
    Expect ___(15) ==# 0xf
    Expect ___(16) ==# 0x10
  end

  it 'scientific notation can be used to represent floats'
    Expect ___(0.00001) ==# 1.0e-5
    Expect ___(100000.0) ==# 1.0e+5
    Expect ___(1230.0) ==# 12.3e2
  end

end

describe 'mixing integers and floats'

  it 'integers are coerced to floats'
    Expect ___(2.0) ==# 1 + 1.0
    Expect ___(4.0) ==# 2 * 2.0
    Expect ___(2.0) ==# 4 / 2.0
  end

end
