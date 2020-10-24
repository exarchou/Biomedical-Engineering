%% clear
clear all;
close all;
clc;


%% MasterCode
choice = 3;

while (choice ~= 0)
    
    disp(newline)
    disp('Exercise 1: Press 1.')
    disp('Exercise 2: Press 2.')
    disp('Exit Programm: Press 0.')
    disp(newline)
    prompt = 'Make a choice : ';
    choice = input(prompt);

    while ( choice ~= 1 && choice ~= 2 && choice ~= 0)
        prompt = 'Wrong input! Please try again : ';
        choice = input(prompt);
    end

    if choice == 1
    
        disp(newline)
        disp('#Question 1.1')
        disp(newline)
        question_1_1
        disp(newline)
        disp('Press any key to continue.')
        disp(newline)
        pause;

        disp('#Question 1.2')
        disp(newline)
        question_1_2
        disp(newline)
        disp('Press any key to make a new choice.')
        disp(newline)
        pause;
        
    elseif choice == 2
       
        disp(newline)
        disp('#Question 2.1.')
        disp(newline)
        question_2_1
        disp(newline)
        disp('Press any key to continue.')
        disp(newline)
        pause;
        
        disp('#Question 2.2')
        disp(newline)
        question_2_2
        disp(newline)
        disp('Press any key to continue.')
        disp(newline)
        pause;
        
        
        disp('#Question 2.3')
        disp(newline)        
        question_2_3
        disp('Press any key to continue.')
        disp(newline)
        pause;
        
        disp('#Question 2.4')
        disp(newline)
        question_2_4
        disp(newline)
        disp('Press any key to continue.')
        disp(newline)
        pause;
        
        
        disp('#Question 2.5')
        disp(newline)        
        question_2_5
        disp(newline)
        disp('Press any key to continue.')
        disp(newline)
        pause;
        
        
        disp('#Question 2.5 reloaded')
        disp(newline)        
        question_2_5_reloaded
        disp(newline)
        disp('Press any key to make a new choice')
        disp(newline)
        pause;
        

    end
    
end
        