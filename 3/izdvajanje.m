function[obelezja]=izdvajanje(akt)
l=length(akt);
fs=160;
[pxx,F]=periodogram(akt,[],l,fs);
indexi = F>=8 & F<=13;
snagaAlfa=pxx(indexi);
alfaMean=mean(snagaAlfa);

indexiBeta= F>13 & F<=30;
snagaBeta=pxx(indexiBeta);
betaMean=mean(snagaBeta);


obelezja=[alfaMean betaMean];   

end