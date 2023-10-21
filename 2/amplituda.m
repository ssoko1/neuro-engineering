function amplituda(n,c)
if c >= 0 & c <= 50
    komanda=['>','C',n,';',c,'<']
    povezivanje(komanda)
else
    msgbox('Amplituda nije u korektnoj granici. Amplituda mora biti od 0 do 50 mA')
    return
end
end