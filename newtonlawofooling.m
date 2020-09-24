function varargout = newtonlawofooling(varargin)
% NEWTONLAWOFOOLING M-file for newtonlawofooling.fig
%      NEWTONLAWOFOOLING, by itself, creates a new NEWTONLAWOFOOLING or raises the existing
%      singleton*.
%
%      H = NEWTONLAWOFOOLING returns the handle to a new NEWTONLAWOFOOLING or the handle to
%      the existing singleton*.
%
%      NEWTONLAWOFOOLING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEWTONLAWOFOOLING.M with the given input arguments.
%
%      NEWTONLAWOFOOLING('Property','Value',...) creates a new NEWTONLAWOFOOLING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before newtonlawofooling_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to newtonlawofooling_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help newtonlawofooling

% Last Modified by GUIDE v2.5 22-Sep-2019 12:08:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @newtonlawofooling_OpeningFcn, ...
                   'gui_OutputFcn',  @newtonlawofooling_OutputFcn, ...
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


% --- Executes just before newtonlawofooling is made visible.
function newtonlawofooling_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to newtonlawofooling (see VARARGIN)

% Choose default command line output for newtonlawofooling
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes newtonlawofooling wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = newtonlawofooling_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in homepage.
function homepage_Callback(hObject, eventdata, handles)
% hObject    handle to homepage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open project.fig
close newtonlawofooling

% --- Executes on button press in previouspage.
function previouspage_Callback(hObject, eventdata, handles)
% hObject    handle to previouspage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open project1.fig
close newtonlawofooling

function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run newtonsprediction


% --- Executes during object creation, after setting all properties.
function oo1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oo1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
imshow('newtonmodel.jpg');

% Hint: place code in OpeningFcn to populate oo1


% --- Executes during object creation, after setting all properties.
function oo2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to oo2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
imshow('solved_newtonmodel.jpg')

% Hint: place code in OpeningFcn to populate oo2


% --- Executes when uipanel1 is resized.
function uipanel1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Home_Callback(hObject, eventdata, handles)
% hObject    handle to Home (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open project.fig
close newtonlawofooling

% --------------------------------------------------------------------
function previous_Callback(hObject, eventdata, handles)
% hObject    handle to previous (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open project1.fig
close newtonlawofooling


% --------------------------------------------------------------------
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choice = questdlg('Would you like to Exit?', ...
	'Exit', ...
	'Yes','No','No Please');
% Handle response
switch choice
    case 'Yes'
        close newtonlawofooling
        uiwait(msgbox('THANKS FOR USING THIS PROGRAM','THANKS'))
    case 'No'
        
    otherwise 
        
end
