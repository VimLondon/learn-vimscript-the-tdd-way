" http://learnvimscriptthehardway.stevelosh.com/chapters/21.html

describe '+'

  it 'coerces strings into numbers, sometimes'
    TODO
    Expect 'abc' + 'def'    ==# SOLUTION
    Expect 'abc' + '10'     ==# SOLUTION
    Expect '10' + 'abc'     ==# SOLUTION
    Expect '1' + '10'       ==# SOLUTION
    Expect '1one' + '10ten' ==# SOLUTION
    Expect 'one1' + 'ten10' ==# SOLUTION
  end

end

describe 'conditional statement'

  it 'falsy values'
    TODO
    let a = 'original'
    if SOLUTION
      let a = 'updated'
    endif
    Expect a ==# 'original'
  end

  it 'truthy values'
    TODO
    let a = 'original'
    if SOLUTION
      let a = 'updated'
    endif
    Expect a ==# 'updated'
  end

  it 'coerces "XYZ chars" strings to number XYZ'
    TODO | let SOLUTION = "YOU TELL ME!"
    let a = 'original'
    if '101 Dalmations'
      let a = 'updated'
    endif
    Expect a ==# SOLUTION
  end

  it 'coerces "chars XYZ" strings to zero (false)'
    TODO | let SOLUTION = "YOU TELL ME!"
    let a = 'original'
    if 'Room 101'
      let a = 'updated'
    endif
    Expect a ==# SOLUTION
  end

end
