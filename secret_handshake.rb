require 'pry'
class SecretHandshake
  HANDSHAKES = {1 => "wink", 10 => "double blink", 100 => "close your eyes", 1000 => "jump", 10000 => "reverse"}

  def initialize(int_or_str)
    @value = int_or_str
  end

  def commands
    @value.is_a?(String) ? string_command :  integer_command
  end

  def string_command
    counter = -1
    result = @value.reverse.chars.map do |string_number|
      counter += 1
      next if string_number.to_i.zero?
      HANDSHAKES[(string_number.to_i * 10**counter)]
    end.select { |element| element.class == String }

    if result.include?("reverse")
      result.pop
      result.reverse!
    end
    result
  end


  def integer_command
    counter = -1
    result = @value.to_s(2).reverse.chars.map do |string_number|
      counter += 1
      next if string_number.to_i.zero?
      HANDSHAKES[(string_number.to_i * 10**counter)]
    end.select { |element| element.class == String }

    if result.include?("reverse")
      result.pop
      result.reverse!
    end
    result

  end

end

handshake = SecretHandshake.new(31)
p handshake.commands