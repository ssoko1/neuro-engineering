function varargout = zadatak1(varargin)
% ZADATAK1 MATLAB code for zadatak1.fig
%      ZADATAK1, by itself, creates a new ZADATAK1 or raises the existing
%      singleton*.
%
%      H = ZADATAK1 returns the handle to a new ZADATAK1 or the handle to
%      the existing singleton*.
%
%      ZADATAK1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZADATAK1.M with the given input arguments.
%
%      ZADATAK1('Property','Value',...) creates a new ZADATAK1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zadatak1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zadatak1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zadatak1

% Last Modified by GUIDE v2.5 12-Mar-2023 21:00:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zadatak1_OpeningFcn, ...
                   'gui_OutputFcn',  @zadatak1_OutputFcn, ...
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


% --- Executes just before zadatak1 is made visible.
function zadatak1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zadatak1 (see VARARGIN)

% Choose default command line output for zadatak1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zadatak1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = zadatak1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton_ucitavanje.
function pushbutton_ucitavanje_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_ucitavanje (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global v_o_obuke v_klase_obuke v_test klase_test

[v_o_obuke,v_klase_obuke,v_test,klase_test]=obuka_test();


% --- Executes on button press in pushbutton_rezultat.
function pushbutton_rezultat_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_rezultat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global matrica_konfuzije tacnost

set(handles.edit_tacnost, 'String', tacnost)
set(handles.uitable_konfuzija, 'data', matrica_konfuzije)

% --- Executes on button press in pushbutton_obuka.
function pushbutton_obuka_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_obuka (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global v_o_obuke v_klase_obuke v_test klase_test matrica_konfuzije tacnost

if get(handles.listbox_moguce, 'Value') == 1
    
    granica = 'linear';  
else
    granica = 'quadratic';
end
    
[matrica_konfuzije, tacnost] = tacnost_konfuzija(v_o_obuke,v_klase_obuke,v_test,klase_test,granica);


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


% --- Executes on selection change in listbox_moguce.
function listbox_moguce_Callback(hObject, eventdata, handles)
% hObject    handle to listbox_moguce (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox_moguce contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox_moguce


% --- Executes during object creation, after setting all properties.
function listbox_moguce_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox_moguce (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
