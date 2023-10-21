function jacina_vibracije(x1,x2)
CS=rem(sum([double('V'),double('I'),double(';'),double(x1),double(x2)]),256)
komanda=['>','V','I',';',x1,x2,CS,'<']
povezivanje(komanda)
end