
# en array med tecken för siffror och bokstäver för tal i baser upp till 36
$numarr = ["0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
$inputarr = [] 
$numsum = 0.0
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

def getvalue(num, base) # översätter tal från vilken bas som helst till 10 bas

    numtest = num.split(".", 2) #är det ett decimaltal?
    if numtest.length == 2
        amount_of_decimals = numtest[1].length #om ja, antal decimaler sätts till antal decimaler
        num = num.delete(".")
    else
        amount_of_decimals = 0 #om nej, inga decimaler
    end

    splittednum = num.chars.reverse # Delar upp talet i dess siffror och vänder på den, så att första talet i arrayen är "entalet" -> 1AB44 -> ["4","4","B","A","1"]
    splittednum.each do |currentnum| # för varje värde i arrayen ska den:
        $inputarr << $numarr.index(currentnum) #konkatenera en array, där alla tecken blir till riktiga värden -> ["4","4","B","A","1"] -> ["4","4","11","10","1"]
    end

    # nu är $inputarr en array, varje värde i den ska nu översättas och slås ihop till ett tal med tiobas.

    i = (0-amount_of_decimals) # Startvärde för exponenten, ökar för varje nytt värde från $inputarr, hänvisa till pappret del 1.
    $inputarr.each do |currentnum| # varje värde i inputarr ska ny översättas till sitt tiobas värde
        $numsum += (currentnum.to_i * (base ** i)) # Räknar ut talets värde i bas 10 och sedan adderar det på det slutliga talet ($numsum) i bas 10, genom att ta 10 upphöjt med i, som är den exponenten som nuvarande värdet ska ha, vilket var därför vi reversade, så att lägsta tallet kommer först och har exponenten 0.
        i += 1 # Ökar exponenten för varje värde
    end
end

def translatevalue(newbase) # Översätter tal i tiobas till vad som helst

    numtest = $numsum.to_s.split(".", 2) #är det ett decimaltal?
    if numtest.length == 2
        $numsum = numtest[0].to_i
        all_decimals = numtest[1].to_i
    end

    #HELTAL!!!

    while ($numsum / newbase) >= 1 # kollar om $numsum går att representera med (ytterligare) 1 tecken från den nya basen, om den behöver fler, ska den köra loopen, hänvisa till pappret del 2.
       $newvalue += $numarr[($numsum % newbase)] # konkatenerar $newvalue (talet i den nya basen) med resten som blir när talet i tiobas delas med den nya basen, hänvisa till papper del 2. 
       $numsum = $numsum / newbase # delar numsum med basen för att sedan fortsätta på nästa tal i den nya basen, hänvisa till papper del 2
    end
    $newvalue += $numarr[($numsum % newbase)] # Hanterar sista värdet, körs ej i loopen
    $newvalue.reverse! # Vänder talet så att den högsta positionen kommer först

    #DECIMALER??
    
    if all_decimals != 0 #Har talet decimaler?
        all_decimals = ("0." + "#{all_decimals}").to_f # gör om decimalerna till riktiga decimaler i float. -> 0.B6U
        i=0 # i håller räkningen på antal loopningnar här nere
        newdecimals = "" 
        while all_decimals != 0 && i < 6 #om det finns decimaler kvar att beräkna eller om den har loopat mindre än 6 gånger så körs loopen
            newdecimals << $numarr[((all_decimals * newbase).to_i)] # multiplicerar (de återstående) decimelerna. Heltalet som blir som resultat är decimalens värde. Tecknet för detta värde hämtas ur $numarr, se papper del 3.
            all_decimals = all_decimals * newbase - ((all_decimals * newbase).to_i) # sätter all_decimals till det återstående värdet på decimaltalen, som måste visas med ännu mindre decimaler, se papper del 3
            i+=1
        end
        $newvalue << ".#{newdecimals}"
    end
    return $newvalue
end

askfornum # Startar programmet