%initialisation
spikeClassEst=zeros(4000,4);
realsize=zeros(1,4);
check=zeros(4000,4);
counter=zeros(1,4);
counterclass=zeros(1,4);

for k=1:4
    
    str= sprintf('Data_Eval_E_%d.mat',k);
    load(str);
    
    realsize(k)=size(spikeClass,2);

    for i=1:realsize(k)
        spikeClassEst(i,k)=spikeClass(i);
    end

    x=1;
    y=1;

    while(x <= spikes(k))
    
        if spikeTimesEst(x,k)>spikeTimes(y)
            if spikeTimesEst(x,k)-spikeTimes(y)<=40
                
                check(x,k)=1;
                x=x+1;
                y=y+1;
            
            else
            
                spikeClassEst(y,k)=0;
                y=y+1;
                
            end
            
        else
            check(x,k)=0;
            x=x+1;
        end
    end
    

    for i=1:spikes(k)
        if check(i,k)==1
            counter(k)=counter(k)+1;
        end
    end



    for i=1:realsize(k)
        if spikeClassEst(i,k)==0
            counterclass(k)=counterclass(k)+1;
        end
    end
    
end
