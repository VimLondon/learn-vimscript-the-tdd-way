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

end
