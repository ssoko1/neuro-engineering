function[v_o_obuke,v_klase_obuke,v_test,klase_test]=obuka_test()
load('EMGdata-obuka.mat')
figure,plot(grasp_type_vezbe)
%segmentacija
poceci=1:250:(length(CHS_vezbe)-499);
v_o_obuke=[];
v_klase_obuke=[];
for i=1:length(poceci)
    pocetak=poceci(i);
    prozor_emg=CHS_vezbe(:,pocetak:pocetak+499);
    prozor_klasa=grasp_type_vezbe(pocetak:pocetak+499);
    vrednosti=unique(prozor_klasa);
    if length(vrednosti)==1
        RMS=rms(prozor_emg,2);
        MAV=mean(abs(prozor_emg),2);
        WL=sum(abs(diff(prozor_emg,1,2)),2);
        v_o_podobuke=[RMS;MAV;WL];
        v_o_obuke=[v_o_obuke v_o_podobuke];
        v_klase_obuke=[v_klase_obuke vrednosti];
    end
end

load('EMGdata-test.mat')
poceci=1:250:(length(CHS_provera)-499);
v_test=[];
klase_test=[];
for i=1:length(poceci)
    pocetak=poceci(i);
    prozor_emg=CHS_provera(:,pocetak:pocetak+499);
    prozor_klasa=grasp_type_provera(pocetak:pocetak+499);
    vrednosti=unique(prozor_klasa);
    if length(vrednosti)==1
        RMS=rms(prozor_emg,2);
        MAV=mean(abs(prozor_emg),2);
        WL=sum(abs(diff(prozor_emg,1,2)),2);
        v_test2=[RMS;MAV;WL];
        v_test=[v_test v_test2];
        klase_test=[klase_test vrednosti];
    end
   
end