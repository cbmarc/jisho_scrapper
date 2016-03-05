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

class Card
	attr_accessor :id
	attr_accessor :nid
	attr_accessor :did
	attr_accessor :ord
	attr_accessor :mod
	attr_accessor :usn
	attr_accessor :type
	attr_accessor :queue
	attr_accessor :due
	attr_accessor :ivl
	attr_accessor :factor
	attr_accessor :reps
	attr_accessor :lapses
	attr_accessor :left
	attr_accessor :odue
	attr_accessor :odid
	attr_accessor :flags
	attr_accessor :data
end
