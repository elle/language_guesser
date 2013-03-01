class String
  def language
    LanguageGuesser.new(self).guess
  end
end
