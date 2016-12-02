function trigarray = gettrigarray( frequency, arraylength)

    
    rangemat= 1:arraylength;
    
    alter= 2*pi*frequency*rangemat;
    
    
    sinf=sin(alter)';
    cosf=cos(alter)';
    sintwof=sin(alter*2)';
    costwof=cos(alter*2)';
    combfunc= [sinf cosf sintwof costwof];
    
    trigarray= combfunc;





end