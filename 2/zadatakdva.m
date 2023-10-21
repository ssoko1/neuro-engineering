function varargout = zadatakdva(varargin)
% ZADATAKDVA MATLAB code for zadatakdva.fig
%      ZADATAKDVA, by itself, creates a new ZADATAKDVA or raises the existing
%      singleton*.
%
%      H = ZADATAKDVA returns the handle to a new ZADATAKDVA or the handle to
%      the existing singleton*.
%
%      ZADATAKDVA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZADATAKDVA.M with the given input arguments.
%
%      ZADATAKDVA('Property','Value',...) creates a new ZADATAKDVA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zadatakdva_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zadatakdva_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zadatakdva

% Last Modified by GUIDE v2.5 07-Dec-2022 17:09:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zadatakdva_OpeningFcn, ...
                   'gui_OutputFcn',  @zadatakdva_OutputFcn, ...
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
% --- Executes just before zadatakdva is made visible.
function zadatakdva_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zadatakdva (see VARARGIN)
global kanali;
kanali = zeros(1,8);

global amplitude
amplitude = zeros(1,8);

global frekvencije
frekvencije = zeros(1,8);

global sirine_impulsa
sirine_impulsa = zeros(1,8);

global brojevi_impulsa
brojevi_impulsa = zeros(1,8);
% Choose default command line output for zadatakdva
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zadatakdva wait for user response (see UIRESUME)
% uiwait(handles.figure1);

end
% --- Outputs from this function are returned to the command line.
function varargout = zadatakdva_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

end
% --- Executes on button press in pushbutton_connect.
function pushbutton_connect_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_connect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
povezivanje('>ON<')
end
% --- Executes during object creation, after setting all properties.
function pushbutton_connect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton_connect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

end
% --- Executes on button press in pushbutton_disconnect.
function pushbutton_disconnect_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_disconnect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
povezivanje('>OFF<')
end

% --- Executes on button press in pushbutton_stimulacija.
function pushbutton_stimulacija_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_stimulacija (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global kanali;
global amplitude;
global frekvencije;
global sirine_impulsa;
global brojevi_impulsa;
for i=1:8
    if kanali(i) == 1
        amplituda(i, amplitude(i))
        frekvencija(i, frekvencije(i))
        sirina_impulsa(i, sirine_impulsa(i))
        broj_impulsa(i, brojevi_impulsa(i))
    end
end

broj= bi2de(kanali);
broj_kanala(broj);  

end
% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
global kanali;

kanali(1) = get(handles.checkbox1, 'Value');
end
% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
global kanali;

kanali(2) = get(handles.checkbox2, 'Value');
end
% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3
global kanali;

kanali(3) = get(handles.checkboxKanal3, 'Value');
end
% --- Executes on button press in checkbox4.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox4
global kanali;

kanali(4) = get(handles.checkbox4, 'Value');
end
% --- Executes on button press in checkbox5.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox5
global kanali;

kanali(5) = get(handles.checkbox5, 'Value');
end
% --- Executes on button press in checkbox6.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox6
global kanali;

kanali(6) = get(handles.checkbox6, 'Value');
end
% --- Executes on button press in checkbox7.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox7

global kanali;

kanali(7) = get(handles.checkbox7, 'Value');
end
% --- Executes on button press in checkbox8.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox8
global kanali;

kanali(8) = get(handles.checkbox8, 'Value');
end

function edit_amplituda1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_amplituda1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_amplituda1 as text
%        str2double(get(hObject,'String')) returns contents of edit_amplituda1 as a double
global amplitude;

amplitude(1) = str2double(get(handles.edit_amplituda1,'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_amplituda1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_amplituda1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_frekvencija1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_frekvencija1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_frekvencija1 as text
%        str2double(get(hObject,'String')) returns contents of edit_frekvencija1 as a double
global frekvencije;

frekvencije(1) = str2double(get(handles.edit_frekvencija1, 'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_frekvencija1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_frekvencija1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function edit_brojimpulsa1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_brojimpulsa1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_brojimpulsa1 as text
%        str2double(get(hObject,'String')) returns contents of edit_brojimpulsa1 as a double

global brojevi_impulsa;

brojevi_impulsa(1) = str2double(get(handles.edit_brojimpulsa1, 'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_brojimpulsa1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_brojimpulsa1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

function edit_sirinaimpulsa1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sirinaimpulsa1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sirinaimpulsa1 as text
%        str2double(get(hObject,'String')) returns contents of edit_sirinaimpulsa1 as a double
global sirine_impulsa;

sirine_impulsa(1) = str2double(get(handles.edit_sirinaimpulsa1, 'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_sirinaimpulsa1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sirinaimpulsa1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function edit_amplituda2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_amplituda2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_amplituda2 as text
%        str2double(get(hObject,'String')) returns contents of edit_amplituda2 as a double
global amplitude;

amplitude(2) = str2double(get(handles.edit_amplituda2,'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_amplituda2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_amplituda2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_amplituda3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_amplituda3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_amplituda3 as text
%        str2double(get(hObject,'String')) returns contents of edit_amplituda3 as a double
global amplitude;

amplitude(3) = str2double(get(handles.edit_amplituda3,'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_amplituda3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_amplituda3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function edit_amplituda4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_amplituda4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_amplituda4 as text
%        str2double(get(hObject,'String')) returns contents of edit_amplituda4 as a double
global amplitude;

amplitude(4) = str2double(get(handles.edit_amplituda4,'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_amplituda4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_amplituda4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function edit_amplituda5_Callback(hObject, eventdata, handles)
% hObject    handle to edit_amplituda5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_amplituda5 as text
%        str2double(get(hObject,'String')) returns contents of edit_amplituda5 as a double
global amplitude;

amplitude(5) = str2double(get(handles.edit_amplituda5,'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_amplituda5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_amplituda5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function edit_amplituda6_Callback(hObject, eventdata, handles)
% hObject    handle to edit_amplituda6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_amplituda6 as text
%        str2double(get(hObject,'String')) returns contents of edit_amplituda6 as a double
global amplitude;

amplitude(6) = str2double(get(handles.edit_amplituda6,'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_amplituda6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_amplituda6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


end
function edit_amplituda7_Callback(hObject, eventdata, handles)
% hObject    handle to edit_amplituda7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit_amplituda7 as text
%        str2double(get(hObject,'String')) returns contents of edit_amplituda7 as a double
global amplitude;

amplitude(7) = str2double(get(handles.edit_amplituda7,'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_amplituda7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_amplituda7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function edit_amplituda8_Callback(hObject, eventdata, handles)
% hObject    handle to edit_amplituda8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_amplituda8 as text
%        str2double(get(hObject,'String')) returns contents of edit_amplituda8 as a double

global amplitude;

amplitude(8) = str2double(get(handles.edit_amplituda8,'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_amplituda8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_amplituda8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_frekvencija2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_frekvencija2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_frekvencija2 as text
%        str2double(get(hObject,'String')) returns contents of edit_frekvencija2 as a double
global frekvencije;
frekvencije(2) = str2double(get(handles.edit_frekvencija2, 'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_frekvencija2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_frekvencija2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function edit_frekvencija3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_frekvencija3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit_frekvencija3 as text
%        str2double(get(hObject,'String')) returns contents of edit_frekvencija3 as a double
global frekvencije;
frekvencije(3) = str2double(get(handles.edit_frekvencija3, 'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_frekvencija3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_frekvencija3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function edit_frekvencija4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_frekvencija4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit_frekvencija4 as text
%        str2double(get(hObject,'String')) returns contents of edit_frekvencija4 as a double
global frekvencije;

frekvencije(4) = str2double(get(handles.edit_frekvencija4, 'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_frekvencija4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_frekvencija4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end
function edit_frekvencija5_Callback(hObject, eventdata, handles)
% hObject    handle to edit_frekvencija5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_frekvencija5 as text
%        str2double(get(hObject,'String')) returns contents of edit_frekvencija5 as a double
global frekvencije;

frekvencije(5) = str2double(get(handles.edit_frekvencija5, 'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_frekvencija5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_frekvencija5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function edit_frekvencija6_Callback(hObject, eventdata, handles)
% hObject    handle to edit_frekvencija6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_frekvencija6 as text
%        str2double(get(hObject,'String')) returns contents of edit_frekvencija6 as a double
global frekvencije;

frekvencije(6) = str2double(get(handles.edit_frekvencija6, 'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_frekvencija6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_frekvencija6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function edit_frekvencija7_Callback(hObject, eventdata, handles)
% hObject    handle to edit_frekvencija7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_frekvencija7 as text
%        str2double(get(hObject,'String')) returns contents of edit_frekvencija7 as a double
global frekvencije;

frekvencije(7) = str2double(get(handles.edit_frekvencija7, 'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_frekvencija7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_frekvencija7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_frekvencija8_Callback(hObject, eventdata, handles)
% hObject    handle to edit_frekvencija8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_frekvencija8 as text
%        str2double(get(hObject,'String')) returns contents of edit_frekvencija8 as a double

global frekvencije;

frekvencije(8) = str2double(get(handles.edit_frekvencija8, 'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_frekvencija8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_frekvencija8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_brojimpulsa2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_brojimpulsa2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_brojimpulsa2 as text
%        str2double(get(hObject,'String')) returns contents of edit_brojimpulsa2 as a double
global brojevi_impulsa;

brojevi_impulsa(2) = str2double(get(handles.edit_brojimpulsa2, 'String'));
end

% --- Executes during object creation, after setting all properties.
function edit_brojimpulsa2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_brojimpulsa2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_brojimpulsa3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_brojimpulsa3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_brojimpulsa3 as text
%        str2double(get(hObject,'String')) returns contents of edit_brojimpulsa3 as a double

global brojevi_impulsa;

brojevi_impulsa(3) = str2double(get(handles.edit_brojimpulsa3, 'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_brojimpulsa3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_brojimpulsa3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_brojimpulsa4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_brojimpulsa4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_brojimpulsa4 as text
%        str2double(get(hObject,'String')) returns contents of edit_brojimpulsa4 as a double

global brojevi_impulsa;

brojevi_impulsa(4) = str2double(get(handles.edit_brojimpulsa4, 'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_brojimpulsa4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_brojimpulsa4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_brojimpulsa5_Callback(hObject, eventdata, handles)
% hObject    handle to edit_brojimpulsa5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_brojimpulsa5 as text
%        str2double(get(hObject,'String')) returns contents of edit_brojimpulsa5 as a double
global brojevi_impulsa;

brojevi_impulsa(5) = str2double(get(handles.edit_brojimpulsa5, 'String'));
end

% --- Executes during object creation, after setting all properties.
function edit_brojimpulsa5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_brojimpulsa5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_brojimpulsa6_Callback(hObject, eventdata, handles)
% hObject    handle to edit_brojimpulsa6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_brojimpulsa6 as text
%        str2double(get(hObject,'String')) returns contents of edit_brojimpulsa6 as a double

global brojevi_impulsa;

brojevi_impulsa(6) = str2double(get(handles.edit_brojimpulsa6, 'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_brojimpulsa6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_brojimpulsa6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_brojimpulsa7_Callback(hObject, eventdata, handles)
% hObject    handle to edit_brojimpulsa7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_brojimpulsa7 as text
%        str2double(get(hObject,'String')) returns contents of edit_brojimpulsa7 as a double
global brojevi_impulsa;

brojevi_impulsa(7) = str2double(get(handles.edit_brojimpulsa7, 'String'));
end

% --- Executes during object creation, after setting all properties.
function edit_brojimpulsa7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_brojimpulsa7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function edit_brojimpulsa8_Callback(hObject, eventdata, handles)
% hObject    handle to edit_brojimpulsa8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_brojimpulsa8 as text
%        str2double(get(hObject,'String')) returns contents of edit_brojimpulsa8 as a double
global brojevi_impulsa;

brojevi_impulsa(8) = str2double(get(handles.edit_brojimpulsa8, 'String'));
end

% --- Executes during object creation, after setting all properties.
function edit_brojimpulsa8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_brojimpulsa8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_sirinaimpulsa2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sirinaimpulsa2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sirinaimpulsa2 as text
%        str2double(get(hObject,'String')) returns contents of edit_sirinaimpulsa2 as a double
global sirine_impulsa;

sirine_impulsa(2) = str2double(get(handles.edit_sirinaimpulsa2, 'String'));
end

% --- Executes during object creation, after setting all properties.
function edit_sirinaimpulsa2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sirinaimpulsa2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_sirinaimpulsa3_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sirinaimpulsa3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sirinaimpulsa3 as text
%        str2double(get(hObject,'String')) returns contents of edit_sirinaimpulsa3 as a double
global sirine_impulsa;

sirine_impulsa(3) = str2double(get(handles.edit_sirinaimpulsa3, 'String'));
end

% --- Executes during object creation, after setting all properties.
function edit_sirinaimpulsa3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sirinaimpulsa3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_sirinaimpulsa4_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sirinaimpulsa4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sirinaimpulsa4 as text
%        str2double(get(hObject,'String')) returns contents of edit_sirinaimpulsa4 as a double

global sirine_impulsa;

sirine_impulsa(4) = str2double(get(handles.edit_sirinaimpulsa4, 'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_sirinaimpulsa4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sirinaimpulsa4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

function edit_sirinaimpulsa5_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sirinaimpulsa5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sirinaimpulsa5 as text
%        str2double(get(hObject,'String')) returns contents of edit_sirinaimpulsa5 as a double
global sirine_impulsa;

sirine_impulsa(5) = str2double(get(handles.edit_sirinaimpulsa5, 'String'));
end

% --- Executes during object creation, after setting all properties.
function edit_sirinaimpulsa5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sirinaimpulsa5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_sirinaimpulsa6_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sirinaimpulsa6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sirinaimpulsa6 as text
%        str2double(get(hObject,'String')) returns contents of edit_sirinaimpulsa6 as a double
global sirine_impulsa;

sirine_impulsa(6) = str2double(get(handles.edit_sirinaimpulsa6, 'String'));
end

% --- Executes during object creation, after setting all properties.
function edit_sirinaimpulsa6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sirinaimpulsa6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_sirinaimpulsa7_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sirinaimpulsa7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sirinaimpulsa7 as text
%        str2double(get(hObject,'String')) returns contents of edit_sirinaimpulsa7 as a double

global sirine_impulsa;

sirine_impulsa(7) = str2double(get(handles.edit_sirinaimpulsa7, 'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_sirinaimpulsa7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sirinaimpulsa7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit_sirinaimpulsa8_Callback(hObject, eventdata, handles)
% hObject    handle to edit_sirinaimpulsa8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_sirinaimpulsa8 as text
%        str2double(get(hObject,'String')) returns contents of edit_sirinaimpulsa8 as a double

global sirine_impulsa;

sirine_impulsa(8) = str2double(get(handles.edit_sirinaimpulsa8, 'String'));
end
% --- Executes during object creation, after setting all properties.
function edit_sirinaimpulsa8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_sirinaimpulsa8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
