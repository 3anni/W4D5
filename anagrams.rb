

def first_anagram?(str1, str2)
  str1.split("").permutation.map {|perm| perm.join("")}.include?(str2)
end



# complexity is n! + n => O(n!)


def second_anagram?(str1, str2)
  return false unless str1.length ==  str2.length

  arr2 = str2.split("")

  str1.each_char do |char|
    idx = arr2.find_index(char)
    if idx.nil?
      return false
    else
      arr2.delete_at(idx)
    end
  end

  arr2.length == 0
end

# complexity is n * (n + n) => O(n^2)

def third_anagram?(str1, str2)
  str1.split("").sort.join("") == str2.split("").sort.join("")
end

# complexity is 2 * n log n => O(n log n)

def hash_chars(str)
  count = Hash.new(0)
  str.each_char { |char| count[char] += 1}
  count
end

def fourth_anagram?(str1, str2)
  hash_chars(str1) == hash_chars(str2)
end

def fourth_anagram_one_hash?(str1, str2)
  return false unless str1.length ==  str2.length

  count = Hash.new(0)

  str1.each_char { |char| count[char] += 1}
  str2.each_char { |char| count[char] -= 1}

  count.values.all? {|value| value == 0}
end


# complexity is 4 * n => O(n)


p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true
p first_anagram?("preslyech", "leyechprs")    #=> true
p first_anagram?("elvis", "lives")    #=> true



p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true
p second_anagram?("presleyelvis", "leylivespres")    #=> true
p second_anagram?("protxuxbxabcdefghijklmnopexrantial", "pxexrturabcdefghijklmnopbatixoxnal")    #=> true


p third_anagram?("protxuxbxexrantiabcdefghijklmnopal", "pxeabcdefghijklmnopxrturbatixoxnal")    #=> true

p third_anagram?("protxuxbxexrantial", "pxexrturatixoxnal")

p fourth_anagram?("protxuxbxexrantiabcdefghijklmnopal", "pxeabcdefghijklmnopxrturbatixoxnal")    #=> true

p fourth_anagram?("protxuxbxexrantial", "pxexrturatixoxnal")
