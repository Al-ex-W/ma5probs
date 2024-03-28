def askfornum
    puts "tal i bas 10?"
    inputnum = gets.chomp.to_i
    puts "Vilken bas ska det bli?"
    desiredbase = gets.chomp.to_i
    #puts "vilken bas var det? svara med ett nummer"
    #inputbase = gets.chomp.to_i
end




def getvalue(num)
    numarr = [0,1,2,3,4,5,6,7,8,9,"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    if numarr[num].type == string

