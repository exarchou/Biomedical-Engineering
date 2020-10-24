Data=zeros(4000,6,4);
group=zeros(4000,4);
percentage_reloaded=zeros(1,4);

for k=1:4


    j=1;
    for i=1:counter(k)
    
        while (check(j,k)==0)
            j=j+1;
        end
    
        Data(i,1,k)=max_min_array(j,2,k); % max time
        Data(i,2,k)=max_min_array(j,4,k); % min time
        Data(i,3,k)=abs(max_min_array(j,3,k));  % minimum
        Data(i,4,k)=abs(max_min_array(j,2,k)-32); % time between threshold and max
        Data(i,5,k) =abs( maxft(i,k));
        Data(i,6,k) = abs(maxarray(i,k));
        
        c1=0;
        c2=0;
        c3=0;
        if Data(i,1,k) < Data(i,2,k) % first we use max
        
            c3=c3+1;
        
        else
            if Data(i,3,k)>0.42 && Data(i,4,k)<=2
                c2=c2+1;
            else
                c1=c1+1;
            end
        end
        
        if Data(i,6,k) < 1
            if Data(i,5,k) <7.1
                c2=c2+1;
                
            elseif Data(i,5,k) <8.7
                c3=c3+1;
            else
                c1=c1+1;
            end
        else
            if Data(i,5,k) <7.8
                c2=c2+1;
                
            elseif Data(i,5,k) <9.8
                c3=c3+1;
            else
                c1=c1+1;
            end      
        end
        
        
        if c1>=c2
            
            if c1>=c3
                
                group(i,k)=1;
            else
                group(i,k)=3;
            end
            
        else
            
            if c2>=c3
                
                group(i,k)=2;
            else
                group(i,k)=3;
            end
            
        end
            
        
        
        
        
        j=j+1;
    end
    
    percentage_reloaded(k) = MyClassify(Data(:,:,k),group(:,k));
   
end

disp('Percentage of success for each Data_Eval_E when I use more characteristics :')
disp(newline)
disp(percentage_reloaded)



