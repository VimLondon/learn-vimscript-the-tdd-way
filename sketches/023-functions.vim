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

describe 'duplicate functions'

  before
    function! Overload
      return 'original'
    endfunction
  end

  it 'function name won''t overwrite an existing function with same name'
    TODO | let SOLUTION = 'YOU TELL ME!'
    function Overload
      return 'ineffective'
    endfunction
    Expect Overload == SOLUTION
  end

  it 'function! name overwrites any existing function with same name'
    TODO | let SOLUTION = 'YOU TELL ME!'
    function! Overload
      return 'updated'
    endfunction
    Expect Overload == SOLUTION
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
    TODO | let SOLUTION = 'YOU TELL ME!'
    call Meow()
    Expect v:statusmsg == SOLUTION
  end

  it 'can be invoked with :echom'
    TODO | let SOLUTION = 'YOU TELL ME!'
    echom GetMeow()
    Expect v:statusmsg == SOLUTION
  end

  it 'is automatically called where {expression} is expected'
    TODO | let SOLUTION = 'YOU TELL ME!'
    Expect GetMeow() == SOLUTION
  end

  it 'returns 0 implicitly (when no return value is specified)'
    TODO | let SOLUTION = 'YOU TELL ME!'
    Expect Meow() == SOLUTION
  end

end
