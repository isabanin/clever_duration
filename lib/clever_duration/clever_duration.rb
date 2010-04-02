class CleverDuration
  
  attr_reader :input
  
  def initialize(input)
    @input = input
  end
  
  def hours
    minutes.to_f / 60
  end
  
  def minutes
    seconds.to_f / 60
  end
  
  def seconds
    if colon_format?
      regular_format_to_seconds
    else
      tokens_to_seconds
    end
  end
  
private

  def colon_format?
    !!(input =~ /[:\.]/)
  end
  
  def tokens
    input.scan(/(\d{1,3}) ?(hours?|hrs?|h|minutes?|mins?|m|seconds?|secs?|s)/i)
  end
  
  def regular_format_to_seconds
    hours, minutes = *input.scan(/(\d{0,2})[:\.](\d{0,2})/).flatten
    (hours.to_i * 60 * 60) + (minutes.to_i * 60)
  end

  def tokens_to_seconds
    seconds = 0
    tokens.each do |t|
      if t.last =~ /(hours?|hrs?|h)/i
        seconds += t.first.to_i * 60 * 60
      elsif t.last =~ /(minutes?|mins?|m)/i
        seconds += t.first.to_i * 60
      elsif t.last =~ /(seconds?|secs?|s)/i
        seconds += t.first.to_i
      end
    end
    seconds
  end
  
end