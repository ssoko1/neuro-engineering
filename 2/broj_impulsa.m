function broj_impulsa(n,p)

if p<0 || p>10000
        msgbox('Broj impulsa nije u adekvatnoj Granici.Broj impulsa mora biti izmedju 0 i 10000')
    return
end



if p<=255
    ph=0;
    pl=p;
elseif p>256
    ph=floor(p/256); 
    pl=mod(p,256); 
end
komanda = ['>N',n,';',ph pl,'<']
povezivanje(komanda)




end