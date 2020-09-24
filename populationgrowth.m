function varargout = populationgrowth(varargin)
% POPULATIONGROWTH M-file for populationgrowth.fig
%      POPULATIONGROWTH, by itself, creates a new POPULATIONGROWTH or raises the existing
%      singleton*.
%
%      H = POPULATIONGROWTH returns the handle to a new POPULATIONGROWTH or the handle to
%      the existing singleton*.
%
%      POPULATIONGROWTH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in POPULATIONGROWTH.M with the given input arguments.
%
%      POPULATIONGROWTH('Property','Value',...) creates a new POPULATIONGROWTH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before populationgrowth_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to populationgrowth_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help populationgrowth

% Last Modified by GUIDE v2.5 26-Sep-2019 23:04:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @populationgrowth_OpeningFcn, ...
                   'gui_OutputFcn',  @populationgrowth_OutputFcn, ...
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


% --- Executes just before populationgrowth is made visible.
function populationgrowth_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to populationgrowth (see VARARGIN)

% Choose default command line output for populationgrowth
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes populationgrowth wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = populationgrowth_OutputFcn(hObject, eventdata, handles) 
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
open project.fig;
close populationgrowth;

% --- Executes on button press in previouspage.
function previouspage_Callback(hObject, eventdata, handles)
% hObject    handle to previouspage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open project1.fig;
close populationgrowth;


% --- Executes on mouse press over axes background.
function versultmodel_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to versultmodel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function versultmodel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to versultmodel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate axes3
imshow('vmm.jpg')

% --- Executes on button press in axes3.
function solve_Callback(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imshow('solved.jpg')

% --- Executes on button press in predict.
function predict_Callback(hObject, eventdata, handles)
% hObject    handle to predict (see GCBO) eventdata  reserved - to be
% defined in a future version of MATLAB handles    structure with handles
% and user data (see GUIDATA)
close populationgrowth
run population_prediction

% --- Executes on button press in more.
function more_Callback(hObject, eventdata, handles)
% hObject    handle to more (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close populationgrowth;
open moreaboutverhulst.fig;


% --------------------------------------------------------------------
function main_Callback(hObject, eventdata, handles)
% hObject    handle to main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close populationgrowth;
run project1;

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
        close populationgrowth
        uiwait(msgbox('THANKS FOR USING THIS PROGRAM','THANKS'))
    case 'No'
        
    otherwise 
        
end

% --------------------------------------------------------------------
function user_Callback(hObject, eventdata, handles)
% hObject    handle to user (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run userdocumentation;
