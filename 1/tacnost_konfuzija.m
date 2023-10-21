function [matrica_konfuzije, tacnost] = tacnost_konfuzija(v_o_obuke,v_klase_obuke,v_test,klase_test,granica)


dobijene_test_klase=classify(v_test', v_o_obuke',v_klase_obuke',granica);


tac1=(dobijene_test_klase==klase_test');
tacnost=(sum(tac1)/length(tac1))*100;

matrica_konfuzije = confusionmat(klase_test,dobijene_test_klase);
end
