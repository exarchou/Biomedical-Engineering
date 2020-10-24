Data=zeros(4000,4,4);
group=zeros(4000,4);
percentage=zeros(1,4);

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
    
        if Data(i,1,k) < Data(i,2,k) % first we use max
        
            group(i,k)=3;
        
        else
            if Data(i,3,k)>0.42 && Data(i,4,k)<=2
                group(i,k)=2;
            else
                group(i,k)=1;
            end
        end
            
        j=j+1;
    end
    
    percentage(k) = MyClassify(Data(:,:,k),group(:,k));
   
end

disp('Percentage of success for eaca Data_Eval_E : ')
disp(newline)
disp(percentage)




