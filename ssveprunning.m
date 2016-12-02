function running = ssveprunning(edffile,frequencies,letters,filename)
    
timestamp = cputime;
 startstamp=cputime;
 startmarker=1;

 
 while true
 %while timestamp-startstamp<10
     
     if (cputime-timestamp >= 2)
         [hdr,record]=edfreadUntilDone(edffile);
         [read,letterfreq]= ssvepsimple(record,frequencies,startmarker);
         startmarker=size(record,2)+1;
         letterfreq
         save('read','read');
         if (~isnan(letterfreq))
             
             
             printedletter=letters{letterfreq};
             
             fid=fopen(filename,'a');
             printedletter
             fprintf(fid,printedletter);
             fclose(fid);
         end
          timestamp=cputime;
     end
 end

end