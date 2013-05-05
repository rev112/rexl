#!/usr/bin/env ruby
# -*- encoding : utf-8 -*- 

class String
  def ^(s)
    b1 = self.bytes.to_a
    b2 = s.bytes.to_a
    maxn = [b1.size, b2.size].max
    b1.push(*([0] * (maxn - b1.size)))
    b2.push(*([0] * (maxn - b2.size)))
    res = b1.zip(b2).map { |x, y| (x ^ y).chr }
    res.join.force_encoding('UTF-8')
  end
end

