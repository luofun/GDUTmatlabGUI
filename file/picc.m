function varargout = picc(varargin)
% PICC MATLAB code for picc.fig
%      PICC, by itself, creates a new PICC or raises the existing
%      singleton*.
%
%      H = PICC returns the handle to a new PICC or the handle to
%      the existing singleton*.
%
%      PICC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PICC.M with the given input arguments.
%
%      PICC('Property','Value',...) creates a new PICC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before picc_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to picc_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help picc

% Last Modified by GUIDE v2.5 09-Jan-2016 22:15:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @picc_OpeningFcn, ...
                   'gui_OutputFcn',  @picc_OutputFcn, ...
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


% --- Executes just before picc is made visible.
function picc_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to picc (see VARARGIN)

% Choose default command line output for picc
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
T = timer('Period',1.0,'ExecutionMode','FixedRate', 'TimerFcn',{@onTimer,[handles.text5,handles.text6]});
start(T);
% UIWAIT makes picc wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = picc_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname]=uigetfile(...
    {'*.bmp;*.jpg;*.png;*.jpeg','图象文件(*.bmp,*.jpg,*.png,*,jpeg)';...
    '*,*','所有文件(*.*)'}, ...
    '请示范图片文件');
if isequal(filename,0)||isequal(pathname,0)
    return;
end
SC=[pathname,filename];
A = imread(SC);
handles.img=A;
axes(handles.axes1);
imshow(A);
guidata(hObject, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
y = rgb2gray(handles.img);
axes(handles.axes2);
imshow(y);
k=im2bw(y);
axes(handles.axes3);
imshow(k);
guidata(hObject, handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
guitext;
