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

require 'models/note.rb'
require 'test/unit'

class TestNote < Test::Unit::TestCase
  
  def test_flds_setter
    note = Note.new
    flds = "Bonjour #{Note::SEPARATOR} Hello"
    note.flds = flds
    assert_not_nil(note.csum)
    assert(note.csum.length == 8, "Checksum should be 8 characters long")
  end

end
