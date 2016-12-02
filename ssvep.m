function [correlations,letters]= ssvep(record,frequencies,startmarker)
    letters=NaN;
%look into IEEG.java for file control


%try changing:
%
%frequencies
%layout
%summing the correlations
    threshold = .3;
            %parse record
            %size(record)
            record=record';
            %size(record)
            record=record(startmarker:end,:);
            %size(record)
            electroderecord=record(:,8:11);
            rowsize=floor(size(record,1)/6);
            recordcell=mat2cell(electroderecord, [rowsize,rowsize,rowsize,rowsize,rowsize,rowsize+mod(size(record,1),6)],[4]);
            %[hdr,record,r]=canoncorr(,commands);
            correlations={};
            for i=1: size(recordcell,1)
                %loop through each partition
                timelength=size(recordcell{i},1);
                size(gettotaltrigarray(frequencies,timelength));
                partitioncorrelations=[];
                for j=1:size(frequencies,1) %loop through each frequency
                  %.5 not a valid frequency  
                %a=gettrigarray(frequencies(j,:),timelength)
                %rank(a)
                [w1,w2,r]=canoncorr(recordcell{i},gettrigarray(frequencies(j,:),timelength));
                r
                partitioncorrelations=[partitioncorrelations; r];
                end
                %correlations
                correlations{i}=partitioncorrelations;
                [m,index]=max(max(partitioncorrelations,[],2));
                %index shows the row of the command
            end
            %calculate c and p averages here
            commandrows=[];
            read=correlations;
            for i=1:size(correlations,2)
                [m,index]=max(max(correlations{i},[],2));
                commandrows=[commandrows; index ]; 
            end
            
            maxp=0;
            for i=2:size(correlations,2)
               if (commandrows(i-1,:)==commandrows(i,:))
                   sinarray=[];
                   cosarray=[];
                   sintwoarray=[];
                   costwoarray=[];
                   for j=1:size(correlations,2)
                       sinarray=[sinarray; correlations{j}(commandrows(i,:),1)];
                       cosarray=[cosarray; correlations{j}(commandrows(i,:),2)]; 
                       sintwoarray=[sintwoarray; correlations{j}(commandrows(i,:),3)];
                       costwoarray=[costwoarray; correlations{j}(commandrows(i,:),4)];
                          
                   end
                    %calculate the average here
                    commandrows(i,:)
                    mean(sinarray)
                    save('sinarray','sinarray');
                    save('cosarray','cosarray');
                    mean(cosarray)
                    mean(sintwoarray)
                    mean(costwoarray)
                   %if (mean(sinarray) > threshold || mean(cosarray >threshold) || mean(sintwoarray)>threshold || mean(costwoarray >threshold))
                   totalmean=mean(mean([sinarray cosarray sintwoarray costwoarray])) 
                   if (mean(mean([sinarray cosarray sintwoarray costwoarray]))>threshold)   
                       maxp
                       mean(sinarray)>maxp
                       mean(cosarray)>maxp
                       %if(mean(sinarray)>maxp || mean(cosarray) >maxp || mean(sintwoarray)>maxp || mean(costwoarray)>maxp)%new
                       if (mean(mean([sinarray cosarray sintwoarray costwoarray]))>maxp)
                         'yes'
                         letters=commandrows(i,:);
                         %maxp=max([mean(cosarray) mean(sinarray) mean(costwoarray) mean(sintwoarray)]);%new
                         maxp=mean(mean([sinarray cosarray sintwoarray costwoarray]));
                       end
              %     else
              %         letters=NaN;
                  end 
                   
                   
               %else
               %    letters=NaN;
               end
               
               
            end
    end





    





