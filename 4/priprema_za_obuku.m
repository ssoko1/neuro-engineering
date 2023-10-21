function[vektor_obelezja,klase_obuka]=priprema_za_obuku(C3,C4,klase)
Fs=160
poceci=[];
krajevi=[];

for i=1:length(klase)-1
	if klase(i)==0 && klase(i+1)~=0
		poceci=[poceci i+1];
	elseif (klase(i)==1||klase(i)==2) && klase(i+1)==0
		krajevi=[krajevi i];
	end 
end

posljednji = length(klase);
krajevi=[krajevi posljednji];

klase_obuka=[]; 
alfa3=[];
beta3=[];
alfa4=[];
beta4=[];


for i=1:length(poceci)
    pocetak=poceci(i);
    kraj=krajevi(i);
    
    prC3= C3(pocetak:kraj); 
    prC4= C4(pocetak:kraj); 
    
    [pxx3,F] = periodogram(prC3,[],[],Fs);
    
    alfa = F>=8 & F<=13;
    beta = F>=13 & F<=30;
    alfa3= [alfa3 mean(pxx3(alfa))];
    beta3= [beta3 mean(pxx3(beta))];
    
    pxx4 = periodogram(prC4,[],[],Fs);
    alfa4= [alfa4 mean(pxx4(alfa))];
    beta4= [beta4 mean(pxx4(beta))];
    
   
    prozor_klase= klase(pocetak:kraj); 
    klase_obuka=[klase_obuka unique(prozor_klase)];
    
end
vektor_obelezja=[alfa3;beta3;alfa4;beta4]; 
end