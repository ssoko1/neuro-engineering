function rezim_rada(x)
CS=rem(sum([double('E'),double(';'),double(x)]),256)
komanda=['>','E',';',x,CS,'<']
povezivanje(komanda)
end