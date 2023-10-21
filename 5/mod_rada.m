function mod_rada(x)
CS=rem(sum([double('W'),double(';'),double(x)]),256)
komanda=['>','W',';',x,CS,'<']
povezivanje(komanda)
end