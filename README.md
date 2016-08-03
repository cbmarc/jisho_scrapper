# jisho_scrapper

**Project status:** On-going

Scrapper for the Jisho webpage, a japanese dictionary.

This is an ongoing project, that scraps words of a given search (for example #jlpt-n5), and afterwards create an Anki template for these words. Therefore, this project is for **academic purposes**, aimed to help learning japanese. 

I highly encourage the use of the online Jisho dictionary for reference.

**Current usage**

Right now, to use the script you have to call the lib/anki_converter.rb. In the end of that file you will see the code that will be automatically executed upon calling this class. What this test code does is scraps the Noken5 words from jisho and then tries to populate the anki package, although this last part is unfinished. Check for the dependnecies section to see its dependencies.

**Dependencies**

To install dependencies just run `bundle install` on the project root.

**Tests**

To run unit tests run either `rake test` or `bundle exec rake test`
