# encoding: UTF-8

require 'test_helper'

describe LanguageGuesser do

  it 'instantiate with a string' do
    assert_instance_of LanguageGuesser, LanguageGuesser.new('this is a string')
  end

  it 'returns a string' do
    assert_instance_of String, LanguageGuesser.new('testing a string').to_s
  end

  # [e] an alternative is to provide a default empty string. hmmmm
  it 'raises an exception if no string' do
    lambda { LanguageGuesser.new }.must_raise ArgumentError
  end

  it 'ignores digits' do
    str = "This is a string 1984"
    result = LanguageGuesser.new(str).cleaned
    assert_equal 'this is a string', result
  end

  it 'cleans string' do
    str = 'This. is, a string!;'
    result = LanguageGuesser.new(str).cleaned
    assert_equal 'this is a string', result
  end

  it 'downcase string' do
    str = 'THIS IS A STRING'
    result = LanguageGuesser.new(str).cleaned
    assert_equal 'this is a string', result
  end

  it 'ensures string is utf-8' do
    str = 'this'.encode!('Windows-1252')
    result = LanguageGuesser.new(str).cleaned
    assert_equal 'UTF-8', result.encoding.to_s
  end

  LANGS.each do |k, v|
    it "guesses language #{k}" do
      result = LanguageGuesser.new(v).guess
      assert_equal "Language is probably #{k.to_s}", result
    end
  end

  it 'apologises if cannot detech lang' do
    swahili = "kusho uMkhandlu wetiCu taseNingizimu Afrika losungulwe ngekulandzela sigaba"

    result = LanguageGuesser.new(swahili).guess
    assert_equal "Hmmm, sorry, but we are unsure what language this is", result
  end

  it 'handles short string gracefully'
  it 'can load text from a file' do
  end

  it 'extends String'
end
