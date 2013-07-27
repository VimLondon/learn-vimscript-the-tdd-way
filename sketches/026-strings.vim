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

describe 'double quoted strings'

  it 'may contain letters and punctuation'
    echom "Hello, World!"
    Expect v:statusmsg == 'Hello, World!'
  end

  it 'double \\ stands for one literal backslash'
    echom "Hello\\World!"
    Expect v:statusmsg == 'Hello\World!'
  end

  it '\n stands for a newline'
    echom "Hello\nWorld!"
    Expect match(v:statusmsg, 'Hello')  ==# 0
    Expect match(v:statusmsg, '\n')     ==# 5
    Expect match(v:statusmsg, 'World!') ==# 6
  end

end

describe 'single quoted strings'

  it 'may contain letters and punctuation'
    echom 'Hello, World!'
    Expect v:statusmsg == "Hello, World!"
  end

  it 'double \\ stands for two literal backslashes'
    echom 'Hello\\World!'
    Expect v:statusmsg == "Hello\\\\World!"
  end

  it '\n stands for backslash n'
    echom 'Hello\nWorld!'
    Expect v:statusmsg == "Hello\\nWorld!"
  end

  it 'two consecutive single quotes stand for a single single quote'
    echom 'that''s enough'
    Expect v:statusmsg == "that's enough"
  end

end

