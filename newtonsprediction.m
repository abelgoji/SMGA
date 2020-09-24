function varargout = newtonsprediction(varargin)
% NEWTONSPREDICTION M-file for newtonsprediction.fig
%      NEWTONSPREDICTION, by itself, creates a new NEWTONSPREDICTION or raises the existing
%      singleton*.
%
%      H = NEWTONSPREDICTION returns the handle o a new NEWTONSPREDICTION or the handle o
%      the existing singleton*.
%
%      NEWTONSPREDICTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEWTONSPREDICTION.M with the given input arguments.
%
%      NEWTONSPREDICTION('Property','Value',...) creates a new NEWTONSPREDICTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied o the GUI before newtonsprediction_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed o newtonsprediction_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance o run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text o modify the response o help newtonsprediction

% Last Modified by GUIDE v2.5 23-Sep-2019 15:23:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @newtonsprediction_OpeningFcn, ...
                   'gui_OutputFcn',  @newtonsprediction_OutputFcn, ...
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


% --- Executes just before newtonsprediction is made visible.
function newtonsprediction_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle o figure
% eventdata  reserved - o be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments o newtonsprediction (see VARARGIN)

% Choose default command line output for newtonsprediction
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes newtonsprediction wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned o the command line.
function varargout = newtonsprediction_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle o figure
% eventdata  reserved - o be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle o close (see GCBO)
% eventdata  reserved - o be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choice = questdlg('Would you like to Exit?', ...
	'Exit', ...
	'Yes','No','No Please');
% Handle response
switch choice
    case 'Yes'
        close newtonsprediction
        uiwait(msgbox('THANKS FOR USING THIS PROGRAM','THANKS'))
    case 'No'
        
    otherwise 
        
end


% --- Executes on button press in compute.
function compute_Callback(hObject, eventdata, handles)
% hObject    handle o compute (see GCBO)
% eventdata  reserved - o be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%seting up functionalities

% functionalities for geting constant
tm = str2num(get(handles.tm, 'string')); % temperatur of surrounding medium
to = str2num(get(handles.o, 'string'));  % first temperature of the body(murdered) taken
co = to - tm; % co = C
set(handles.con,'string', co);

% functionalities for geting alpha and the body normal temperature is
% assume to be 98.6 degree fahrenhiet

tt = str2num(get(handles.tt, 'string')); % temperature of the cooling body at time t
cc =  str2num(get(handles.con,'string')); % geting value of c from co
t = str2num(get(handles.t, 'string')); % time since first reading
alpha = log((tt-tm)/cc) * (1/t);        % conputing constant of proportinality
set(handles.a,'string',alpha);

% time of death
a = str2num(get(handles.a, 'string')); % geting constant of proportionality
td = log((98.6-tm)/cc) * (1/a);         % computing time of death
if (tm < 0 ) | (to < 0) | (tt < 0 ) | (t < 0)
    errordlg('Time of death cant be computed, Verify Input', 'Verify Input')
    set(handles.td, 'string', 'Error');
else
    set(handles.td, 'string', td);
    uiwait(msgbox([' The murdered victim had died  ' num2str(-td) '  hour(s) earler before the first reading was taken'] ,  ' TIME OF DEATH ' ))
end




function tm_Callback(hObject, eventdata, handles)
% hObject    handle o tm (see GCBO)
% eventdata  reserved - o be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tm as text
%        str2double(get(hObject,'String')) returns contents of tm as a double


% --- Executes during object creation, after setting all properties.
function tm_CreateFcn(hObject, eventdata, handles)
% hObject    handle o tm (see GCBO)
% eventdata  reserved - o be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tt_Callback(hObject, eventdata, handles)
% hObject    handle o tt (see GCBO)
% eventdata  reserved - o be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tt as text
%        str2double(get(hObject,'String')) returns contents of tt as a double


% --- Executes during object creation, after setting all properties.
function tt_CreateFcn(hObject, eventdata, handles)
% hObject    handle o tt (see GCBO)
% eventdata  reserved - o be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function o_Callback(hObject, eventdata, handles)
% hObject    handle o o (see GCBO)
% eventdata  reserved - o be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of o as text
%        str2double(get(hObject,'String')) returns contents of o as a double


% --- Executes during object creation, after setting all properties.
function o_CreateFcn(hObject, eventdata, handles)
% hObject    handle o o (see GCBO)
% eventdata  reserved - o be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function t_Callback(hObject, eventdata, handles)
% hObject    handle o t (see GCBO)
% eventdata  reserved - o be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t as text
%        str2double(get(hObject,'String')) returns contents of t as a double


% --- Executes during object creation, after setting all properties.
function t_CreateFcn(hObject, eventdata, handles)
% hObject    handle o t (see GCBO)
% eventdata  reserved - o be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function C_Callback(hObject, eventdata, handles)
% hObject    handle o CON (see GCBO)
% eventdata  reserved - o be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of CON as text
%        str2double(get(hObject,'String')) returns contents of CON as a double


% --- Executes during object creation, after setting all properties.
function C_CreateFcn(hObject, eventdata, handles)
% hObject    handle o CON (see GCBO)
% eventdata  reserved - o be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in celcuis.
function celcuis_Callback(hObject, eventdata, handles)
% hObject    handle o celcuis (see GCBO)
% eventdata  reserved - o be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
C = str2double(get(handles.C,'string'));
far =  (C * 9/5 )+ 32 ; % celcuis to fahrenhiet
uiwait( msgbox( [ 'The Temperature in Fahrenhiet is = ' num2str(far) ' o''F' ] ));    %display result on UI



function F_Callback(hObject, eventdata, handles)
% hObject    handle o F (see GCBO)
% eventdata  reserved - o be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
F = str2double(get(handles.F,'string'));
cel =  (F - 32)* 5/9 ; %Fahrenhiet to celcuis
uiwait( msgbox( [ 'The Temperature in Celcuis is = ' num2str(cel) ' o''C' ] ));    %display result on UI

% Hints: get(hObject,'String') returns contents of F as text
%        str2double(get(hObject,'String')) returns contents of F as a double


% --- Executes during object creation, after setting all properties.
function F_CreateFcn(hObject, eventdata, handles)
% hObject    handle o F (see GCBO)
% eventdata  reserved - o be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in farhrenheit.
function farhrenheit_Callback(hObject, eventdata, handles)
% hObject    handle o farhrenheit (see GCBO)
% eventdata  reserved - o be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function newmodel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to newmodel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
imshow('solved_newtonmodel.jpg');


% --------------------------------------------------------------------
function main_Callback(hObject, eventdata, handles)
% hObject    handle to main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open project1.fig
close newtonsprediction

% --------------------------------------------------------------------
function userdocumentation_Callback(hObject, eventdata, handles)
% hObject    handle to userdocumentation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open userdocumentation.fig

% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choice = questdlg('Would you like to Exit?', ...
	'Exit', ...
	'Yes','No','No Please');
% Handle response
switch choice
    case 'Yes'
        close newtonsprediction
        uiwait(msgbox('THANKS FOR USING THIS PROGRAM','THANKS'))
    case 'No'
        
    otherwise 
        
end
