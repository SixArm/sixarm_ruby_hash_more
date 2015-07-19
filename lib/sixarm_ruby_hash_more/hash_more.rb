# -*- coding: utf-8 -*-
=begin rdoc
HashMore is a recursive hash.
=end

class HashMore < Hash

  def initialize
    super{|h,k| h[k] = HashMore.new }
  end

  def +(x)
    x
  end

end
