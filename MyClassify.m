function Acc = MyClassify(Data,group)
group=categorical(group);
idx=randperm(size(Data,1),floor(size(Data,1)*0.7));
train=Data(idx,:);
trGroup=group(idx);
test=Data; test(idx,:)=[];
teGroup=group; teGroup(idx)=[];
class = classify(test,train,trGroup);
Acc=(sum(class==teGroup)/numel(teGroup))*100;
end

