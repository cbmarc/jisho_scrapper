require 'rubygems'
require 'nokogiri'
require 'uri'
require 'open-uri'
require_relative 'word'
class JishoPage

    JISHO_URL = 'http://jisho.org/search/'
    
    def search(search_term, page=1)
        url = JISHO_URL + search_term + "?page=#{page}"
        encoded_url = URI.escape(url)
        @doc = Nokogiri::HTML(open(encoded_url))
        return @doc
    end

    def get_word_count
        if nil == @doc
            return 0
        end
        result = @doc.css("span[class='result_count']")
        result = result[0].text.gsub(/[^\d]/, '')
        return result.to_i
    end

    def get_words
        if nil == @doc
            return nil
        end
        words = Array.new

        results = @doc.css("div[class='concept_light clearfix']")
        results.each do |result|
            word = Word.new
            text = result.css("span[class=text]")
            word.full_word = text.text.strip
            word.characters = word.full_word.split(//)
            puts word.full_word
        end
        
        return results
    end
    
end

jisho = JishoPage.new
jisho.search('#jlpt-n5 #words')
#puts jisho.get_word_count
jisho.get_words
