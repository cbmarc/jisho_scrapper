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

require_relative 'jisho_page'
require_relative 'tags'
require_relative 'word'

class JishoExtractor

  # Extracts from Jisho in an array of words
  def extract(search_term)
    jisho_page = JishoPage.new
    jisho_page.search(search_term)
    word_count = jisho_page.get_word_count
    pages = (word_count.to_f / JishoPage::ELEMENTS_PER_PAGE).ceil
    words = Array.new
    for i in 1..pages
      jisho_page.search(search_term, i)
      words.push(*jisho_page.get_words)
    end
    return words
  end

  # Just for sample
  def extractNoken5Words
    return extract(Tags::NOKEN_5 + " " + Tags::WORD)
  end
end

extractor = JishoExtractor.new
words = extractor.extractNoken5
