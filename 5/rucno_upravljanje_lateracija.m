function rucno_upravljanje_lateracija(x,s)
slb=mod(s,256)
shb=floor(s/256)
CS=rem(sum([double('L'),double(';'),double(shb),double(slb),double(x)]),256)
komanda=['>','L',';',x,shb,slb,CS,'<']
povezivanje(komanda)
end