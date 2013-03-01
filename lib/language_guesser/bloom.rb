require 'digest/sha1'

class Bloom
  attr_accessor :size, :filter, :words

  def initialize(args={})
    @size = args.fetch(:size, 1000)
    @filter = args.fetch(:filter, Array.new(size) { |index| 0 })
    @words = args.fetch(:words, nil)

    seed if @words && @words.is_a?(Array) && @words.any?
  end

  def add(item)
    hash(item).each { |index| filter[index % size] = 1 }
  end

  def includes?(item)
    hash(item).select { |index| filter[index % size] == 1 }.size == 4
  end

  private
  def hash(str)
    Digest::SHA1.digest(str.to_s.downcase.strip).unpack 'vvvv'
  end

  def seed
    words.each { |word| add(word) }
  end
end
