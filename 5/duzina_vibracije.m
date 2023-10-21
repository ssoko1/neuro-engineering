function duzina_vibracije(x1,x2)
CS=rem(sum([double('V'),double('D'),double(';'),double(x1),double(x2)]),256)
komanda=['>','V','D',';',x1,x2,CS,'<']
povezivanje(komanda)
end