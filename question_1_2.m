

for i= 1:8
    
    str=sprintf('Press any key to continue to Data_Test_%d',i);
    disp(str)
    pause;
    
    hold off
    
    str= sprintf('Data_Test_%d.mat',i);
    load(str);
    
    table=spikescounter(data);
    
    figure
    plot(table(:,2),table(:,1))
    
    str=sprintf('Data %d',i);
    title(str);
    xlabel('k');
    ylabel('spikes');
   
    
    
    
end