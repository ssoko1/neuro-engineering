function varargout = zad3(varargin)
% ZAD3 MATLAB code for zad3.fig
%      ZAD3, by itself, creates a new ZAD3 or raises the existing
%      singleton*.
%
%      H = ZAD3 returns the handle to a new ZAD3 or the handle to
%      the existing singleton*.
%
%      ZAD3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZAD3.M with the given input arguments.
%
%      ZAD3('Property','Value',...) creates a new ZAD3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zad3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zad3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zad3

% Last Modified by GUIDE v2.5 15-May-2023 13:02:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zad3_OpeningFcn, ...
                   'gui_OutputFcn',  @zad3_OutputFcn, ...
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


% --- Executes just before zad3 is made visible.
function zad3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zad3 (see VARARGIN)

% Choose default command line output for zad3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zad3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = zad3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_ucitaj.
function pushbutton_ucitaj_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_ucitaj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fs
global c3
global c4
global signalKlase

load('EEG_zad3.mat');
c3=eeg(:,5);
c4=eeg(:,6);
signalKlase=eeg(:,26);

fs=160;
T=1/fs;
t=0:T:(length(c3)-1)/fs;
axes(handles.axes1)
plot(t,c3)
hold on
plot(t,signalKlase*100)
title('EEG signal (c3)')
xlabel('Vreme[s]')
handles.t=t;

axes(handles.axes2)
plot(t,c4)
hold on
plot(t,signalKlase*100) 
title('EEG signal (c4)')
xlabel('Vreme[s]')
handles.t=t;
guidata(hObject, handles);
% --- Executes on button press in pushbutton_filter.
function pushbutton_filter_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fs
global C3
global C4
global c3
global c4
global signalKlase

[P,Q]=butter(2,[8,30]*(2/fs),'bandpass');

C3=filter(P,Q,c3);
C4=filter(P,Q,c4);

axes(handles.axes3)
plot(handles.t,C3)
hold on
plot(handles.t,signalKlase*25)
title('Filtrirani EEG signal (c3)')
xlabel('Vreme(s)')

axes(handles.axes4)
plot(handles.t,C4)
hold on
plot(handles.t,signalKlase*25)
title('Filtrirani EEG signal (C4)')
xlabel('Vreme(s)')

% --- Executes on button press in pushbutton_tacnost.
function pushbutton_tacnost_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_tacnost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global matrica_obelezja
global vektorKlasa

radiobuttonLinear= get(handles.radiobutton_linear,'Value');
radiobuttonQuadratic= get(handles.radiobutton_quadratic,'Value');

CVO = cvpartition(vektorKlasa,'KFold',5);
err = zeros(CVO.NumTestSets,1);

     for i = 1:CVO.NumTestSets
         trIdx = CVO.training(i);
         teIdx = CVO.test(i);
         if radiobuttonLinear == 1
             ytest = classify(matrica_obelezja(teIdx,:),matrica_obelezja(trIdx,:),vektorKlasa(trIdx),'linear');
             err(i) = sum(ytest'~=vektorKlasa(teIdx));
         elseif radiobuttonQuadratic == 1
              ytest = classify(matrica_obelezja(teIdx,:),matrica_obelezja(trIdx,:),vektorKlasa(trIdx),'quadratic');
              err(i) = sum(ytest'~=vektorKlasa(teIdx));
         end
     end
     
     C = confusionmat(vektorKlasa(teIdx),ytest);
     set(handles.matrica_konfuzije, 'Data', C)

     
cvErr = sum(err)/sum(CVO.TestSize);
tacnost=(1-cvErr)*100;

set(handles.edit_tacnost,'String',tacnost)
set(handles.edit_greska,'String',cvErr)

% --- Executes on button press in pushbutton_obelezja.
function pushbutton_obelezja_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_obelezja (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global C3
global C4
global fs
global signalKlase
global vektorKlasa
global matrica_obelezja


poceciAkt=[];
for i=1:length(signalKlase)-1
    if signalKlase(i)<signalKlase(i+1)
        poceciAkt=[poceciAkt i+1];
    end
end

krajeviPok=[];

for i= 1:length(signalKlase)-1
    if signalKlase(i)>signalKlase(i+1)
        krajeviPok=[krajeviPok i];     
    end
end
krajeviPok=[krajeviPok length(signalKlase)];


vektorKlasa=[];
matrica_obelezja=[];
for i=1:length(poceciAkt)

    pocetak=poceciAkt(i);
    kraj=krajeviPok(i);
    aktivniC3=C3(pocetak:kraj);
    aktivniC4=C4(pocetak:kraj);
    obelezjaC3=izdvajanje(aktivniC3);
    obelezjaC4=izdvajanje(aktivniC4);
    vektorObelezja=[obelezjaC3 obelezjaC4];
    matrica_obelezja=[matrica_obelezja ; vektorObelezja];
    
    prozorKlase=signalKlase(pocetak:kraj);
    jedinstvenaKlasa=prozorKlase(1);
    vektorKlasa=[vektorKlasa jedinstvenaKlasa];
end


function edit_tacnost_Callback(hObject, eventdata, handles)
% hObject    handle to edit_tacnost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_tacnost as text
%        str2double(get(hObject,'String')) returns contents of edit_tacnost as a double


% --- Executes during object creation, after setting all properties.
function edit_tacnost_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_tacnost (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_greska_Callback(hObject, eventdata, handles)
% hObject    handle to edit_greska (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_greska as text
%        str2double(get(hObject,'String')) returns contents of edit_greska as a double


% --- Executes during object creation, after setting all properties.
function edit_greska_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_greska (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
