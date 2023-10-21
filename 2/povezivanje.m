function povezivanje(komanda)
s1=serial('COM2','BaudRate',500000)
fopen(s1);
fwrite(s1,komanda)
tic
while toc <3
    broj_bajta=s1.BytesAvailable;
    if broj_bajta~=0
        odgovor=fread(s1,s1.BytesAvailable)
        char(odgovor)
        break
    elseif broj_bajta==0
    end
end
if broj_bajta==0
    msgbox('Nema komunikacije')
end
fclose(s1)
delete(s1)
clear s1
end