# This ruby gem is for converting a word to its "Basa Walikan Yogyakarta"
# It reverses the string according to very simple rules, just like an XOR encoding
# Please refer to README.md for details

require 'strscan'

module Libil
  
  GEM_VERSION = "0.1.3" 
  # The Consonant map of Javanese alphabet
  CONSONANT_MAP = ['h', 'n', 'c', 'r', 'k', 'd', 't', 's', 'w', 'l', 'p', 'dh', 'j', 'y', 'ny', 'm', 'g', 'b', 'th', 'ng']; # 15 - 19
  
  # This will convert malang style
  def self.convert_ngalam(sentence)
    converted_words = sentence.split(/ /).map {|word| Libil::convert_word_ngalam(word) }
    return converted_words.join(' ')
  end

  # This is to convert the entire sentence
  def self.convert(sentence)
    converted_words = sentence.split(/ /).map {|word| Libil::convert_word(word)}
    return converted_words.join(' ')
  end

  def self.convert_word_ngalam(word)
    if (word.strip.length == 0)
      return word
    end
    
    # Detect if the word is capitalized
    is_capitalized = (word == word.capitalize)

    tokens = self.tokenize(word)
    orig_word = tokens.reverse.join('')

    if is_capitalized
      return orig_word.capitalize
    else
      return orig_word
    end
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
      cc = ss.peek(1)
      digraph = c + cc

      if (CONSONANT_MAP.include?(digraph.downcase))
        ss.getch
        t << digraph
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
