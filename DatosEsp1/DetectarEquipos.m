temp='0304%0405%0506%0607%0708%0809%0910%1011%1112%1213';
r=regexp(temp,'%','split');
e=cell(20);
for i=1:10
    s=strcat('SP',r(i),'.xlsx');
    s=char(s);
    
    [n,t,x]=xlsread(s);
    
    a=1;
    for j=1:10
        for k=3:4
            e2=t(j+1,k);
            esp=find(char(e2)==' ');
            e3=char(e2);
            if size(esp,2)>0

                for l=1:size(esp,2)
                    
                r2=[e3(1:esp(l)-1),e3(esp(l)+1:end)];
                end
            e3=r2;    
            end
%             r2=regexp(e2,' ','split');
%             if size(r2)>1
%             r3=char(r2(1));
%                 for rrr=2:size(r2)
%                 r3=[r3,char(r2(rrr))];
%                 r2=r3;
%             end
%             end
            e(a)={e3};
            a=a+1;
        end
    end
    fid = fopen(char(strcat('Equipos',r(i),'.txt')), 'wt');
    for aux=1:19
    fprintf(fid, '%s\n', e{aux});
    end
    fprintf(fid, '%s', e{aux+1});
    fclose(fid);

end
