function varargout = population_prediction(varargin)
% POPULATION_PREDICTION M-file for population_prediction.fig

% Last Modified by GUIDE v2.5 26-Sep-2019 20:02:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @population_prediction_OpeningFcn, ...
                   'gui_OutputFcn',  @population_prediction_OutputFcn, ...
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


% --- Executes just before population_prediction is made visible.
function population_prediction_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to population_prediction (see VARARGIN)

% Choose default command line output for population_prediction
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes population_prediction wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = population_prediction_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


function close_Callback(hObject, eventdata, handles)
close population_prediction

% --- Executes on button press in computepopu.

%creating No - initial population
function No_Callback(hObject, eventdata, handles)
% hObject    handle to No (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of No as text
%        str2double(get(hObject,'String')) returns contents of No as a double


% --- Executes during object creation, after setting all properties.
function No_CreateFcn(hObject, eventdata, handles)
% hObject    handle to No (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



%creating Nt - population at time t
function Nt_Callback(hObject, eventdata, handles)

function Nt_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% creating k - carrying capacity
function k_Callback(hObject, eventdata, handles)

function k_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% creating t - time
function t_Callback(hObject, eventdata, handles)

function t_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


%creating r - growth rate
function r_Callback(hObject, eventdata, handles)

function r_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in growth_rate ;; computing growth rate.
function growth_rate_Callback(hObject, eventdata, handles)

% setting up functionalitites and getting inputed values using handles
No= str2double(get(handles.No, 'string'));  % current population at time 0
k = str2double(get(handles.k, 'string'));   % carrying capacity 
t = str2double(get(handles.t, 'string'));   % time
Nt= str2double(get(handles.Nt, 'string'));  % population at time t
% computing growth rate
if (Nt<=0) | (No<=0) | (k<=0)  | (t<=0) | (Nt<=No) ;
     errordlg('verify input:  negative  or zero input ', 'Invalid Input'); %negative exception
     set(handles.r,'string','err');
elseif (Nt>=k);
    errordlg(' Population at time t (Nt) cannot be greater the the carrying capacity (k)',' Verify Input')

    set(handles.r,'string','Err');
else
r = log((No*k-No*Nt)./(Nt*(k-No))) * (-1./t);% growth rate
set(handles.r,'string', r);
 end


% --- Executes during object creation, after setting all properties.
function solved_CreateFcn(hObject, eventdata, handles)
imshow('solved.jpg');

%creating tp - population at time t
function tp_Callback(hObject, eventdata, handles)

function tp_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in computepopu.
function computepopu_CreateFcn(hObject, eventdata, handles)
function population_Callback(hObject, eventdata, handles)
function computepopu_Callback(hObject, eventdata, handles)

% computing population for inputed time
% ------------------------------------------------------------------------------------------------------------------------------------
%functionalities for computing the population growth
tp = str2double(get(handles.tp, 'string')); % poppulation at time t inputed
No = str2double(get(handles.No, 'string')); 
k  = str2double(get(handles.k, 'string'));
r  = str2double(get(handles.r, 'string'));

Nt = round(((No * k)/((No + (k-No)*exp(-r*tp)))));

if (tp<0);
    errordlg('verify input:  negative input' , 'Invalid Input');
        set(handles.population,'string', 'Error');
else
    if (Nt)>=k
        uiwait(msgbox(['The population has already reached it carrying capacty  ' num2str(k) ' in ' num2str(tp)  ' years ']))
        set(handles.population,'string',Nt)
    else
    set(handles.population,'string', Nt);
    uiwait(msgbox(['The Population in  ' num2str(tp) , ' years is approximately =  ' num2str(Nt)]));
    end
    
end
% --- Executes during object creation, after setting all properties.
function population_CreateFcn(hObject, eventdata, handles)


if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)

close population_prediction;
run populationgrowth;

% computing time 
% ---------------------------------------------------------------------------------------------------------------------------------------

% --- Executes on button press in computetime.
function computetime_Callback(hObject, eventdata, handles)

pop = str2double(get(handles.population, 'string')); % population input
No = str2double(get(handles.No, 'string')); 
k  = str2double(get(handles.k, 'string'));
r  =  str2double(get(handles.r, 'string'));
tp = round((-1./r) .* log((No.*(k-pop))./(pop.*(k-No)))); % time
if  (pop<0) || (pop>=k) ;
    errordlg('verify input:  negative input or population exceed carrying capacity ', 'Invalid Input');
    set(handles.tp,'string', 'ERROR');
else
    if (tp<0)
         set(handles.tp,'string', 'ERROR');
        uiwait(msgbox('Population is less than current population ','VERIFY INPUT'))
    else
    set(handles.tp,'string', tp);
    uiwait(msgbox(['It will take ' num2str(tp) ' years for the population to approximately reach '  num2str(pop)]))
    end 
end


% ----------------------------------------------------------------------------------------------------------------------------------------------------------------
% ploting
% --- Executes on 'ok' button press in plot.
function plot_Callback(hObject, eventdata, handles)

int = inputdlg('Input Time in the form :- initial:interval: final e.g 0:1:10'  , ' Time RANGE ' );
x = str2num (int{1,1}); % time range
No = str2double(get(handles.No, 'string')); 
k  = str2double(get(handles.k, 'string'));
r  =  str2double(get(handles.r, 'string'));
Nt = (No.*k)./((No + (k-No).*exp(-r.*x)));

% making the plot
figure
plot(x,Nt,'-or');
grid on
title('Time(t) Against Population @ time t N(t)');
xlabel(' Time t');
ylabel( ' Population @ time t N(t)' ); 
legend(' Population Grwoth ' );
% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function main_Callback(hObject, eventdata, handles)
% hObject    handle to main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close population_prediction;
run project1;

% --------------------------------------------------------------------
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function userdocumentation_Callback(hObject, eventdata, handles)
% hObject    handle to userdocumentation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close population_prediction;
run userdocumentation;
