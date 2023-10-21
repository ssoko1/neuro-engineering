function varargout = proteze(varargin)
% PROTEZE MATLAB code for proteze.fig
%      PROTEZE, by itself, creates a new PROTEZE or raises the existing
%      singleton*.
%
%      H = PROTEZE returns the handle to a new PROTEZE or the handle to
%      the existing singleton*.
%
%      PROTEZE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROTEZE.M with the given input arguments.
%
%      PROTEZE('Property','Value',...) creates a new PROTEZE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before proteze_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to proteze_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help proteze

% Last Modified by GUIDE v2.5 24-Dec-2022 20:27:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @proteze_OpeningFcn, ...
                   'gui_OutputFcn',  @proteze_OutputFcn, ...
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
% --- Executes just before proteze is made visible.
function proteze_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to proteze (see VARARGIN)
%set(handles.radiobutton_manuelni_mod, 'Value', 0);
%set(handles.radiobutton_bocnizahvat, 'Value', 0);
%set(handles.radiobutton_bocnizahvat2, 'Value', 0);
%set(handles.radiobutton_otvoriti_lateracija, 'Value', 0);
%set(handles.radiobutton_otvoriti_opozicija, 'Value', 0);
%set(handles.radiobutton_pronacija, 'Value', 0);
global motori
motori = zeros(1,8);
global intenziteti
intenziteti = zeros(1,8);
global trajanja
trajanja = zeros(1,8);
% Choose default command line output for proteze
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes proteze wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = proteze_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

end
% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
global motori
motor = get(handles.checkbox1, 'Value');
if motor == 1
    motori(1) = 1;
elseif motor == 0
    motori(1) = 0;
end
end
% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
global motori
motor = get(handles.checkbox2, 'Value');
if motor == 1
    motori(2) = 1;
elseif motor == 0
    motori(2) = 0;
end
end
% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
global motori
motor = get(handles.checkbox3, 'Value');
if motor == 1
    motori(3) = 1;
elseif motor == 0
    motori(3) = 0;
end
end

% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
global motori
motor = get(handles.checkbox4, 'Value');
if motor == 1
    motori(4) = 1;
elseif motor == 0
    motori(4) = 0;
end
end

% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5
global motori
motor = get(handles.checkbox5, 'Value');
if motor == 1
    motori(5) = 1;
elseif motor == 0
    motori(5) = 0;
end
end

% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6
global motori
motor = get(handles.checkbox6, 'Value');
if motor == 1
    motori(6) = 1;
elseif motor == 0
    motori(6) = 0;
end
end
% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7
global motori
motor = get(handles.checkbox7, 'Value');
if motor == 1
    motori(7) = 1;
elseif motor == 0
    motori(7) = 0;
end
end
% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8
global motori
motor = get(handles.checkbox8, 'Value');
if motor == 1
    motori(8) = 1;
elseif motor == 0
    motori(8) = 0;
end
end

function edit_duration_1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_duration_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_duration_1 as text
%        str2double(get(hObject,'String')) returns contents of edit_duration_1 as a double
global trajanja
trajanje = str2double(get(handles.edit_duration_1, 'String'));

if trajanje < 0.1 | trajanje > 10
    msgbox('Trajanje vibracija mora da bude u opsegu 0.1-10');
else
    trajanja(1) = trajanje*10;
end
end
% --- Executes during object creation, after setting all properties.
function edit_duration_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_duration_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_intenzitet_1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_intenzitet_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_intenzitet_1 as text
%        str2double(get(hObject,'String')) returns contents of edit_intenzitet_1 as a double
global intenziteti
intenzitet = str2double(get(handles.edit_intenzitet_1, 'String'));

if intenzitet < 1 | intenzitet > 100
    msgbox('Intenzitet vibracija mora biti u opsegu  1-100');
else
    intenziteti(1) = intenzitet;
end
end

% --- Executes during object creation, after setting all properties.
function edit_intenzitet_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_intenzitet_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_intenzitet_2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_intenzitet_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_intenzitet_2 as text
%        str2double(get(hObject,'String')) returns contents of edit_intenzitet_2 as a double
global intenziteti
intenzitet = str2double(get(handles.edit_intenzitet_2, 'String'));

if intenzitet < 1 | intenzitet > 100
    msgbox('Intenzitet vibracija mora biti u opsegu  1-100');
else
    intenziteti(2) = intenzitet;
end
end

% --- Executes during object creation, after setting all properties.
function edit_intenzitet_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_intenzitet_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function edit_duration_2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_duration_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global trajanja
trajanje = str2double(get(handles.edit_duration_2, 'String'));

if trajanje < 0.1 | trajanje > 10
    msgbox('Trajanje vibracija mora da bude u opsegu 0.1-10');
else
    trajanja(2) = trajanje*10;
end
end
% Hints: get(hObject,'String') returns contents of edit_duration_2 as text
%        str2double(get(hObject,'String')) returns contents of edit_duration_2 as a double


% --- Executes during object creation, after setting all properties.
function edit_duration_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_duration_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_intenzitet_3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_intenzitet_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_intenzitet_3 as text
%        str2double(get(hObject,'String')) returns contents of edit_intenzitet_3 as a double
global intenziteti
intenzitet = str2double(get(handles.edit_intenzitet_3, 'String'));

if intenzitet < 1 | intenzitet > 100
    msgbox('Intenzitet vibracija mora biti u opsegu  1-100');
else
    intenziteti(3) = intenzitet;
end
end
% --- Executes during object creation, after setting all properties.
function edit_intenzitet_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_intenzitet_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_duration_3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_duration_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_duration_3 as text
%        str2double(get(hObject,'String')) returns contents of edit_duration_3 as a double
global trajanja
trajanje = str2double(get(handles.edit_duration_3, 'String'));

if trajanje < 0.1 | trajanje > 10
    msgbox('Trajanje vibracija mora da bude u opsegu 0.1-10');
else
    trajanja(3) = trajanje*10;
end
end
% --- Executes during object creation, after setting all properties.
function edit_duration_3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_duration_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_intenzitet_4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_intenzitet_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_intenzitet_4 as text
%        str2double(get(hObject,'String')) returns contents of edit_intenzitet_4 as a double
global intenziteti
intenzitet = str2double(get(handles.edit_intenzitet_4, 'String'));

if intenzitet < 1 | intenzitet > 100
    msgbox('Intenzitet vibracija mora biti u opsegu  1-100');
else
    intenziteti(4) = intenzitet;
end
end
% --- Executes during object creation, after setting all properties.
function edit_intenzitet_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_intenzitet_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_duration_4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_duration_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_duration_4 as text
%        str2double(get(hObject,'String')) returns contents of edit_duration_4 as a doubleglobal trajanja
trajanje = str2double(get(handles.edit_duration_4, 'String'));

if trajanje < 0.1 | trajanje > 10
    msgbox('Trajanje vibracija mora da bude u opsegu 0.1-10');
else
    trajanja(4) = trajanje*10;
end
end

% --- Executes during object creation, after setting all properties.
function edit_duration_4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_duration_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_intenzitet_8_Callback(hObject, eventdata, handles)
% hObject    handle to edit_intenzitet_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_intenzitet_8 as text
%        str2double(get(hObject,'String')) returns contents of edit_intenzitet_8 as a double
global intenziteti
intenzitet = str2double(get(handles.edit_intenzitet_8, 'String'));

if intenzitet < 1 | intenzitet > 100
    msgbox('Intenzitet vibracija mora biti u opsegu  1-100');
else
    intenziteti(8) = intenzitet;
end
end
% --- Executes during object creation, after setting all properties.
function edit_intenzitet_8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_intenzitet_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_duration_8_Callback(hObject, eventdata, handles)
% hObject    handle to edit_duration_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_duration_8 as text
%        str2double(get(hObject,'String')) returns contents of edit_duration_8 as a double
global trajanja
trajanje = str2double(get(handles.edit_duration_8, 'String'));

if trajanje < 0.1 | trajanje > 10
    msgbox('Trajanje vibracija mora da bude u opsegu 0.1-10');
else
    trajanja(8) = trajanje*10;
end
end
% --- Executes during object creation, after setting all properties.
function edit_duration_8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_duration_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_intenzitet_7_Callback(hObject, eventdata, handles)
% hObject    handle to edit_intenzitet_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_intenzitet_7 as text
%        str2double(get(hObject,'String')) returns contents of edit_intenzitet_7 as a double
global intenziteti
intenzitet = str2double(get(handles.edit_intenzitet_7, 'String'));

if intenzitet < 1 | intenzitet > 100
    msgbox('Intenzitet vibracija mora biti u opsegu  1-100');
else
    intenziteti(7) = intenzitet;
end
end
% --- Executes during object creation, after setting all properties.
function edit_intenzitet_7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_intenzitet_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_duration_7_Callback(hObject, eventdata, handles)
% hObject    handle to edit_duration_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_duration_7 as text
%        str2double(get(hObject,'String')) returns contents of edit_duration_7 as a double
global trajanja
trajanje = str2double(get(handles.edit_duration_7, 'String'));

if trajanje < 0.1 | trajanje > 10
    msgbox('Trajanje vibracija mora da bude u opsegu 0.1-10');
else
    trajanja(7) = trajanje*10;
end
end
% --- Executes during object creation, after setting all properties.
function edit_duration_7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_duration_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_intenzitet_6_Callback(hObject, eventdata, handles)
% hObject    handle to edit_intenzitet_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_intenzitet_6 as text
%        str2double(get(hObject,'String')) returns contents of edit_intenzitet_6 as a double
global intenziteti
intenzitet = str2double(get(handles.edit_intenzitet_6, 'String'));

if intenzitet < 1 | intenzitet > 100
    msgbox('Intenzitet vibracija mora biti u opsegu  1-100');
else
    intenziteti(6) = intenzitet;
end
end

% --- Executes during object creation, after setting all properties.
function edit_intenzitet_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_intenzitet_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_duration_6_Callback(hObject, eventdata, handles)
% hObject    handle to edit_duration_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_duration_6 as text
%        str2double(get(hObject,'String')) returns contents of edit_duration_6 as a double
global trajanja
trajanje = str2double(get(handles.edit_duration_6, 'String'));

if trajanje < 0.1 | trajanje > 10
    msgbox('Trajanje vibracija mora da bude u opsegu 0.1-10');
else
    trajanja(6) = trajanje*10;
end
end

% --- Executes during object creation, after setting all properties.
function edit_duration_6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_duration_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_intenzitet_5_Callback(hObject, eventdata, handles)
% hObject    handle to edit_intenzitet_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_intenzitet_5 as text
%        str2double(get(hObject,'String')) returns contents of edit_intenzitet_5 as a double
global intenziteti
intenzitet = str2double(get(handles.edit_intenzitet_5, 'String'));

if intenzitet < 1 | intenzitet > 100
    msgbox('Intenzitet vibracija mora biti u opsegu  1-100');
else
    intenziteti(5) = intenzitet;
end
end

% --- Executes during object creation, after setting all properties.
function edit_intenzitet_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_intenzitet_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_duration_5_Callback(hObject, eventdata, handles)
% hObject    handle to edit_duration_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_duration_5 as text
%        str2double(get(hObject,'String')) returns contents of edit_duration_5 as a double
global trajanja
trajanje = str2double(get(handles.edit_duration_5, 'String'));

if trajanje < 0.1 | trajanje > 10
    msgbox('Trajanje vibracija mora da bude u opsegu 0.1-10');
else
    trajanja(5) = trajanje*10;
end
end
% --- Executes during object creation, after setting all properties.
function edit_duration_5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_duration_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on button press in radiobutton_manuelni_mod.
function radiobutton_manuelni_mod_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_manuelni_mod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global manuelni
global automatski
 
manuelni = get(handles.radiobutton_manuelni_mod, 'Value');
automatski = get(handles.radiobutton_automatski_mod_rada, 'Value');

if manuelni == 1
    mod_rada('M')
elseif automatski == 1
    mod_rada('A')
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton_manuelni_mod
end

% --- Executes on button press in radiobutton_automatski_mod_rada.
function radiobutton_automatski_mod_rada_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_automatski_mod_rada (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global manuelni
global automatski
 
manuelni = get(handles.radiobutton_manuelni_mod, 'Value');
automatski = get(handles.radiobutton_automatski_mod_rada, 'Value');

if manuelni == 1
    mod_rada('M')
elseif automatski == 1
    mod_rada('A')
end
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton_automatski_mod_rada


% --- Executes on button press in radiobutton_bocnizahvat.
function radiobutton_bocnizahvat_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_bocnizahvat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_bocnizahvat
lateral = get(handles.radiobutton_bocnizahvat, 'Value');
opposition = get(handles.radiobutton_opozicija, 'Value');
rotation = get(handles.radiobutton_rotacija, 'Value');

if lateral == 1
    rezim_rada('L');
elseif opposition == 1
    rezim_rada('O');
elseif rotation == 1
    rezim_rada('R');
end
end

% --- Executes on button press in radiobutton_opozicija.
function radiobutton_opozicija_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_opozicija (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_opozicija
lateral = get(handles.radiobutton_bocnizahvat, 'Value');
opposition = get(handles.radiobutton_opozicija, 'Value');
rotation = get(handles.radiobutton_rotacija, 'Value');

if lateral == 1
    rezim_rada('L');
elseif opposition == 1
    rezim_rada('O');
elseif rotation == 1
    rezim_rada('R');
end
end

% --- Executes on button press in radiobutton_rotacija.
function radiobutton_rotacija_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_rotacija (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_rotacija
lateral = get(handles.radiobutton_bocnizahvat, 'Value');
opposition = get(handles.radiobutton_opozicija, 'Value');
rotation = get(handles.radiobutton_rotacija, 'Value');

if lateral == 1
    rezim_rada('L');
elseif opposition == 1
    rezim_rada('O');
elseif rotation == 1
    rezim_rada('R');
end
end

% --- Executes on button press in radiobutton_bocnizahvat2.
function radiobutton_bocnizahvat2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_bocnizahvat2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_bocnizahvat2
lateral = get(handles.radiobutton_bocnizahvat2, 'Value');
opposition = get(handles.radiobutton_opozicija2, 'Value');
rotation = get(handles.radiobutton_rotacija2, 'Value');

if lateral == 1
    rezim_rada('L');
elseif opposition == 1
    rezim_rada('O');
elseif rotation == 1
    rezim_rada('R');
end
end
% --- Executes on button press in radiobutton_opozicija2.
function radiobutton_opozicija2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_opozicija2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_opozicija2
lateral = get(handles.radiobutton_bocnizahvat2, 'Value');
opposition = get(handles.radiobutton_opozicija2, 'Value');
rotation = get(handles.radiobutton_rotacija2, 'Value');

if lateral == 1
    rezim_rada('L');
elseif opposition == 1
    rezim_rada('O');
elseif rotation == 1
    rezim_rada('R');
end
end

% --- Executes on button press in radiobutton_rotacija2.
function radiobutton_rotacija2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_rotacija2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_rotacija2
lateral = get(handles.radiobutton_bocnizahvat2, 'Value');
opposition = get(handles.radiobutton_opozicija2, 'Value');
rotation = get(handles.radiobutton_rotacija2, 'Value');

if lateral == 1
    rezim_rada('L');
elseif opposition == 1
    rezim_rada('O');
elseif rotation == 1
    rezim_rada('R');
end
end

% --- Executes on button press in pushbutton_ucitaj.
function pushbutton_ucitaj_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_ucitaj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global motori
global trajanja
global intenziteti

bin= bi2de(motori);
maska(bin);

for i = 1:8
    if motori(i) == 1
        duzina_vibracije(i, trajanja(i));
        jacina_vibracije(i, intenziteti(i));
    end
end
end

% --- Executes on button press in pushbutton_stop.
function pushbutton_stop_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop()
end

% --- Executes on button press in pushbutton_start.
function pushbutton_start_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pocetak()
end

% --- Executes on button press in radiobutton_otvoriti_lateracija.
function radiobutton_otvoriti_lateracija_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_otvoriti_lateracija (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton_otvoriti_lateracija


% --- Executes on button press in radiobutton_zatvoriti_lateracija.
function radiobutton_zatvoriti_lateracija_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_zatvoriti_lateracija (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton_zatvoriti_lateracija


% --- Executes on button press in radiobutton_otvoriti_opozicija.
function radiobutton_otvoriti_opozicija_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_otvoriti_opozicija (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton_otvoriti_opozicija


% --- Executes on button press in radiobutton_zatvoriti_opozicija.
function radiobutton_zatvoriti_opozicija_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_zatvoriti_opozicija (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_zatvoriti_opozicija
end

% --- Executes on button press in radiobutton_pronacija.
function radiobutton_pronacija_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_pronacija (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_pronacija
end

% --- Executes on button press in radiobutton_supinacija.
function radiobutton_supinacija_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_supinacija (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_supinacija
end

% --- Executes on button press in pushbutton_OK_lateracija.
function pushbutton_OK_lateracija_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_OK_lateracija (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
otvoriti = get(handles.radiobutton_otvoriti_lateracija, 'Value');
zatvoriti = get(handles.radiobutton_zatvoriti_lateracija, 'Value');
brzina = str2double(get(handles.edit_brzina_lateracija, 'String'));

if otvoriti == 1
    rucno_upravljanje_lateracija(0, brzina);
elseif zatvoriti == 1
    rucno_upravljanje_lateracija(1, brzina);
end
end

% --- Executes on button press in pushbutton_OK_rotacija.
function pushbutton_OK_rotacija_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_OK_rotacija (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
otvoriti = get(handles.radiobutton_pronacija, 'Value');
zatvoriti = get(handles.radiobutton_supinacija, 'Value');
brzina = str2double(get(handles.edit_brzina_rotacija, 'String'));

if otvoriti == 1
    rucno_upravljanje_rotacija(0, brzina);
elseif zatvoriti == 1
    rucno_upravljanje_rotacija(1, brzina);
end
end

% --- Executes on button press in pushbutton_OK_opozicija.
function pushbutton_OK_opozicija_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_OK_opozicija (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
otvoriti = get(handles.radiobutton_otvoriti_opozicija, 'Value');
zatvoriti = get(handles.radiobutton_zatvoriti_opozicija, 'Value');
brzina = str2double(get(handles.edit_brzina_opozicija, 'String'));

if otvoriti == 1
    rucno_upravljanje_opozicija(0, brzina);
elseif zatvoriti == 1
    rucno_upravljanje_opozicija(1, brzina);
end
end



function edit_brzina_lateracija_Callback(hObject, eventdata, handles)
% hObject    handle to edit_brzina_lateracija (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_brzina_lateracija as text
%        str2double(get(hObject,'String')) returns contents of edit_brzina_lateracija as a double
end

% --- Executes during object creation, after setting all properties.
function edit_brzina_lateracija_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_brzina_lateracija (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function edit_brzina_opozicija_Callback(hObject, eventdata, handles)
% hObject    handle to edit_brzina_opozicija (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_brzina_opozicija as text
%        str2double(get(hObject,'String')) returns contents of edit_brzina_opozicija as a double

end
% --- Executes during object creation, after setting all properties.
function edit_brzina_opozicija_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_brzina_opozicija (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_brzina_rotacija_Callback(hObject, eventdata, handles)
% hObject    handle to edit_brzina_rotacija (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_brzina_rotacija as text
%        str2double(get(hObject,'String')) returns contents of edit_brzina_rotacija as a double

end
% --- Executes during object creation, after setting all properties.
function edit_brzina_rotacija_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_brzina_rotacija (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
