function maska(x)
CS=rem(sum([double('V'),double('A'),double(';'),double(x)]),256)
komanda=['>','V','A',';',x,CS,'<']
povezivanje(komanda)
end