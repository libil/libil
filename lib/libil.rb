# This ruby gem is for converting a word to its "Basa Walikan Yogyakarta"
# It reverses the string according to very simple rules, just like an XOR encoding
# Please refer to README.md for details

require 'strscan'

module Libil
  
  # The Consonant map of Javanese alphabet
  CONSONANT_MAP = ['h', 'n', 'c', 'r', 'k', 'd', 't', 's', 'w', 'l', 'p', 'dh', 'j', 'y', 'ny', 'm', 'g', 'b', 'th', 'ng']; # 15 - 19
  
  # This is to convert the entire sentence
  def self.convert(sentence)
    converted_words = sentence.split(/ /).map {|word| Libil::convert_word(word)}
    return converted_words.join(' ')
  end
  
  # This function is to convert one word only
  def self.convert_word(word)
    vocal = ['a', 'i', 'e', 'o', 'u']
    # tokenize
    if (word.strip.length == 0)
      return word
    end
    
    # For First Char with Vocal 
    first_char = word[0].downcase
    if vocal.include?(first_char)
      if (first_char == word[0])
        word = "h" + word
      else
        word = "H" + first_char + word[1..-1]
      end
    end

    tokens = self.tokenize(word)
    remap_tokens = tokens.map do |t|
      lowcase = t.downcase
      is_low = (lowcase == t)
      x = t

      if (Libil::CONSONANT_MAP.include?(lowcase)) 
       x = Libil::c_remap(lowcase)
      end
      
      if not is_low
        x = x.capitalize
      end
      x 
    end
    return remap_tokens.join('')
  end
  
  # This is to tokenize the word to be mapped later on when converting
  def self.tokenize(word)
    # scan linearly, not yet know how to tokenize fast
    t = []
    ss = StringScanner.new(word)
    loop do
      break if ss.eos?
      c = ss.getch
      if (c.downcase == 'n')
        if not ss.eos?
          cc = ss.getch
          if (cc.downcase == 'y' or cc.downcase == 'g')
            t << [c, cc].join('')
          else
            t << c; t << cc
          end
        else
          t << c
        end
      elsif ( c.downcase == 'd' or c.downcase == 't')
        if not ss.eos?
          cc = ss.getch
          if (cc.downcase == 'h')
            t << [c, cc].join('')
          else
            t << c; t << cc
          end
        else
          t << c
        end
      else
        t << c
      end
    end 
    return t   
  end
  
  # This function is to find a counterpart of an consonant according to the
  # Walikan Yogyakarta rule
  def self.c_remap(consonant)
    c_index = self.find_c_index(consonant)
    p_index = 0;
    
    if c_index - 10 < 0
      p_index = c_index + 10
    else
      p_index = c_index - 10
    end

    if p_index != -1
      return Libil::CONSONANT_MAP[p_index]
    else
      return ''
    end
  end
  
  # Utility Function to get the index of a consonant
  def self.find_c_index(consonant)
    return Libil::CONSONANT_MAP.index(consonant)
  end
  
end
