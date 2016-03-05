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

require 'jisho_page'
require 'test/unit'

class TestJishoPage < Test::Unit::TestCase

  WORD_COUNT  = 658
  PAGE_FILE   = File.expand_path(File.join(File.dirname(__FILE__), "resources/jlpt-n5.html"))
  def setup
    @page = JishoPage.new
    @page.load_from_file(PAGE_FILE)
  end

  def test_get_word_count
    assert_equal(WORD_COUNT, @page.get_word_count)
  end

  def test_get_words
    words = @page.get_words
    assert_not_nil(words)
    assert_equal(JishoPage::ELEMENTS_PER_PAGE, words.count)
    words.each do |word|
      assert_not_nil(word.full_word)
      assert_not_nil(word.characters)
      assert_not_nil(word.furigana)
      assert_not_nil(word.meanings)
    end
  end

end
