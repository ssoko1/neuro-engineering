function varargout = zadatak4(varargin)
% ZADATAK4 MATLAB code for zadatak4.fig
%      ZADATAK4, by itself, creates a new ZADATAK4 or raises the existing
%      singleton*.
%
%      H = ZADATAK4 returns the handle to a new ZADATAK4 or the handle to
%      the existing singleton*.
%
%      ZADATAK4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZADATAK4.M with the given input arguments.
%
%      ZADATAK4('Property','Value',...) creates a new ZADATAK4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zadatak4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zadatak4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zadatak4

% Last Modified by GUIDE v2.5 12-Jun-2022 00:58:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zadatak4_OpeningFcn, ...
                   'gui_OutputFcn',  @zadatak4_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before zadatak4 is made visible.
function zadatak4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zadatak4 (see VARARGIN)

% Choose default command line output for zadatak4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zadatak4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.uipanel1,'backgroundColor',	[0.7 0.7 0.7]);
set(handles.uipanel2,'backgroundColor',	[0.7 0.7 0.7]);

annotation(handles.uipanel2,'textarrow',[0 0.5],[0.5 0.5]);
annotation(handles.uipanel1,'textarrow',[1 0.5],[0.5 0.5]);

kanal{1} = 'Kanal 3' ; 
kanal{2} = 'Kanal 4' ; 



set(handles.popupmenu1, 'String', kanal)
handles.kanal = kanal ;
guidata(hObject, handles);

set(handles.pushbutton3,'Enable','off')
set(handles.pushbutton1,'Enable','off')


% --- Outputs from this function are returned to the command line.
function varargout = zadatak4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global uslov
global port
global instrukcije
global klase_pred

uslov = 0;


if length(klase_pred) < length(instrukcije) && ~isempty(klase_pred)
    tacnost = 100*sum(klase_pred == instrukcije(1:end-1))/length(klase_pred);
    set(handles.edit4,'string',num2str(tacnost));
    
elseif length(klase_pred) == length(instrukcije) && ~isempty(klase_pred)
    tacnost = 100*sum(klase_pred == instrukcije)/length(klase_pred);
    set(handles.edit4,'string',num2str(tacnost));
end

fwrite(port,'>OFF<');
fclose(port);
clear port
disp('disconnected')
handles.output = hObject;
guidata(hObject, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global klase_obuka
global vektor_obelezja

set(handles.pushbutton3,'Enable','on')
set(handles.pushbutton1,'Enable','on')
eeg = load('EEG_obuka.mat');
eeg = eeg.EEG_obuka;
C3 = eeg(:,5); %obeležja su u koloni 5
C4 = eeg(:,6); %u koloni 6
klase = eeg(:,26) %oznake klasa u koloni 26


[vektor_obelezja,klase_obuka]=priprema_za_obuku(C3,C4,klase);%%promenljive koje se odnose
%%na generisani skup za obuku prosledjuju se callback funkciji Start
msgbox('Skup za obuku kreiran')

%ukupan broj triala u podacima za obuku je 72
%posto svaki aktivni period u toku triala treba da ima jedan
%vektor obelezja, skup za obuku ce imati 72 vektora obelezja


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global klase_obuka
global vektor_obelezja
global Fs
global uslov
global port
global instrukcije
global klase_pred
global kanal


test_klase = load('instrukcije_za_test.mat'); %ucitavamo fajl
test_klase = test_klase.instrukcije_za_test;

trajanje_instrukcije = load('trajanje_svake_instrukcije.mat');
trajanje_instrukcije = trajanje_instrukcije.trajanje_svake_instrukcije;

tmp = instrfind;
if(size(tmp, 1) > 0)
    fclose(tmp);
    delete(tmp);
end


port = serial('COM2');

set(port,'DataBits',8,'StopBits',1,'FlowControl','hardware');

port.InputBufferSize = 5000;

fopen(port);

fwrite(port, ['>SC;' 255 255 255 '<']);


disp(char(fread(port, 4)))


fwrite(port, '>NORMAL<');
disp(char(fread(port, 4)))

fwrite(port, '>ON<')
disp(char(fread(port, 4)))

Fs=160;
t=0:1/160:5-1/160;


eeg_prikaz=zeros(1, length(t)); 

uslov = 1;

podaci_uk = []; %prikuplja odbirke sa simulatora
broj_prolazaka = 1; %broji prikazane instrukcije
zadate_klase = test_klase(broj_prolazaka);  

klase_pred = [];


set(handles.edit2,'string',' ');
set(handles.edit3,'string',' ');
set(handles.edit4,'string',' ');

%preuzimamo bajtove sa kanala C3 i C4
%podaci uk ce imati dimenziju 2 i broj prikupljenih odbiraka
%po svakom kanalu

while uslov && (length(test_klase)>=broj_prolazaka) 
    pristigli_bajtovi = port.BytesAvailable; 
    if pristigli_bajtovi>0
        pristigle_informacije = fread(port, pristigli_bajtovi);
      
        pocetak = find(pristigle_informacije == 62); 
        duzina = (length(pristigle_informacije) - pocetak)<82;
        pravi_pocetak = find(duzina == 0);
        provera = pocetak(pravi_pocetak); 
        prave_lokacije = provera(pristigle_informacije(provera+82) == 60);
        for k = 1:length(prave_lokacije)
            i = prave_lokacije(k);
            k5 = pristigle_informacije(i+(5-1)*3+1)*65536 + pristigle_informacije(i+(5-1)*3+2)*256 + pristigle_informacije(i+(5-1)*3+3);
            
            
            k6 = pristigle_informacije(i+(6-1)*3+1)*65536 + pristigle_informacije(i+(6-1)*3+2)*256 + pristigle_informacije(i+(6-1)*3+3);
            
            if k5 > 2^23-1 

                k5 = k5 - 2^24;
            end
            
            if k6 > 2^23-1  
                k6 = k6 - 2^24;
            end
            k5 = k5*(4.5/(2^23-1))/24*10^6;
            k6 = k6*(4.5/(2^23-1))/24*10^6;
            
            podaci_uk(end+1,1)=k5; 
            podaci_uk(end,2)=k6; 
            izlazni_kanal=podaci_uk';
            
            
            eeg_prikaz(1)=[];   
            if kanal == 1
                eeg_prikaz(length(t)) = k5;
            else
                eeg_prikaz(length(t)) = k6;
            end
            
            if size(podaci_uk, 1) >= 4.1*160 && rem(broj_prolazaka, 2) == 0
              
                set(handles.uipanel1,'backgroundColor', [0.7 0.7 0.7]);
                set(handles.uipanel2,'backgroundColor', [0.7 0.7 0.7]);
                C3_test = podaci_uk(:,1); 
                C4_test = podaci_uk(:,2);
                
                
                
                
                [pxx3,F] = periodogram(C3_test,[],[],Fs);
    
                alfa = F>=8 & F<=13;
                beta = F>=13 & F<=30;
                alfa3= mean(pxx3(alfa));
                beta3= mean(pxx3(beta));
    
                pxx4 = periodogram(C4_test,[],[],Fs);
                alfa4= mean(pxx4(alfa));
                beta4= mean(pxx4(beta));
                
                vektor_test=[ alfa3;beta3;alfa4;beta4]'; 
                klase_dobijene = classify(vektor_test,vektor_obelezja',klase_obuka', 'quadratic');
                klase_pred(end+1) = klase_dobijene;
                
                set(handles.edit3,'string',num2str(klase_pred));

                podaci_uk = []; 
                broj_prolazaka=broj_prolazaka+1; 
                if length(test_klase) - 1 == broj_prolazaka
                    tacnost = 100*sum(klase_pred == instrukcije)/length(klase_pred);
                    set(handles.edit4,'string',num2str(tacnost));
                else
                    zadate_klase(end+1) = test_klase(broj_prolazaka);
                end
                
            elseif size(podaci_uk, 1) >= 4.2*160 && rem(broj_prolazaka,2) ~= 0
                podaci_uk = []; 
                broj_prolazaka = broj_prolazaka + 1;
                zadate_klase(end+1) = test_klase(broj_prolazaka); 
                
                instrukcije = zadate_klase(zadate_klase~=0); 
                               
                set(handles.edit2,'string', num2str(instrukcije));               
                if zadate_klase(end) == 2 
                    set(handles.uipanel2,'backgroundColor',[0 1 0]);
                    set(handles.uipanel1,'backgroundColor',	[1 1 1]);                   
                else
                    set(handles.uipanel1,'backgroundColor',[0 1 0]);
                    set(handles.uipanel2,'backgroundColor',	[1 1 1]);                   
                end
            end
        end
        axes(handles.axes1)
        plot(t,eeg_prikaz)
        xlabel('time[s]')
        ylabel('signal[uV]')
        ylim([-400 400])
        drawnow
    end
end    



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
