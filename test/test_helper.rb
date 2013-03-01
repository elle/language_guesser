require 'minitest/autorun'
require 'minitest/spec'
require 'awesome_print'
require 'debugger'

require 'minitest/reporters'
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

Dir[File.expand_path('test/fixtures/*.rb')].each { |file| require file }

require File.join(File.dirname(__FILE__), '../lib/language_guesser')


class MiniTest::Spec
  def show(object, label=nil)
    ap "#{label}:" if label
    ap object
  end

  class << self
    alias context describe
  end
end
