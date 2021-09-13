# testudinal-haskell

Haskell programming with Turtle drawing, for ages 9–13


# Ingredients

These are the essential ingredients which
have come together in the year 2021 to make a very nice Haskell programming
environment for children.

* [Jupyter Notebooks in VS Code](https://code.visualstudio.com/docs/datascience/jupyter-notebooks)

  Browser-based Jupyter is actually pretty horrible. If you know where to click it works okay,
  but if you are just experimentally clicking around the window and pressing buttons
  then you will very soon activate some browser function which takes you away from the page
  that you're on, which is very confusing.

* [VS Code devcontainers](https://github.com/microsoft/vscode-dev-containers)

  A Jupyter client with an IHaskell kernel and all of the necessary libraries
  is a massively polyglot multiprocess software system. A container is a pretty
  ideal way to package and distribute this system. The fact that VS Code can
  run a Jupyter kernel out of a container is very convenient.

* [Diagrams.TwoD.Path.Turtle](https://hackage.haskell.org/package/diagrams-contrib/docs/Diagrams-TwoD-Path-Turtle.html)

  The turtle drawing library from the
  [__diagrams__](https://archives.haskell.org/projects.haskell.org/diagrams/)
  package.

* IHaskell Widgets

  Thanks David Davó for [reviving __ihaskell-widgets__](https://gsoc21.ddavo.me/).

* `default (Rational)` and `instance {-# OVERLAPPING  #-} Show (Rational)`

  All numbers are `Rational` by
  [default](https://www.haskell.org/tutorial/numbers.html#sect10.4)
  in the notebook. The `Rational` numbers
  exhibit the fewest surprises.
  Anyone who has studied fractions will expect numbers to work the way `Rational`
  numbers work, and rightly so.

  When a `Rational` is shown, we show it with the `/` operator instead of the
  `%` constructor.

* [`LANGUAGE BlockArguments`](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/exts/block_arguments.html)

  Experienced Haskellers just write `$ do` without thinking about it, and
  they mostly don't notice how crazy and inexplicable that dollar sign is.
  [Thanks](https://gitlab.haskell.org/ghc/ghc/-/issues/10843),
  [Akio](https://ghc-proposals.readthedocs.io/en/latest/proposals/0090-block-arguments.html).