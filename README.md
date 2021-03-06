# sydtest

An experimental testing framework for Haskell with good defaults and advanced testing features.

Sydtest aims to make the common easy and the hard possible.

**Not ready for use in production yet.**


## License

Copyright (c) 2020 Tom Sydney Kerckhove

All Rights Reserved

## In short

### The devil is in the defaults

This project chooses best practices as defaults:

- A fixed seed for deterministic randomness
- Pretty show for output
- Multi-line coloured diffs
- Bounded shrinking
- Randomised test suite execution order

### Advanced testing features

- Multi-line coloured diff for equality assertion failures
- Wrap a test group to use a `withResource`-like function (`aroundAll`)

## Features & Comparison to similar projects

|                                                                                           | sydtest | Hspec                                                       | Tasty                                                            |
|-------------------------------------------------------------------------------------------|---------|-------------------------------------------------------------|------------------------------------------------------------------|
| Declarative test definition                                                               | ✔️       | ✔️                                                           | ✔️                                                                |
| Monadic test definition                                                                   | ✔️       | ✔️                                                           | ✖️                                                                |
| Safe test execution                                                                       | ✔️       | ✔️                                                           | ✔️                                                                |
| Parallel test execution                                                                   | ✔️       | ✔️                                                           | ?                                                                |
| Parallel or sequential test-group execution                                               | ✔️       | ✔️                                                           | ?                                                                |
| Automatic test discovery [1]                                                              | ✔️       | ✔️                                                           | ✔️                                                                |
| First-class support for pure tests                                                        | ✔️       | ✔️                                                           | ✖️                                                                |
| First-class support for integration tests                                                 | ✔️       | ✔️                                                           | [Lib](https://hackage.haskell.org/package/tasty-hunit)           |    
| First-class support for property tests with QuickCheck                                    | ✔️       | ✔️                                                           | [Lib](https://hackage.haskell.org/package/tasty-quickcheck)      |
| First-class support for property tests with Hedgehog                                      | 🚧      | [Lib](https://hackage.haskell.org/package/hspec-hedgehog)   | [Lib](https://hackage.haskell.org/package/tasty-hedgehog)        |
| First-class support for property tests with Smallcheck                                    | 🚧      | [Lib](https://hackage.haskell.org/package/hspec-smallcheck) | [Lib](https://hackage.haskell.org/package/tasty-smallcheck)      |
| First-class support for golden tests                                                      | ✔️       | [Lib](https://hackage.haskell.org/package/hspec-golden)     | [Lib](https://hackage.haskell.org/package/tasty-golden)          |
| Source location annotations for tests in test output                                      | ✔️       | ✔️                                                           | ✖️                                                                |
| Test suite filtering to select which tests to run                                         | ✔️       | ✔️                                                           | ✔️                                                                |
| Individual test execution timing                                                          | ✔️       | [Lib](http://hackage.haskell.org/package/hspec-slow)        | [Lib](https://hackage.haskell.org/package/tasty-stats)           |
| Test suite execution timing                                                               | ✔️       | ✔️                                                           | ✖️                                                                |
| Helpful output to find slow tests                                                         | ✔️       | [Lib](http://hackage.haskell.org/package/hspec-slow)        | C
| Coloured output                                                                           | ✔️       | ✔️                                                           | ✔️                                                                |
| Colourless output                                                                         | ✔️       | ✔️                                                           | ✔️                                                                |
| `ppShow` instead of `show` for counterexample output                                      | ✔️       | ✖️                                                           | ✖️                                                                |
| `show` for counterexample output                                                          | 🚧      | ✔️                                                           | ✔️                                                                |
| Fancy Unicode output                                                                      | ✔️       | ✖️                                                           | ✖️                                                                |
| Unicode-free output                                                                       | 🚧      | ✖️                                                           | ✔️                                                                |
| Assertion-specific output with explanation                                                | ✔️       | ✔️                                                           | ?                                                                |
| Coloured diffing                                                                          | ✔️       | ✔️                                                           | ✖️                                                                |
| multi-line diffing                                                                        | ✔️       | ✖️                                                           | ✖️                                                                |
| Contextual failures                                                                       | ✔️       | ✖️                                                           | ✖️                                                                |
| Inter-test progress output during test suite execution                                    | ✔️       | ✔️                                                           | ?                                                                |
| Intra-test progress output during test suite execution                                    | 🚧      | ✔️                                                           | ?                                                                |
| Optional standard output and standard error suppression [2]                               | ✖️       | ✖️                                                           | ✖️                                                                |
| Aquire and release a resource for every test in a group (`before` and `after`)            | ✔️       | ✔️                                                           | ✖️                                                                |
| Aquire and release a resource once for an entire test group (`beforeAll` and `afterAll`)  | ✔️       | ✔️                                                           | ✔️                                                                |
| Wrap a single test to use a `withResource`-like function (`around`)                       | ✔️       | ✔️                                                           | ✖️                                                                |
| Wrap a test group to use a `withResource`-like function (`aroundAll`)                     | ✔️       | ✖️                                                           | ✖️                                                                |
| Randomising execution order                                                               | ✔️       | ✔️                                                           | ?                                                                |
| Randomised execution order by default                                                     | ✔️       | ✖️                                                           | ?                                                                |
| Deterministic randomness for randomised execution                                         | ✔️       | ✖️                                                           | ?                                                                |
| Deterministic randomness for randomised execution order by default                        | ✔️       | ✖️                                                           | ?                                                                |
| Deterministic randomness                                                                  | ✔️       | ✔️                                                           | ✔️                                                                |
| Deterministic randomness by default                                                       | ✔️       | ✖️                                                           | ✖️                                                                |
| Deterministic randomness instructions for rerunning tests                                 | 🚧      | ✔️                                                           | ?                                                                |
| Hiding process arguments from tests                                                       | ✔️       | ✔️                                                           | ?                                                                |
| Declaring that an individual test should fail                                             | 🚧      | ✖️                                                           | [Lib](http://hackage.haskell.org/package/tasty-expected-failure) |
| Declaring that at least one in a test group should fail                                   | 🚧      | C                                                           | [Lib](http://hackage.haskell.org/package/tasty-expected-failure) |
| Using scarce resources across tests                                                       | 🚧      | C                                                           | ?                                                                |
| A way to fail the test suite as soon as one test fails (`--fail-fast`)                    | ✔️       | ✔️                                                           | ?                                                                |
| Fully configurable via flags                                                              | ✔️       | ✔️                                                           | ✔️                                                                |
| Fully configurable via environment variables                                              | ✔️       | ✔️                                                           | ✔️                                                                |
| Fully configurable via configuration file                                                 | ✔️       | ✔️                                                           | ✖️                                                                |
| Pending tests                                                                             | ✔️       | ✔️                                                           | ✖️                                                                |

* ✔️: Supported 
* Lib: Possible with an extra library
* C: Possible but you have to write some code yourself
* 🚧 — Under development
* ✖️: Not supported
* ?: I don't know.

Please let me know if I made a mistake anywhere, and feel free to fill in the question marks

* [1]: Test discovery is always handled via a separate library so I use `✔️` instead of `Lib`.
* [2]: It turns out that this is surprisingly difficult, due to [forkProcess' interaction with `MVar`s](https://www.reddit.com/r/haskell/comments/jsap9r/how_dangerous_is_forkprocess/) but I'm still looking for a way to make it happen. The answer may lie in [the way `weigh` does it](https://github.com/fpco/weigh/blob/bfcf4415144d7d2817dfcb91b6f9a6dfd7236de7/src/Weigh.hs#L373)


## Migrating from `hspec`

Migrating from `hspec` to `sydtest` has been made relatively easy.
In most cases, the following should suffice:

```
find */test -name "*.hs" -exec sed -i 's/Test.Hspec/Test.Syd/g' {} +
find */test -name "*.hs" -exec sed -i 's/hspec-discover/sydtest-discover/g' {} +
find * -name "package.yaml" -exec sed -i 's/hspec/sydtest/g' {} +
find */test -name "*.hs" -exec sed -i 's/Test.Validity/Test.Syd.Validity/g' {} +
find */test -name "*.hs" -exec sed -i 's/import Test.Syd.QuickCheck//g' {} +
find */test -name "*.hs" -exec sed -i 's/Test.Syd.Validity.Optics/Test.Syd.Validity.Lens/g' {} +
find */test -name "*.hs" -exec sed -i 's/Yesod.Test/Test.Syd.Yesod/g' {} +
```

If you are using `hspec-discover`, the following change is to be made in your test entrypoint:

``` diff
-{-# OPTIONS_GHC -F -pgmF hspec-discover #-}
+{-# OPTIONS_GHC -F -pgmF sydtest-discover #-}
```

### Pending tests

Pending tests are only a little less easy to migrate.

`hspec`:
``` haskell
it "works" pending
```

`sydtest`:
``` haskell
pending "works"
```

### `beforeAll` and `afterAll`

The `*All` resource functions from hspec will still work, but inside them you will need to use `itWithOuter` instead of `it.

## Features in detail

### Declarative test definition

Tests are declared as follows:

``` haskell
spec :: Spec
spec = do
  describe "(+)" $ do -- description of which functions you are testing
    it "does what you want it to" $ -- sentence to describe what you expect to happen
      2 + 3 == 5 -- Test code
```

### Monadic test definition

You can use IO actions to help define tests:

``` haskell
spec :: Spec
spec = do
  (a, b) <- runIO whichNumbersToTest 
  describe "myFunction" $
    it "does what you want it to" $ -- sentence to describe what you expect to happen
      myFunction a b
```

### Safe test execution

Code that throws exceptions can be tested without trouble:

``` haskell
spec :: Spec
spec = do
  describe "pred" $ do
    it "throws no exceptions" $
      pred (0 :: Word) -- causes overflow (below zero), so this test will fail.
```

This test will fail, but the test suite will continue to be executed.

### Parallel test execution

Tests are executed with as many threads as you have capabilities by default.
You can use `-j` or `--jobs` to set the number of threads to use.

### Parallel or sequential test-group execution

You can specify, as part of the test suite definition, whether tests in a given test group are allowed to be run in parallel with other tests.
You can use the `parallel` combinator to declare that tests may be run in parallel.
You can use the and `sequential` combinator to declare that tests must be run sequentially.
When using `sequential`, it is guaranteed that each test in the group will be the only one running during its execution.

### Automatic test discovery

The `sydtest-discover` tool can discover and consolidate your tests.

In order to use it, give the `Spec.hs` entrypoint for your test suite the following contents:

``` haskell
{-# OPTIONS_GHC -F -pgmF sydtest-discover #-}
```

You can also only generate a top-level `spec :: Spec` and write the main function yourself like this:

``` haskell
{-# OPTIONS_GHC -F -pgmF sydtest-discover -optF --no-main #-}
```

### First-class support for pure tests

Any `Bool` value is considered a test.

``` haskell
spec :: Spec
spec = 
  describe "True" $
    it "is True" $ True
```

### First-class support for integration tests

Any `IO ()` value is considered a test.

``` haskell
spec :: Spec
spec = 
  describe "main" $
    it "does not crash" $ (main :: IO ())
```

### First-class support for property tests with quickcheck

Any `Property` value is considered a test.

``` haskell
spec :: Spec
spec = 
  describe "reverse" $
    specify "reversing twice is the same as not reversing" $ 
      property $ \ls ->
        reverse (reverse ls) `shouldBe` ls
```

### First-class support for golden tests

Golden tests are a core feature of Sydtest.
Golden output is created automatically if none is found.
You can use `--golden-reset` to reset golden tests if they fail.

### Test suite filtering to select which tests to run

Every test failure is annotated with a source location of the test code that produced it.

![Source location](assets/source-location.png)

### Test Suite Filtering

Test suites can be filtered using the `--match` or `--filter` flags.
Empty groups are removed so that their resources are not even set up when there are no tests that need them.

### Individual test execution timing and helpful output to find slow tests

Every test is timed and the execution (wall clock) time is shown at the right-hand side of the output.
The timing information is shown in such a way that it is easily compared: All in milliseconds and with the periods aligned.
It is also colour-coded so that slow tests really stick out in the report.

![Individual test execution timing](assets/individual-timing.png)

### Test suite execution timing

Every test suite comes with a short summary that includes how long it took to run the tests.

![Test suite execution timing](assets/suite-timing.png)

### Coloured output

The results report is nice and colourful.
See the screenshots in this file.
You can use `--no-colour` to turn off colours.

### Pretty show

Output uses `ppShow` from the `pretty-show` instead of the regular `show` so that output looks nicer and uses multiple lines.

![Pretty show](assets/pretty-show.png)

### Fancy Unicode output

Tests are annotated with a nice unicode checkmark.

![Fancy Unicode output](assets/unicode.png)

### Assertion-specific output

The `Test.Syd.Expectation` module contains common assertions like `shouldBe` and `shouldSatisfy`.
The `sydtest` framework knows about these and shows nice output when they fail.

![Assertion-specific output](assets/specific-assertion.png)

### Multi-line coloured diffing

When two values are expected to be equal, the differences are shown in colour, across multiple lines, in linear time.

![Multi-line coloured diffing](assets/coloured-diff.png)

### Contextual failures

When a test fails, the failure can contain a context.
This way you can see a nice diff, but also any additional data that you may want to see.

![Contextual Failures](assets/contextual-failures.png)

### Inter-test progress output during test suite execution

The test suite report is printed bit by bit, after every test run.

### The `before`, `after` and `around` combinators

You can acquire resources for use, every time, around every test in a group, see the `Test.Syd.Def.Around` module for more details:

``` haskell
spec :: Spec
spec = around withMyServer $ 
  it "does not crash" $ \_ -> (pure () :: IO ())
  it "returns 200 OK for the home" $ \cenv -> getHome cenv `shouldBe` 200

withMyServer :: (ClientEnv -> IO ()) -> IO ()
withMyServer = undefined

getHome :: ClientEnv -> IO Int
getHome = undefined
```

### The `beforeAll`, `afterAll` and `aroundAll` combinators

You can acquire resources for use, once, around all tests in a group, see the `Test.Syd.Def.AroundAll` module for more details:

``` haskell
spec :: Spec
spec = aroundAll withMyServer $ 
  itWithOuter "does not crash" $ \_ -> (pure () :: IO ())
  itWithOuter "returns 200 OK for the home" $ \cenv -> getHome cenv `shouldBe` 200

withMyServer :: (ClientEnv -> IO ()) -> IO ()
withMyServer = undefined

getHome :: ClientEnv -> IO Int
getHome = undefined
```

### Randomised execution order

The execution order of tests is randomised by default.
This randomisation uses deterministic randomness based on the same seed that is used for deterministic randomness.
This ensures that there are no inter-test ordering dependencies.

You can control whether subsections of your test suite may be randomised using the `randomiseExecutionOrder` and `doNotRandomiseExecutionOrder` combinators.
You can also turn this randomisation off globally using `--no-randomise-execution-order`.

Randomisation happens at the test group level. The ordering of the tests within a test group is randomised and the ordering of test groups is randomised, but the ordering is not randomised _across_ test groups.
This is because resource setups happen at the test group level, and we don't want multiple resource setups to happen concurrently if they were not meant to.


### Deterministic randomness

Property tests are executed with a fixed seed by default, to prevent flakiness.
You can change the seed using the `--seed` option.


### Hiding process arguments from tests

The process arguments are hidden during test suite execution (but not during definition) using `withArgs` so that tests cannot depend on command-line arguments.


### Fast failures

By default, tests run until completion.
With the `--fail-fast` flag, the tests will stop executing as soon as a failure occurs.
When using the asynchronous runner, it could be that multiple failures have already occurred between the first failure and the cancelling of the other tests.
In that case all of those failures are reported.


### Configurable in three ways

You can configure a test suite using flags, environment variables and configuration files.
Try running your test suite with `--help` to see how that works.

### Pending tests

You can declare that some tests are still missing like so:

``` haskell
spec :: Spec
spec = do
  describe "myFunction" $ do
    pending "has no tests yet"
    pendingWith "has no tests yet" "because, frankly, we don't care"
```


### Acknowledgements

The sydtest and sydtest-yesod APIs are backward compatible with the `hspec` and `yesod-test` APIs respectively.
This is in accordance with their licenses, which you can find here:

- [`hspec`](https://hackage.haskell.org/package/hspec/src/LICENSE)
- [`yesod-test`](https://hackage.haskell.org/package/yesod-test/src/LICENSE)
