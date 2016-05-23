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
require_relative 'models/anki/card'
require_relative 'models/anki/note'
require_relative 'models/word'
require_relative 'models/meaning'
require_relative 'models/tags'
require_relative 'models/character'
require 'zip/zip'

class AnkiConverter

  OUTPUT_DATABASE = 'anki.sqlite'

  def create_anki_from_words(anki_path, words)
    db_manager = DBManager.new anki_path + '/' + OUTPUT_DATABASE
    db_manager.create_schema

    words.each do |word|
      note = Note.new
      note.flds = word.full_word + Note::SEPARATOR + word.meanings.to_s
      note.sfld = word.full_word
      
	    card = Card.new
      card.nid = note.id
      
      db_manager.insert_object(note)
      db_manager.insert_object(card)
    end
   
    # Create media file
    File.open(anki_path + "/media", 'w') {|f| f.write("{}") }  
    Zip::ZipFile.open(anki_path + "/anki.zip", Zip::ZipFile::CREATE) do |zipfile|
      zipfile.add("media", anki_path + "/" + "media")
      zipfile.add(OUTPUT_DATABASE, anki_path + "/" + OUTPUT_DATABASE)
    end  
  end
end

extractor = JishoExtractor.new
words = extractor.extract('たべる')

anki = AnkiConverter.new
anki.create_anki_from_words("/home/maruku/Desktop/test/", words)
