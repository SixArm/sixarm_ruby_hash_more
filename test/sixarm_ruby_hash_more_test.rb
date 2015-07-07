# -*- coding: utf-8 -*-
require "minitest/autorun"
Minitest::Test ||= MiniTest::Unit::TestCase
require "simplecov"
SimpleCov.start
require "sixarm_ruby_hash_more"

describe HashMore do

  before do
    @h = HashMore.new
  end

  describe ".new" do

    it "is a blank hash" do
      @h.must_equal Hash.new
    end

  end

  describe "=" do

    it "=" do
      @h[:a][:b][:c] = 'hello'
      @h[:a][:b][:c].must_equal 'hello'
    end

  end

  describe "+" do

    it "+=" do
      @h[:a][:b][:c] += 3
      @h[:a][:b][:c].must_equal 3
      @h[:a][:b][:c] += 3
      @h[:a][:b][:c].must_equal 6
    end

  end

end
