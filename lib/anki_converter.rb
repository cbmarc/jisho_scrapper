#JishoScrapper
#Copyright (C) 2016 Marc Carné
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.

require_relative 'db_manager'
require_relative 'jisho_extractor'
require_relative 'models/card'
require_relative 'models/note'
require_relative 'models/word'
require_relative 'models/meaning'
require_relative 'models/tags'
require_relative 'models/character'
require 'zip'

class AnkiConverter

  OUTPUT_DATABASE = 'bin/anki.sqlite'

  def create_anki_from_words(words)
    db_manager = DBManager.new OUTPUT_DATABASE
    words.each do |word|
      #For note
      #tags
      #flds card content separated by \x1f char
      #sfld card front without html 
      note = Note.new
      note.flds = word.full_word + Note::SEPARATOR + word.meaning.to_s
      note.sfld = word.full_word
      #For card
      #nid note id
      card = Card.new
      card.nid = note.id
      
      db_manager.insert_object(note)
      db_manager.insert_object(card)
    end
  end  

end

extractor = JishoExtractor.new
words = extractor.extractNoken5Words

anki = AnkiConverter.new
anki.create_anki_from_words words
