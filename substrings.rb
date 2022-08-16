#Copyright (c) 2022 Claudio Martínez Ortiz

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def curatext_to_array(text)

  #Replaces common irregular spanish characters with analog, downcase and split
  holder = text.gsub("á", "a").gsub("é", "e").gsub("í", "i").gsub("ó", "o").gsub(
  "ú", "u").gsub("Á", "A").gsub("É", "E").gsub("Í", "I").gsub("Ó", "O").gsub("Ú",
  "U").downcase.split(/[\s[^A-Za-zÑñ']]/)
  holder.delete("")

  #Support 's as a word
  holder.map! do |word|
  
    if word =~ /'/
      splitter = word.split(/'/)
      splitter[1] = "'s"
      splitter
    
    else word
    
    end

  end

  holder.flatten

end

def substrings(text, dictionary)

  #Curate text and store in an array
  array = curatext_to_array(text)
  
  #Reduce to accumulate elements as labels in a hash
  array.reduce(Hash.new(0)) do |hash, word|
    
    #Add when included
    dictionary.each { |entrance| hash[entrance] += 1 if word.include?(entrance) }
    hash

  end

end

input = "Howdy partner, sit down! How's it going?"
p hash = substrings(input, dictionary)