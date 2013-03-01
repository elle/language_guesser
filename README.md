# LanguageGuesser


## Development and Thoughts Process

There are a few ways one can approach this problem. For example by using ngrams, bloom filter, bayesian filtering or decision trees.
I decided to implement a very basic bloom filter in this case

* Step 1: have a hash of most common words in a language
* Step 2: compare string with langauge, and return the highest matching options

## Other decisions:

* Build this library as a gem
* Allow for strings and text files to be checked


## Assumptions

* Limiting the usage of external libraries and web services
* Allowing accented characters for languages such as Spanish
* Expecting properly typed language: for example, we are not checking for Spanish words that are not accented
* I am not differentiating between Portuguese and Brazilian-Portuguese
* No learning capabilities for future reuse is implemented in this version

## Future improvements

* Increase the ammount of common words to check against (as well as the size of the filter)
* Using bits and redis for faster data retrieval
* Using a different hashing algorithm, again for improved performance.
* Use a two step elimination to look at the characters unicode ranges to decide what language it is before moving on to applying the filter


## Installation

Add this line to your application's Gemfile:

    gem 'language_guesser'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install language_guesser

## Usage

    require 'language_guesser'
    'je ne sais pas'.language

or

    require 'language_guesser'
    f = File.open('test/fixtures/english.txt', 'r')
    LanguageGuesser.new(f).guess

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
