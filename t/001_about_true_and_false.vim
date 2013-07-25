describe 'About True and False'

  before
    function TruthValue(condition)
      if a:condition
        return 'truthy'
      else
        return 'falsey'
      endif
    endfunction
  end

  it '1 is treated as true'
    Expect TruthValue(1) ==# 'truthy'
  end

  it '0 is treated as false'
    Expect TruthValue(0) ==# 'falsey'
  end

  it '! operator can be used to negate'
    Expect TruthValue(!0) ==# 'truthy'
    Expect TruthValue(!!0) ==# 'falsey'
  end

  it 'non-zero numbers are always true'
    Expect TruthValue(-1) ==# 'truthy'
    Expect TruthValue(010) ==# 'truthy'
    Expect TruthValue(0x10) ==# 'truthy'
    Expect TruthValue(0.1) ==# 'truthy'
    Expect TruthValue(1.0e3) ==# 'truthy'
  end

  it 'empty strings, empty lists, and empty dictionaries are all true'
    Expect TruthValue([]) ==# 'truthy'
    Expect TruthValue({}) ==# 'truthy'
    Expect TruthValue('') ==# 'truthy'
    Expect TruthValue("") ==# 'truthy'
  end

end
