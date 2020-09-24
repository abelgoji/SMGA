function varargout = moreaboutverhulst(varargin)
% MOREABOUTVERHULST MATLAB code for moreaboutverhulst.fig
%      MOREABOUTVERHULST, by itself, creates a new MOREABOUTVERHULST or raises the existing
%      singleton*.
%
%      H = MOREABOUTVERHULST returns the handle to a new MOREABOUTVERHULST or the handle to
%      the existing singleton*.
%
%      MOREABOUTVERHULST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MOREABOUTVERHULST.M with the given input arguments.
%
%      MOREABOUTVERHULST('Property','Value',...) creates a new MOREABOUTVERHULST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before moreaboutverhulst_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to moreaboutverhulst_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help moreaboutverhulst

% Last Modified by GUIDE v2.5 22-Sep-2019 11:44:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @moreaboutverhulst_OpeningFcn, ...
                   'gui_OutputFcn',  @moreaboutverhulst_OutputFcn, ...
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


% --- Executes just before moreaboutverhulst is made visible.
function moreaboutverhulst_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to moreaboutverhulst (see VARARGIN)

% Choose default command line output for moreaboutverhulst
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes moreaboutverhulst wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = moreaboutverhulst_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes during object creation, after setting all properties.
function graph_CreateFcn(hObject, eventdata, handles)
% hObject    handle to graph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
imshow('graph.jpg')
% Hint: place code in OpeningFcn to populate graph


% --------------------------------------------------------------------
function main_Callback(hObject, eventdata, handles)
% hObject    handle to main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close moreaboutverhulst;
open project1.fig


% --------------------------------------------------------------------
function previous_Callback(hObject, eventdata, handles)
% hObject    handle to previous (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close moreaboutverhulst;
open populationgrowth.fig
