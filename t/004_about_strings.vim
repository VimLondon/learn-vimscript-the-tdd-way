" http://learnvimscriptthehardway.stevelosh.com/chapters/26.html

function! ___(value)
  return a:value
endfunction

describe 'About Strings'

  it 'double quoted strings are strings'
    " Refer to :help type()
    Expect ___(1) ==# type("Hello, World!")
  end

  it 'single quoted strings are strings'
    Expect ___(1) ==# type('Hello, World!')
  end

  it 'single quoted strings can contain double quotes'
    " Replace ___ with the equivalent double-quoted string
    let string = 'She said, "Go away"'
    Expect ___("She said, \"Go away\"") ==# string
  end

  it 'in single quotes, the single quote is the only special character'
    let string = 'that''s enough'
    Expect ___("that's enough") ==# string
  end

  it 'double quoted strings can contain apostrophes'
    " Replace ___ with the equivalent single-quoted string
    let string = "Don't"
    Expect ___('Don''t') ==# string
  end

  it 'in double quotes, backslash is the escape character'
    let string = "Hello\\World!"
    Expect ___('Hello\World!') ==# string
  end

  it 'in double quotes, \n stands for a newline'
    let string = "Hello\nWorld!"
    new
    put! =string
    Expect ___("Hello") ==# getline(1)
    Expect ___("World!") ==# getline(2)
    close!
  end

  it 'in single quotes, backslash has no special meaning'
    let string = "Hello\\World!"
    Expect ___('Hello\World!') ==# string
  end

  it 'in single quotes, \n stands for backslash-n'
    let string = 'Hello\nWorld!'
    new
    put! =string
    Expect ___("Hello\\nWorld!") ==# getline(1)
    close!
  end

  it 'escape characters allow quotes to be quoted'
    let a = 'She said, "Don''t"'
    let b = "She said, \"Don't\""
    let equal = (a ==# b)
    Expect ___(1) ==# equal
  end

  it '"+" operator does addition (not concatenation)'
    let result = '3 mice' + '2 cats'
    Expect ___(5) ==# result
  end

  it '"." operator concatenates strings'
    let result = '3 mice' . '2 cats'
    Expect ___('3 mice2 cats') ==# result
  end

  it '"." operator casts numbers to strings'
    let result = 10 . 'GreenBottles'
    Expect ___('10GreenBottles') ==# result
  end

  it '"." operator cannot cast floats to strings'
    let caught = 'no'
    try
      let result = 10.0 . 'GreenBottles'
    catch /using Float as a String/
      let caught = 'yes'
    endtry
    Expect ___('yes') ==# caught
  end

end
