function frekvencija(n,f)
if f >= 1 & f <= 50
    komanda=['>','F',n,';',f,'<']
    povezivanje(komanda)
else
    msgbox('Frekvencija nije u korektnoj granici. Frekvencija mora biti od 1 do 50 Hz')
    return
end
end