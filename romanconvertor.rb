def fromRoman(romanNumber)
    values = {
        "M" => 1000,
        "D" => 500,
        "C" => 100,
        "L" => 50,
        "X" => 10,
        "V" => 5,
        "I" => 1
    }
    total = 0
    romanNumber.each_char {|c|
      unless values.keys.include? c
        raise TypeError
      end
    }
    for i in 0..romanNumber.length - 1
      if i > 0 and values[romanNumber[i]] > values[romanNumber[i - 1]]
        total += values[romanNumber[i]] - 2 * values[romanNumber[i - 1]]
      else
        total += values[romanNumber[i]]
      end
    end
    total
  end

  
  def toRoman(arabicNumber)
    values = {
        1000 => "M",
        900 => "CM",
        500 => "D",
        400 => "CD",
        100 => "C",
        90 => "XC",
        50 => "L",
        40 => "XL",
        10 => "X",
        9 => "IX",
        5 => "V",
        4 => "IV",
        1 => "I"
  
    }
    if arabicNumber > 3999 or arabicNumber < 1
      raise RangeError
    end
    roman_num = ""
    i = 0
    while arabicNumber > 0
        quotient = arabicNumber.div values.keys[i]
        quotient.times do |_|
            roman_num += values.values[i]
            arabicNumber -= values.keys[i]
        end
        i += 1
    end
    roman_num
  end