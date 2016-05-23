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

require 'digest/sha1'
require 'securerandom'

# Note object from anki model
class Note
  TABLE_NAME    = 'notes'
  SEPARATOR     = '\x1f'
  attr_accessor :id
  attr_accessor :guid
  attr_accessor :mid
  attr_accessor :mod
  attr_accessor :usn
  attr_accessor :tags
  attr_reader   :flds
  attr_accessor :sfld
  attr_reader   :csum
  attr_accessor :flags
  attr_accessor :data

  def initialize
    random_base = 10000000
    @id = random_base + Random.rand(random_base)
    @guid = SecureRandom.uuid
    @mod = Time.new
    @usn = -1 
  end

  # Autogenerating csum
  def flds=(new_flds)
    sha1 = Digest::SHA1.hexdigest new_flds
    @csum = sha1[0,8]
  end
end
