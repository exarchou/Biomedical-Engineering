%initialisation
spikeTimesEst = zeros(4000,4);
spikes = zeros(1,4);
T = zeros(1,4);

for z=1:4
    
    str= sprintf('Data_Eval_E_%d.mat',z);
    load(str);
    table=spikescounter(data);
    
    figure
    plot(table(:,2),table(:,1))
    xlabel('k')
    ylabel('spikes')
    str=sprintf('Data Eval %d',z);
    title(str)
    disp(newline)
    str= sprintf('You are in Data_Eval_E_%d ',z);
    disp(str)
    prompt = 'Enter the approximate number for spikes: ';
    spikes(z) = input(prompt);
    prompt = 'Enter the approximate number for k: ';
    k = input(prompt);

    Sn=median(abs(data))/0.6745;
    T(z)=k*Sn;
    i=1;
    flag =0; 

    for j= 1:1440000 
    
        if data(j) >= T(z) && flag == 0
            spikeTimesEst(i,z) = j;
            flag = 1;
            i=i+1;
        end 
     
        if data(j) < T(z)
            flag = 0;
        end
     
    end
    
end
    