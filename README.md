Learn Vimscript the TDD way!

## Setup

* check out this repository: `git clone git@github.com:VimLondon/learn-vimscript-the-tdd-way.git`
* `cd learn-vimscript-the-tdd-way`
* install dependencies: `bundle install`
* run the tests: `rake`

You should have a passing test suite.

## Working through the exercises

The exercises are listed in the `t` directory. Open them up in Vim:

    vim t/*

*hint: that populates the argument list, so you can advance/reverse through the lessons by running `:next`/`:prev`.*

You should start off in a file called `t/001_about_true_and_false.vim`. The tests should all pass at first, because the solutions are filled in. To conceal the answers, run this command:

    :source conceal_solutions.vim

That script performs two changes to each example. It:

* removes the solutions, and
* marks each test as TODO

For example, this test:

    it 'number 1 is treated as true'
      Expect ___('truthy') ==# TruthValue(1)
    end

is converted to this:

    it 'number 1 is treated as true'
      TODO
      Expect ___ ==# TruthValue(1)
    end

The `TODO` statement prevents the test from running. Delete that line, then run the test suite and you should get your first error message:

    t/001_about_true_and_false.vim ........ 1/?
    not ok 1 - About True and False number 1 is treated as true
    # function <SNR>1_main..vspec#test..5, line 1
    # Vim(call):E121: Undefined variable: ___
    t/001_about_true_and_false.vim ........ Failed 1/6 subtests

The relevant bit is: `Undefined variable: ___`. To fix it, change the `___` placeholder to the correct answer, in this case:

    it 'number 1 is treated as true'
      Expect 'truthy' ==# TruthValue(1)
    end

Run the tests again and they should pass.

Move on to the next exercise: delete the line with `TODO`, then change the `___` placeholder to the correct answer.
