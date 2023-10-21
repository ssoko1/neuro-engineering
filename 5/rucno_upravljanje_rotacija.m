function rucno_upravljanje_rotacija(x,s)
slb=mod(s,256)
shb=floor(s/256)
CS=rem(sum([double('R'),double(';'),double(shb),double(slb),double(x)]),256)
komanda=['>','R',';',x,shb,slb,CS,'<']
povezivanje(komanda)
end