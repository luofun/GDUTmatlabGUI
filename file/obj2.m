function varargout = obj2(varargin)
% OBJ2 MATLAB code for obj2.fig
%      OBJ2, by itself, creates a new OBJ2 or raises the existing
%      singleton*.
%
%      H = OBJ2 returns the handle to a new OBJ2 or the handle to
%      the existing singleton*.
%
%      OBJ2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OBJ2.M with the given input arguments.
%
%      OBJ2('Property','Value',...) creates a new OBJ2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before obj2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to obj2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help obj2

% Last Modified by GUIDE v2.5 09-Jan-2016 16:25:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @obj2_OpeningFcn, ...
                   'gui_OutputFcn',  @obj2_OutputFcn, ...
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


% --- Executes just before obj2 is made visible.
function obj2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to obj2 (see VARARGIN)

% Choose default command line output for obj2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
T = timer('Period',1.0,'ExecutionMode','FixedRate', 'TimerFcn',{@onTimer,[handles.text1,handles.text2]});
start(T);
% UIWAIT makes obj2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = obj2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    syms x;
    g = str2num(['@(x)',get(handles.edit2,'String')]);
    N=8;                         %原离散信号有8点
    n=[0:1:N-1]                  %原信号是1行8列的矩阵
    xn=g(n);                   %构建原始信号，为指数信号
    w=[-800:1:800]*4*pi/800;     %频域共-800----+800 的长度（本应是无穷，高频分量很少，故省去）
    X=xn*exp(-j*(n'*w));    %求dtft变换，采用原始定义的方法，对复指数分量求和而得
    axes(handles.axes1); 
    stem(n,xn);
    title('原始信号');
    axes(handles.axes2);
    plot(w/pi,abs(X));
    title('DTFT变换');
catch
    errordlg('函数输入错了','再输一次吧');
end
guidata(hObject, handles);


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
guitext;
