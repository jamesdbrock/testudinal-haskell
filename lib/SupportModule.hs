{-# LANGUAGE FlexibleInstances, ExplicitForAll, PackageImports #-}

module SupportModule
  ( turtle
  , nTimes
  , module Diagrams.Prelude
  , module Diagrams.TwoD.Path.Turtle
  , module Diagrams.TwoD.Path.Turtle.Aliases
  , module Control.Monad
  , module Data.Char
  )
 where

import Control.Monad
import Data.Ratio
import IHaskell.Display.Diagrams
import Data.Char
-- import "ghc" Util (nTimes)


-- Boilerplate for diagrams.
--
-- Requires
--     :extension NoMonomorphismRestriction FlexibleContexts TypeFamilies
import "diagrams-lib" Diagrams.Prelude
import "diagrams-core" Diagrams.Core
import "diagrams-cairo" Diagrams.Backend.Cairo
import "diagrams-contrib" Diagrams.TwoD.Path.Turtle
import "diagrams-contrib" Diagrams.TwoD.Path.Turtle.Aliases

-- Turtle drawing function.
-- Takes a 'Turtle' command and renders it.
turtle :: forall a. Turtle Double a -> QDiagram Cairo V2 Double Any
-- turtle :: forall a n. Turtle Rational a -> QDiagram Cairo V2 Rational Any
turtle x = diagram $ frame padding $ drawTurtle $ setPenWidth 4 *> innerdiagram
 where
--  innerdiagram = left 90 *> x
  innerdiagram = x
  padding = maximum (boxExtents (boundingBox (diagram $ drawTurtle $ innerdiagram))) / 20

-- Anyone who has studied fractions will expect numbers to work like this, and rightly so.
--
-- Requires
--     :extension FlexibleInstances
instance {-# OVERLAPPING  #-} Show (Ratio Integer) where
    showsPrec p x = case denominator x of
        1 -> showsPrec p (numerator x)
        _ -> showsPrec p (numerator x) . showString "/" . showsPrec p (denominator x)

-- | loop: Compose a function with itself n times.  (nth rather than twice)
nTimes :: Int -> (a -> a) -> (a -> a)
-- https://hackage.haskell.org/package/ghc-8.10.2/docs/Util.html#v:nTimes
nTimes 0 _ = id
nTimes 1 f = f
nTimes n f = f . nTimes (n-1) f