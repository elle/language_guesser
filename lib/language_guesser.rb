Dir[File.expand_path('lib/language_guesser/*.rb')].each { |file| require file }


class LanguageGuesser
  CLEAN_REGEXP = /[0-9]+|-|\(|\)|\[|\]|\{|\}|\?|\!|\'|\"|\.|\,|\;|\n/
  WHITESPACE_REGEXP = /\s+/

  attr_accessor :string

  def initialize(input)
    @string = input.is_a?(String) ? input : input.read
  end

  def to_s
    string
  end

  def cleaned
    string.encode('UTF-8').downcase.gsub(CLEAN_REGEXP, '').strip
  end

  def words
    cleaned.split
  end

  def profiles
    @profiles ||= {}.tap { |h| PROFILES.each { |k,v| h[k] = v[:filter] } }
  end

  def guess
    langs = {}

    profiles.each do |name, filter|
      count = 0
      b = Bloom.new({:filter => filter})
      words.each  { |w| count += 1 if b.includes?(w) }
      langs[name] = count
    end

    format_result langs
  end

  def format_result(hash)
    result = hash.group_by { |k, v| v }.max.flatten.uniq

    if result.first.zero?
      "Hmmm, sorry, but we are unsure what language this is"
    else
      result.shift # remove first element which is the count
      "Language is probably #{result.join(', ')}"
    end
  end
end

