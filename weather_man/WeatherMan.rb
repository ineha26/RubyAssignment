require 'csv'

# table = CSV.parse(File.read("Murree.txt"), headers: true)
# max = 0
# while i < table.length
#   str = Integer(table[i]["Max TemperatureC"])
#   puts "Index : #{i} -> #{str}"
#   if str != nil && str > max
#     max = i
#   end
#   i = i + 1
# end

# for i in 0..table.length-1
#   str = Integer(table[i]["Max TemperatureC"])
#   puts "Index : #{i} -> #{str}"
#   if str != nil && str > max
#     max = i
#   end
# end
#puts "Highest Temperature is #{table[max]["Max TemperatureC"]} on #{table[max]["PKT"]}"
# puts "The max index is #{max}."
# puts "Max Temperature #{table[max]["Max TemperatureC"]}"

# all_text_files = Dir.glob "*.txt"
# puts all_text_files

def weatherByYear(year)
  list = {}
  Dir.glob("**/Murree_weather_"+year.to_s+"_*.txt") do |filename|
    puts filename
    table = CSV.parse(File.read(filename), headers: true)
    max = 0
    strMax=0
    strMin=0
    min = 0
    i = 0
    while i < table.length
      if table[i]["Max TemperatureC"] != nil
        strMax = Integer(table[i]["Max TemperatureC"])
      end
      # puts "At #{i} strMax is : #{strMax}"
      if table[i]["Min TemperatureC"] != nil
        strMin = Integer(table[i]["Min TemperatureC"])
      end

      if strMax != nil && strMax > Integer(table[max]["Max TemperatureC"])
        max = i
      end

      if strMin != nil && strMin < Integer(table[min]["Min TemperatureC"])
        min = i
      end
      i = i + 1
    end
    puts "Max: #{table[max]["Max TemperatureC"]}, Min: #{table[min]["Min TemperatureC"]}"
    if list.empty?
      list["Max Temperature"] = table[max]["Max TemperatureC"]
      list["Min Temperature"] = table[min]["Min TemperatureC"]
    else
      if Integer(table[max]["Max TemperatureC"]) > Integer(list["Max Temperature"])
        list["Max Temperature"] = table[max]["Max TemperatureC"]
      end
      if Integer(table[min]["Min TemperatureC"]) < Integer(list["Min Temperature"])
        list["Min Temperature"] = table[min]["Min TemperatureC"]
      end
    end
    list["Max Temperature on"] = table[max]["PKT"]
    list["Min Temperature on"] = table[min]["PKT"]
  end
  puts list
end

weatherByYear(2005)
