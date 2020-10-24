%initialisation
firstcut=zeros(4000,64,4);
max_min_array = zeros(4000,4,4); 
max_min_array2 = zeros(4000,4,4); 
firstpoint = zeros(4000,4); 
SpikesEst=zeros(4000,64,4);

for k=1:4
    
    str=sprintf('Press any key to continue to Data_Eval_E_%d',k);
    disp(str)
    pause;
    
    hold off
    
    str= sprintf('Data_Eval_E_%d.mat',k);
    load(str);
    
    %arxiko kopsimo gurw apo to shmeio pou pernaei to threshold
    for i=1:spikes(k)
        for j=1:64
            firstcut(i,j,k)=data(spikeTimesEst(i,k)-32+j);
        end
    end
    
    %evresi min kai max ka8e para8urou
    max=0;
    min=0;  
    for i = 1:spikes(k)
        for  j = 1:64
            if  firstcut(i,j,k) > max
                max= firstcut(i,j,k);
                max_min_array(i,1,k) = max;
                max_min_array(i,2,k) = j;
            end
            if firstcut(i,j,k) < min
                min= firstcut(i,j,k);
                max_min_array(i,3,k) = min;
                max_min_array(i,4,k) = j;
            end
 
        end
        max = 0;
        min = 0;          
    end
 
    %evresh xronou prwtou akrotatou 
    for i=1:spikes(k)
        if max_min_array(i,2,k) < max_min_array(i,4,k)
            firstpoint(i,k)= max_min_array(i,2,k);
        end
        if max_min_array(i,2,k) > max_min_array(i,4,k)
            firstpoint(i,k)=max_min_array(i,4,k);
        end    
    end
    
    %telikh stoixish gurw apo proto akrotato
    for i=1:spikes(k)
        for j=1:64
            SpikesEst(i,j,k)=data(spikeTimesEst(i,k)+j-64+firstpoint(i,k));
        end
    end
    
    %elegxos 
    max=0;
    min=0;  
    for i = 1:spikes(k)
        for  j = 1:64
            if  SpikesEst(i,j,k) > max
                max= SpikesEst(i,j,k);
                max_min_array2(i,1,k) = max;
                max_min_array2(i,2,k) = j;
            end
            if SpikesEst(i,j,k) < min
                min= SpikesEst(i,j,k);
                max_min_array2(i,3,k) = min;
                max_min_array2(i,4,k) = j;
            end
 
        end
        max = 0;
        min = 0;          
    end
    
    %plot
    hold on
    figure
    for i=1:spikes(k)
        plot(SpikesEst(i,:,k))
        hold on
    end
    str = sprintf('Data %d',k);
    title(str)
    
    
    
end







