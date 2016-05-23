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

require 'sqlite3'

class DBManager

  SCHEMA_FILE = File.dirname(__FILE__) + "/../data/schema_creation.sql"
  INSERT      = "INSERT INTO %s (%s) VALUES (%s);"
  SELECT      = "SELECT * FROM %s WHERE id = ?"

  def initialize(sqlite_path)
    @sqlite_path = sqlite_path
    @db = open_database
  end

  def open_database
    return SQLite3::Database.new(@sqlite_path)
  end

  def create_schema
    begin
      schema_sql = File.read(SCHEMA_FILE)
      @db.execute_batch schema_sql
    rescue SQLite3::Exception => e
      puts "Exception ocurred"
      puts e
    end
  end

  def insert_object(object)
    table_name = object.class::TABLE_NAME
    getters = object.public_methods(false).reject { |m| m =~ /=$/ }
    columns = getters.map { |m| m.to_s }
    values = getters.map { |m| "'" + object.send(m).to_s + "'" }
    insert = INSERT % [table_name, columns.join(','), values.join(',')]
    @db.execute insert
  end

  def get_object_by_id(type, id)
    table_name = type::TABLE_NAME
    select = SELECT % [table_name]
    begin
      @db.results_as_hash = true
      @db.execute(select, id) do |row|
        object = type.new
        attributes = object.public_methods(false).reject { |m| m =~ /=$/ }
        columns = attributes.map { |m| m.to_s }
        columns.each do |col|
          object.send(col + "=", row[col])
        end
        return object
      end
    rescue SQLite3::Exception => e
      puts "ERROR: Exception ocurred"
      puts e
    end
    return nil
  end

end
