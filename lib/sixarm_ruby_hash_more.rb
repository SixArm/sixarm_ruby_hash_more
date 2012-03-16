# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end


class HashMore < Hash

  def initialize
    super{|h,k| h[k] = HashMore.new }
  end

  def +(x)
    x
  end

end
