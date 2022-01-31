rng('shuffle');
p = bern(5, 10, 0.5);

numSuccessA = 0;
numSuccessB = 0;
numSuccessC = 0;
numSuccessD = 0;
kA = 0;
kB = 0;
kC = 0;
kD = 0;

for L = 1:1:100000

    % CASE A
    if(kA == 5)
        numSuccessA = numSuccessA + 1;
    end
       
    kA = 0;    
    
    for i = 1:1:10
        diceA = DiceRoll(6);
        if(diceA == 2 || diceA == 4 || diceA ==6)
            kA = kA + 1;
        end
    end
    
    
    % CASE B
    if(kB == 0)
        numSuccessB = numSuccessB + 1;
    end  
    
    kB = 0;    
    
    for i = 1:1:9
        diceB = DiceRoll(6);
        if(diceB == 1 || diceB == 4)
            kB = kB + 1;
        end
    end
    
    % CASE C
    if(kC >= 9)
        numSuccessC = numSuccessC + 1;
    end
    
    kC = 0;
    
    for i = 1:1:35
        diceC = DiceRoll(6);
        if(diceC == 2 || diceC == 3 || diceC == 5)
            kC = kC + 1;
        end
    end
    
    % CASE D
    if(kD <= 2)
        numSuccessD = numSuccessD + 1;
    end
    
    kD = 0;
    
    for i = 1:1:9
        diceD = DiceRoll(6);
        if(diceD == 1)
            kD = kD + 1;
        end
    end
    
end

probA = numSuccessA / L;
probB = numSuccessB / L;
probC = numSuccessC / L;
probD = numSuccessD / L;

bprobA = bern(5,10,0.5);
bprobB = bern(0,9,2/6);
bprobC = 1 - bern(8,35,.5);
bprobD = bern(0, 9, 1/6) + bern(1, 9, 1/6) + bern(2, 9, 1/6);
