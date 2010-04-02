require 'helper'

class CleverDurationTest < Test::Unit::TestCase
  context "Duration" do
    should "translate hours" do
      assert_equal 1, duration("1h").hours
      assert_equal 4, duration("4 h").hours
      
      assert_equal 6, duration("6hours").hours
      assert_equal 3, duration("3 hours").hours
      
      assert_equal 8, duration("8hrs").hours
      assert_equal 8, duration("8 hrs").hours
    end
    
    should "translate minutes" do
      assert_equal 10, duration("10m").minutes
      assert_equal 10, duration("10 m").minutes
      
      assert_equal 54, duration("54 minutes").minutes
      assert_equal 54, duration("54minutes").minutes
      
      assert_equal 22, duration("22min").minutes
      assert_equal 22, duration("22 min").minutes
      
      assert_equal 52, duration("52mins").minutes
      assert_equal 52, duration("52 mins").minutes
    end
    
    should "translate seconds" do
      assert_equal 10, duration("10s").seconds
      assert_equal 40, duration("40 s").seconds
      
      assert_equal 50, duration("50sec").seconds
      assert_equal 50, duration("50 sec").seconds
      
      assert_equal 140, duration("140seconds").seconds
      assert_equal 140, duration("140 seconds").seconds
      
      assert_equal 78, duration("78secs").seconds
      assert_equal 78, duration("78 secs").seconds
    end
    
    should "translate colon" do
      assert_equal 3, duration("3:00").hours
      assert_equal 4, duration("04:00").hours
      assert_equal 30, duration("0:30").minutes
      assert_equal 2.5, duration("2:30").hours
      assert_equal 10, duration(":10").minutes
    end
    
    should "translate dot" do
      assert_equal 3, duration("3.00").hours
      assert_equal 4, duration("04.00").hours
      assert_equal 30, duration("0.30").minutes
      assert_equal 2.5, duration("2.30").hours
      assert_equal 10, duration(".10").minutes
    end
    
    should "translate compounds" do
      assert_equal 1.5, duration("1 hour 30 minutes").hours
      assert_equal 5.75, duration("5h45m").hours
      assert_equal 1, duration("59 mins 60s").hours
      assert_equal 1850, duration("30m 50s").seconds
    end
  end
  
private

  def duration(str)
    CleverDuration.new(str)
  end
end