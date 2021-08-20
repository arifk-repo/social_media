str = "saya ingin belajar gigih dan giat".split(" ")
data = str.select{|food| food.match(/^#/)}
puts data.length