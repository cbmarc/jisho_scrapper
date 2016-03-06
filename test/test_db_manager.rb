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

require 'models/card.rb'
require 'db_manager'
require 'test/unit'

class TestDBManager < Test::Unit::TestCase

  def setup
    @db_manager = DBManager.new(':memory:')
    #@db_manager = DBManager.new('test/resources/test_databse.sqlite')
    @db_manager.create_schema
  end

  def test_insert_object
    card = Card.new
    @db_manager.insert_object(card)
    db_card = @db_manager.get_object_by_id(Card, card.id)
    assert_not_nil(db_card)
  end

end
