require 'test_helper'

describe Bloom do
  it 'initialises with a filter array' do
    b = Bloom.new
    assert_equal 1000, b.filter.size
  end

  it 'initialises with array of zeros' do
    b = Bloom.new
    assert b.filter.select { |v| v == 1 }.size == 0
  end

  it 'can set a diffenet filter size' do
    b = Bloom.new({:size => 100})
    refute_equal 1000, b.filter.size
    assert_equal 100, b.filter.size
  end

  it 'adds to filter' do
    b = Bloom.new
    b.add('string')
    assert b.filter.select { |v| v == 1 }.size > 0
  end

  context 'with data' do
    before { @b = Bloom.new({:words => ['dog', 'cat', 'bird']}) }

    it 'seeds filter' do
      assert @b.filter.select { |v| v == 1 }.size > 0
    end

    it 'tests inclusion' do
      assert @b.includes? 'dog'
    end

    it 'test exclusion' do
      refute @b.includes? 'elephant'
    end
  end
end
