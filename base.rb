$numarr = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
$inputarr = []
$numsum = 0
$newvalue= ""
def askfornum
    puts "tal?"
    inputnum = gets.chomp
    puts "vilken bas va det?"
    inputbase = gets.chomp.to_i
    puts "Vilken bas ska det bli?"
    desiredbase = gets.chomp.to_i
    getvalue(inputnum,inputbase)
    p "Ditt nya värde är: #{translatevalue(desiredbase)}"
end

def getvalue(num, base)
    splittednum = num.chars.reverse
    splittednum.each do |currentnum|
        $inputarr << $numarr.index(currentnum)
    end
    i=0
    $inputarr.each do |currentnum|
        $numsum += (currentnum.to_i * (base ** i))
        i += 1
    end
end

def translatevalue(newbase)
    while ($numsum / newbase) >= 1
       $newvalue += $numarr[($numsum % newbase)]
       $numsum = $numsum / newbase
    end
    $newvalue += $numarr[($numsum % newbase)]
    $newvalue.reverse!
end

askfornum
