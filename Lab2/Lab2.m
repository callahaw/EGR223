%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title: Lab #2 - Writing MATLAB Functions and Bernoulli Trials
% Filename: Lab2.m
% Author: Wade Callahan
% Course: EGR223 - 03
% Date: 1.31.2022
% Assignment: Lab 2
% Instructor: Prof. Baine
% Description: This script file utilizes a set of nested for loops that
% call a dice rolling functions to generate a large sample size of
% statistical experiments. Four experiments were conducted and the
% emipracal probility of each event was calculated. The theoretical
% bernouli probailty was also called for each, and the percent difference
% was calculated.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rng('shuffle');

% variables declarations
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
    % increment success counter if exactly 5 rolls are even
    if(kA == 5)
        numSuccessA = numSuccessA + 1;
    end
       
    kA = 0;    
    
    % 10 trials, increments kA if roll is even
    for i = 1:1:10
        diceA = DiceRoll(6);
        if(diceA == 2 || diceA == 4 || diceA ==6)
            kA = kA + 1;
        end
    end
    
    % CASE B
    % increment success counter if 0 rolls are 1 or 4
    if(kB == 0)
        numSuccessB = numSuccessB + 1;
    end  
    
    kB = 0;    
    
    % 9 trials, increment kB if any rolls are 1 or 4
    for i = 1:1:9
        diceB = DiceRoll(6);
        if(diceB == 1 || diceB == 4)
            kB = kB + 1;
        end
    end
    
    % CASE C
    % increment success counter if 9 or more numbers are prime
    if(kC >= 9)
        numSuccessC = numSuccessC + 1;
    end
    
    kC = 0;
    
    % 35 trials, increments kC if roll is prime
    for i = 1:1:35
        diceC = DiceRoll(6);
        if(diceC == 2 || diceC == 3 || diceC == 5)
            kC = kC + 1;
        end
    end
    
    % CASE D
    % increment success counter if 2 or less rolls are 1's
    if(kD <= 2)
        numSuccessD = numSuccessD + 1;
    end
    
    kD = 0;
    
    % 9 trials, increments kD if roll is 1
    for i = 1:1:9
        diceD = DiceRoll(6);
        if(diceD == 1)
            kD = kD + 1;
        end
    end
end

% Calculate the empiracal results
probA = numSuccessA / L;
probB = numSuccessB / L;
probC = numSuccessC / L;
probD = numSuccessD / L;

% Calculate the theoretical results
bprobA = bern(5,10,0.5);
bprobB = bern(9,9,4/6);
bprobC = 1 - (bern(8,35,.5) + bern(7,35,.5) + bern(6,35,.5) + bern(5,35,.5) + bern(4,35,.5) + bern(3,35,.5) + bern(2,35,.5) + bern(1,35,.5) + bern(0,35,.5));
bprobD = bern(0, 9, 1/6) + bern(1, 9, 1/6) + bern(2, 9, 1/6);

% Calculate percent difference
diffA = abs(probA - bprobA)/((probA + bprobA) / 2) * 100;
diffB = abs(probB - bprobB)/((probB + bprobB) / 2) * 100;
diffC = abs(probC - bprobC)/((probC + bprobC) / 2) * 100;
diffD = abs(probD - bprobD)/((probD + bprobD) / 2) * 100;

% Print out all results
disp("Case A Empirical Result: " + probA);
disp("Case A Theoretical Result: " + bprobA);
disp("Case A Percent Difference: " + diffA);
disp("Case B Empirical Result: " + probB);
disp("Case B Theoretical Result: " + bprobB);
disp("Case B Percent Difference: " + diffB);
disp("Case C Empirical Result: " + probC);
disp("Case C Theoretical Result: " + bprobC);
disp("Case C Percent Difference: " + diffC);
disp("Case D Empirical Result: " + probD);
disp("Case D Theoretical Result: " + bprobD);
disp("Case D Percent Difference: " + diffD);







