" http://learnvimscriptthehardway.stevelosh.com/chapters/27.html

describe 'strlen()'

  it 'gets the length of a string'
    Expect strlen('supercalifragalisticexpialidocious') == 34
  end

end

describe 'split()'

  it 'breaks on spaces by default'
    Expect split("one two three") == ["one", "two", "three"]
  end

  it 'can use a specified separator'
    Expect split("one,two,three", ",") == ["one", "two", "three"]
  end

end

describe 'join()'

  it 'joins with spaces by default'
    Expect join(["one", "two", "three"]) == "one two three"
  end

  it 'can use a specified symbol to join'
    Expect join(["one", "two", "three"], "\n") == "one\ntwo\nthree"
  end

end

describe 'to{lower,upper}()'

  it 'toupper() upcases specified text'
    Expect toupper('Hello') == 'HELLO'
  end

  it 'tolower() downcases specified text'
    Expect tolower('HELLO') == 'hello'
  end

end
