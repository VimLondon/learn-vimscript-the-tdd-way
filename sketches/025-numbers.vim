" http://learnvimscriptthehardway.stevelosh.com/chapters/25.html

describe 'numbers'

  it 'assume decimal format'
    Expect 5 + 5 == 10
  end

  it 'assume octal format with a leading zero'
    Expect 010 == 8
    Expect 010 + 010 == 16
  end

  it 'assume hexadecimal with leading "0x"'
    Expect 0x10 == 16
    Expect 0x1 + 0x10 == 17
  end

  it 'supports scientific notation for floats'
    Expect 1.0e-5 == 0.00001
    Expect 1.0e+5 == 100000.0
    Expect 12.3e2 == 1.23e3
  end

end

describe 'coercion'

  it 'casts numbers to floats'
    Expect 1 + 1.0 == 2.0
    Expect 2 * 2.0 == 4.0
    Expect 4 / 2.0 == 2.0
  end

end

describe 'division'

  it 'integer division discards remainder'
    Expect 5 / 2 == 2
    Expect 5 % 2 == 1
  end

  it 'floating point division preserves remainder'
    Expect 5.0 / 2 == 2.5
    Expect 5 / 2.0 == 2.5
  end

end

