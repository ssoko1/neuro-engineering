function sirina_impulsa(n,w)

if w<50 || w>500
    msgbox('Sirina impulsa nije u adekvatnoj Granici.Sirina impulsa mora biti izmedju 50 i 500 mikrosekundi')
    return
end
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if w<=255
    wh=0;
    wl=w;

elseif w>256
    wh=1;
    wl=w-256;
end
komanda = ['>W',n,';',wh wl,'<'];
povezivanje(komanda)



end

