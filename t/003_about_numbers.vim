" http://learnvimscriptthehardway.stevelosh.com/chapters/25.html

describe 'numbers'

  it 'assume decimal format'
    Expect ___ ==# 9
    Expect ___ ==# 5 + 5
  end

  it 'numbers prefixed with 0 are interpreted as octal'
    Expect ___ ==# 001
    Expect ___ ==# 010
    Expect ___ ==# 017
    Expect ___ ==# 019
    Expect ___ ==# 020
    " NOTE: 019 is not a valid octal number, so Vim coerces it to decimal 19
  end

  it 'numbers prefixed with 0x are interpreted as hexadecimal'
    Expect ___ ==# 0x1
    Expect ___ ==# 0xf
    Expect ___ ==# 0x10
  end

  it 'scientific notation can be used to represent floats'
    Expect ___ ==# 1.0e-5
    Expect ___ ==# 1.0e+5
    Expect ___ ==# 12.3e2
  end

end

describe 'mixing integers and floats'

  it 'integers are coerced to floats'
    Expect ___ ==# 1 + 1.0
    Expect ___ ==# 2 * 2.0
    Expect ___ ==# 4 / 2.0
  end

end
