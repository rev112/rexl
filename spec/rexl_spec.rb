require_relative '../lib/rexl'

describe String, '#^' do

  TEST_STRINGS = [ 
    ['as', '  3'],
    ['123', '234'],
    ['asdfasdf', 'zsd'],
    ['asd', 'zsasdfasdfd'],
    ['мяу', 'zsasdfasdfd'],   
    ['гоги дома?', 'мяу'],
  ]

  it 'should return a String object' do
    TEST_STRINGS.each do |x, y|
      expect(x.to_s ^ y.to_s).to be_kind_of(String)
    end
  end

  it 'should be a commutative operation' do
    TEST_STRINGS.each do |x, y|
      x = x.to_s
      y = y.to_s
      expect(x^y).to eq(y^x) 
    end
  end

  it 'should give the same result as "^" from Perl' do
    TEST_STRINGS.each do |x, y|
      result = x.to_s ^ y.to_s
      perl_result = `perl -e 'print "#{x}"^"#{y}"'`
      expect(perl_result).to eq(result)
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
