function tbl=getstimcount(data)

stimNames=unique(nirs.getStimNames(data));

for i=1:length(data)
    for j=1:length(stimNames)
        st=data(i).stimulus(stimNames{j});
        if(~isempty(st))
            cnt(i,j)=length(st.onset);
        else
            cnt(i,j)=0;
        end
    end
    [~,rows{i}]=fileparts(data(i).description);
end


stimNames{end+1}='Total';
rows{end+1}='Total';
cnt(:,end+1)=sum(cnt,2);
cnt(end+1,:)=sum(cnt,1);

tbl=array2table(cnt,'VariableNames',stimNames,'RowNames',rows);


