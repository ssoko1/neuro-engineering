function rucno_upravljanje_opozicija(x,s)
slb=mod(s,256)
shb=floor(s/256)
CS=rem(sum([double('O'),double(';'),double(shb),double(slb),double(x)]),256)
komanda=['>','O',';',x,shb,slb,CS,'<']
povezivanje(komanda)
end