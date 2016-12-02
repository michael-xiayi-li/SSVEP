function trigarray = gettotaltrigarray( frequencies, arraylength)


    trigarray=[];
    
    for i=1:size(frequencies,1)
       trigarray=[trigarray gettrigarray(frequencies(i,:),arraylength)];
        
    end



end