%initialisation
maxft=zeros(4000,4);
maxarray=zeros(4000,4);

for k=1:4
    
    str=sprintf('Press any key to continue to Data_Eval_E_%d',k);
    disp(str)
    pause;
    
    hold off
    
    
    x=1;
    for i=1:spikes(k)
        
        if check(i,k)==1
            ft=abs(fft(SpikesEst(i,:,k)));
            maxft(x,k)=0;
            for j=1:64
                
                if ft(j)>maxft(x,k)
                    maxft(x,k)=ft(j);
                end
                
            end
            x=x+1;
        end
    end
 
    
    x=1;
    for i=1:spikes (k)
        if check(i,k)==1
            maxarray(x,k)= max_min_array2(i,1,k);
            x=x+1;
        end
    end


    %blue = 1
    %red  = 2
    %yellow = 3

    figure
    hold on
    y=1;
    for x =1:counter(k)
        

        while (spikeClassEst(y,k)==0)
            y=y+1;
        end
        
        if spikeClassEst(y,k)==1
            plot(maxft(x,k) , maxarray(x,k),'b.')
            
        elseif spikeClassEst(y,k)==2
            plot(maxft(x,k) , maxarray(x,k),'r.')
            
        else
            plot(maxft(x,k) , maxarray(x,k),'y.')
            
        end
            
        y=y+1;
        

    end
    xlabel('max amplitude of Fourier transform')
    ylabel('amplitude of spike')
    str=sprintf('Data Eval %d',k);
    title(str)
    
end

    