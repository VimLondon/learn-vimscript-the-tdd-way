" http://learnvimscriptthehardway.stevelosh.com/chapters/20.html

describe 'buffer-scope b:'

  before
    tabnew
  end

  after
    tabclose!
  end

  it 'variables can be scoped by buffer'
    new
    let b:hello = 'Howdy!'
    Expect exists("b:hello") == 1
    Expect b:hello == 'Howdy!'

    new
    Expect exists("b:hello") == 0
  end

end
