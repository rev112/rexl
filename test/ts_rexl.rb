#!/usr/bin/env ruby
# -*- encoding : utf-8 -*- 

require 'test/unit'
require_relative '../rexl'

class TestStringXor < Test::Unit::TestCase

  TEST_STRINGS = [ 
    ['as', '  3'],
    ['123', '234'],
    ['asdfasdf', 'zsd'],
    ['asd', 'zsasdfasdfd'],
    ['мяу', 'zsasdfasdfd'],   
    ['гоги дома?', 'мяу'],
  ]

  # Some simple tests
  def test_xor
    TEST_STRINGS.each do |x, y|
      res1 = x.to_s ^ y.to_s
      res2 = y.to_s ^ x.to_s
      assert_instance_of String, res1, 'Result of x^y is not a String'
      assert_equal res1, res2, "x^y != y^x, but '^' must be commutative"
      res = res1 
      perl_expected = `perl -e 'print "#{x}"^"#{y}"'`
      assert_equal perl_expected, res, diff_bytes(perl_expected, res)
    end
  end


private

  def diff_bytes(r1, r2)
    res = <<-DIFF
Perl bytes: #{r1.bytes.to_a}
Ruby bytes: #{r2.bytes.to_a}
    DIFF
    res
  end

end
