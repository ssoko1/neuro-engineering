function varargout = zadarak2(varargin)
% ZADARAK2 MATLAB code for zadarak2.fig
%      ZADARAK2, by itself, creates a new ZADARAK2 or raises the existing
%      singleton*.
%
%      H = ZADARAK2 returns the handle to a new ZADARAK2 or the handle to
%      the existing singleton*.
%
%      ZADARAK2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZADARAK2.M with the given input arguments.
%
%      ZADARAK2('Property','Value',...) creates a new ZADARAK2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zadarak2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zadarak2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zadarak2

% Last Modified by GUIDE v2.5 05-Apr-2023 12:32:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zadarak2_OpeningFcn, ...
                   'gui_OutputFcn',  @zadarak2_OutputFcn, ...
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
end

% --- Executes just before zadarak2 is made visible.
function zadarak2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zadarak2 (see VARARGIN)

% Choose default command line output for zadarak2
handles.output = hObject;

global kanal

kanal1 = get(handles.radiobutton1, 'Value');
kanal2 = get(handles.radiobutton2, 'Value');
kanal3 = get(handles.radiobutton3, 'Value');
kanal4 = get(handles.radiobutton4, 'Value');
kanal5 = get(handles.radiobutton5, 'Value');
kanal6 = get(handles.radiobutton6, 'Value');
kanal7 = get(handles.radiobutto7, 'Value');
kanal8 = get(handles.radiobutton8, 'Value');
kanal9 = get(handles.radiobutton9, 'Value');
kanal10 = get(handles.radiobutton10, 'Value');
kanal11 = get(handles.radiobutton11, 'Value');
kanal12 = get(handles.radiobutton12, 'Value');
kanal13 = get(handles.radiobutton13, 'Value');
kanal14 = get(handles.radiobutton14, 'Value');
kanal15 = get(handles.radiobutton15, 'Value');
kanal16 = get(handles.radiobutto16, 'Value');
kanal17 = get(handles.radiobutto17, 'Value');
kanal18 = get(handles.radiobutton18, 'Value');
kanal19 = get(handles.radiobutton19, 'Value');
kanal20 = get(handles.radiobutton20, 'Value');
kanal21 = get(handles.radiobutto21, 'Value');
kanal22 = get(handles.radiobutton22, 'Value');
kanal23 = get(handles.radiobutton23, 'Value');
kanal24 = get(handles.radiobutton24, 'Value');

kanal = [kanal1 kanal2 kanal3 kanal4 kanal5 kanal6 kanal7 kanal8 kanal9 ...
    kanal10 kanal11 kanal12 kanal13 kanal14 kanal15 kanal16 kanal17 ...
    kanal18 kanal19 kanal20 kanal21 kanal22 kanal23 kanal24];

set(handles.pushbuttonStop, 'Enable', 'Off');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zadarak2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = zadarak2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

end
% --- Executes on button press in pushbuttonStart.
function pushbuttonStart_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global kanal
global port 
global uslov

trajanje = str2num(get(handles.edit1,'String'));
if isempty(trajanje) | trajanje == 0
    msgbox('Unesite trajanje')
    return
else
    set(handles.pushbuttonStop, 'Enable', 'On')
    set(handles.pushbuttonStart, 'Enable', 'Off')
    
    %%connect
port=serial('COM3');
%PODESAVANJE KOMUNIKACIONIH PARAMETARA
%Baud-rate 921600bit/s, 8 data bits, no parity, 1 stop bit, Flow control - Hardware.
set(port,'BaudRate',921600,'DataBits',8,...
    'StopBits',1,'FlowControl','Hardware');
port.inputBufferSize=5000;
%predefinisana velicina je 512 bajtova
fopen(port);

%% start 
% programiramo registre uredjaja
%podesavamo parametre akvizicije
%slanjem komandi
%1. komanda normal,odabir vrste signala koji se salje prikupljen ili
%generisan
flushinput(port); %praznjenje da nije zaostao eeg podatak nego zaista komanda
komanda1='>NORMAL<';
fwrite(port,komanda1);
char(fread(port,4))
fread(port,4);
%2.komanda za selekciju kanala,
komanda2=['>SC;',1,1,1,'<'];
fwrite(port,komanda2);
char(fread(port,4))
%3.komanda za selekciju kanala
komanda3='>ON<';
fwrite(port,komanda3);
char(fread(port,4))

kanal1 = get(handles.radiobutton1, 'Value');
    kanal2 = get(handles.radiobutton2, 'Value');
    kanal3 = get(handles.radiobutton3, 'Value');
    kanal4 = get(handles.radiobutton4, 'Value');
    kanal5 = get(handles.radiobutton5, 'Value');
    kanal6 = get(handles.radiobutton6, 'Value');
    kanal7 = get(handles.radiobutto7, 'Value');
    kanal8 = get(handles.radiobutton8, 'Value');
    kanal9 = get(handles.radiobutton9, 'Value');
    kanal10 = get(handles.radiobutton10, 'Value');
    kanal11 = get(handles.radiobutton11, 'Value');
    kanal12 = get(handles.radiobutton12, 'Value');
    kanal13 = get(handles.radiobutton13, 'Value');
    kanal14 = get(handles.radiobutton14, 'Value');
    kanal15 = get(handles.radiobutton15, 'Value');
    kanal16 = get(handles.radiobutto16, 'Value');
    kanal17 = get(handles.radiobutto17, 'Value');
    kanal18 = get(handles.radiobutton18, 'Value');
    kanal19 = get(handles.radiobutton19, 'Value');
    kanal20 = get(handles.radiobutton20, 'Value');
    kanal21 = get(handles.radiobutto21, 'Value');
    kanal22 = get(handles.radiobutton22, 'Value');
    kanal23 = get(handles.radiobutton23, 'Value');
    kanal24 = get(handles.radiobutton24, 'Value');
    kanal = [kanal1 kanal2 kanal3 kanal4 kanal5 kanal6 kanal7 kanal8 ...
        kanal9 kanal10 kanal11 kanal12 kanal13 kanal14 kanal15 kanal16 ...
        kanal17 kanal18 kanal19 kanal20 kanal21 kanal22 kanal23 kanal24];

%% 
vreme = 0 : 1/160 : trajanje-1/160;
    vektor_prikaz = zeros(1, 160*trajanje); 
    klasa_prikaz = zeros(1, 160*trajanje); 
    
    uslov = 1; 
    
    pause(1);
    
    while(uslov)
        
        broj_bajtova = port.BytesAvailable;
        
        if  broj_bajtova > 0 
    
        podaci = fread(port, broj_bajtova);
   
        poceci_paketa = [];
     
        potencijalni_poceci = find(podaci == 62);
    
        for i = 1:length(potencijalni_poceci)
        
        
            if potencijalni_poceci(i)+82 <= length(podaci)
            
                if podaci(potencijalni_poceci(i)+82) == 60
                    poceci_paketa = [poceci_paketa, potencijalni_poceci(i)];
                end
            end
        
        end
        
  
    
        CH1_vrednosti = [];
        
    
    
        indeksi_kanala = 2:3:75;
        for j = 1:length(poceci_paketa)
       
            paket = podaci(poceci_paketa(j):poceci_paketa(j)+82);
        
            for m = 1:length(kanal)
                if kanal(m)== 1
                    CH1_bajtovi = paket(indeksi_kanala(m):indeksi_kanala(m+1)-1);
                    
                end
            end
       
        
        %kod iz Smarting protocol-a
            CH1vrednost_neoznacena=sum((CH1_bajtovi).*[2^16 2^8 2^0]');
            vrednost_klase_neoznacena=paket(75)*(2^8)+ paket(76)* 2^0;
      
            if CH1vrednost_neoznacena > (2^23 -1)
                CH1_vrednost= CH1vrednost_neoznacena - 2^24; 
            else
                CH1_vrednost= CH1vrednost_neoznacena;
            end
            
            CH1_vrednosti = [CH1_vrednosti; CH1_vrednost];
            
        
            if (vrednost_klase_neoznacena > hex2dec('7FFF'))
                vrednost_klase = vrednost_klase_neoznacena - hex2dec('10000');
            else
                vrednost_klase = vrednost_klase_neoznacena;
            end
            
        end
        
        
        Vref= 4.5;
        Gain = 24;
        
        scaleFactor = (Vref/(2^23 -1))/Gain;
        konverzija_jedinica = 10^(6);
        CH1_vrednosti_nove = CH1_vrednosti * scaleFactor * konverzija_jedinica;
        
        vektor_prikaz = [vektor_prikaz CH1_vrednosti_nove'];
        vektor_prikaz(1:length(CH1_vrednosti_nove)) = [];
        
        klasa_prikaz = [klasa_prikaz vrednost_klase];
        klasa_prikaz(1:length(vrednost_klase)) =[];
    
        axes(handles.axes1);
        plot(vreme,vektor_prikaz,'k')
        ylim([-600 600])
        title(sprintf('EEG'))
        xlabel(sprintf('Vreme [s]'))
        ylabel(sprintf('Signal [uV]'))
        
        
        axes(handles.axes2);
        plot(vreme,klasa_prikaz,'k')
        ylim([0 3])
        title(sprintf('KLASA'))
        xlabel(sprintf('Vreme [s]'))
        ylabel(sprintf('Klase'))
        
        drawnow
        
        flushinput(port)
        end
       
    end
end

end



% --- Executes on button press in pushbuttonStop.
function pushbuttonStop_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonStop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global port
global uslov 
 
uslov = 0;

set(handles.pushbuttonStart, 'Enable', 'On')
set(handles.pushbuttonStop, 'Enable', 'Off')

flushinput(port)

komanda4='>OFF<';
fwrite(port,komanda4);
char(fread(port,4))
%% discinnect
fclose(port);
clear port;
disp('disconnected')

handles.output = hObject;
guidata(hObject, handles);
end


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
end

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end