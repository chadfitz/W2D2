class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  # @@random_word = DICTIONARY.sample

  def self.random_word 
    @random_word = DICTIONARY.sample
    # @@random_word
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      true
    else false
    end
  end

  def get_matching_indices(char)
    new_arr = []
    @secret_word.each_char.with_index do |letter, i|
      new_arr << i if char == letter
    end
    new_arr
  end

  def fill_indices(char, indices_arr)
    indices_arr.each { |index| @guess_word[index] = char }
  end
end
