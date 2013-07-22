" http://learnvimscriptthehardway.stevelosh.com/chapters/26.html

describe 'string concatenation'

  it '"+" operator does addition (not concatenation)'
    Expect '3 mice' + '2 cats' == 5
  end

  it '"." operator concatenates strings'
    Expect '3 mice' . '2 cats' == '3 mice2 cats'
  end

  it '"." operator casts numbers to strings'
    Expect 10 . 'GreenBottles' == '10GreenBottles'
  end

  it '"." operator cannot cast floats to strings'
    let caught = !!0
    try
      let howmany = 10.0 . 'GreenBottles'
    catch /using Float as a String/
      let caught = !0
    endtry
    Expect caught to_be_true
  end

end

