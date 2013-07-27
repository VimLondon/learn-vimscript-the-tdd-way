function! ___(value)
  return a:value
endfunction

describe 'About Functions'

  it 'functions must start with an uppercase letter'
    function Meow()
      return "Meow"
    endfunction
    " refer to :h exists()
    Expect ___(1) ==# exists('*Meow')
  end

  it 'functions declared with a lowercase letter throw an error'
    let caught = 'no'
    try
      function meow()
        return "HALP!"
      endfunction
    catch
      let caught = 'yes'
    endtry
    Expect ___('yes') ==# caught
    Expect ___(0) ==# exists('*meow')
  end

end
