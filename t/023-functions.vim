" http://learnvimscriptthehardway.stevelosh.com/chapters/23.html

describe 'function names'

  it 'cannot start with lowercase letter'
    TODO | let to_be_solved = 'YOU TELL ME!'
    let caught = !!0
    try
      function meow()
        return "HALP!"
      endfunction
    catch
      let caught = !0
    endtry
    Expect caught to_be_solved
    Expect exists('*meow') to_be_solved
  end

  it 'can start with uppercase letter'
    TODO | let to_be_solved = 'YOU TELL ME!'
    let caught = !!0
    try
      function Meow()
        return "Meow"
      endfunction
    catch
      let caught = !0
    endtry
    Expect caught to_be_solved
    Expect exists('*Meow') to_be_solved
  end

end

describe 'functions'

  before
    function! Meow()
      echom "Meow!"
    endfunction
    function! GetMeow()
      return "Meow String!"
    endfunction
  end

  it 'can be invoked with :call'
    call Meow()
    Expect v:statusmsg == "Meow!"
  end

  it 'can be invoked with :echom'
    echom GetMeow()
    Expect v:statusmsg == "Meow String!"
  end

  it 'is automatically called where {expression} is expected'
    Expect GetMeow() == "Meow String!"
  end

  it 'returns 0 implicitly (when no return value is specified)'
    Expect Meow() == 0
  end

end
