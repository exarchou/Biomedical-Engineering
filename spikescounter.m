
function SpikesVsK = spikescounter(data)

    T = 0;
    myspikes = 0;
    flag = 0;
    SpikesVsK = zeros(10000,2);
    Sn = median(abs(data))/0.6745;

    for i = 1:10000
        T = T + 0.0002;
    
        for j=1:1440000
            if data(j) >= T && flag == 0
                myspikes = myspikes+1;
                flag=1;
            end
            
            if data(j)<T
                flag=0;
            end
        end
    
        SpikesVsK(i,1) = myspikes;
    
        k = T / Sn;
        SpikesVsK(i,2) = k;

        myspikes = 0;
        flag = 0;

    end
    

end

