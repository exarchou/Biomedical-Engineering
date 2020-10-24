for i= 1:8
    
    str= sprintf('Data_Test_%d.mat',i);
    load(str);
    
    data1=data(1:10000);
    subplot(8,1,i)
    plot(data1)
    
    str = sprintf('Data %d',i);
    title(str);
    
    
end
