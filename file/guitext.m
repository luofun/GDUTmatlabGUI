function varargout = guitext(varargin)
% GUITEXT MATLAB code for guitext.fig
%      GUITEXT, by itself, creates a new GUITEXT or raises the existing
%      singleton*.
%
%      H = GUITEXT returns the handle to a new GUITEXT or the handle to
%      the existing singleton*.
%
%      GUITEXT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUITEXT.M with the given input arguments.
%
%      GUITEXT('Property','Value',...) creates a new GUITEXT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guitext_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guitext_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guitext

% Last Modified by GUIDE v2.5 09-Jan-2016 14:46:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guitext_OpeningFcn, ...
                   'gui_OutputFcn',  @guitext_OutputFcn, ...
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


% --- Executes just before guitext is made visible.
function guitext_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guitext (see VARARGIN)

% Choose default command line output for guitext
handles.output = hObject;
ha=axes('units','normalized','position',[0 0 1 1]);
uistack(ha,'down');
II=imread('ico1.png');
image(II);
colormap gray;
set(ha,'handlevisibility','off','visible','off');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guitext wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guitext_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in lti.
function lti_Callback(hObject, eventdata, handles)
% hObject    handle to lti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(guitext,'Visible','off');
obj1;

% --- Executes on button press in laplace.
function laplace_Callback(hObject, eventdata, handles)
% hObject    handle to laplace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(guitext,'Visible','off');
obj3;

% --- Executes on button press in fft.
function fft_Callback(hObject, eventdata, handles)
% hObject    handle to fft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(guitext,'Visible','off');
obj2;

% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['退出 '  '?'],...
                     ['退出 ' ],...
                     '是','否','是');
if strcmp(selection,'否')
    return;
else
    close all;
    clc;
end


%close all;

% --- Executes on button press in pic.
function pic_Callback(hObject, eventdata, handles)
% hObject    handle to pic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(guitext,'Visible','off');
picc;

% --- Executes on button press in sound.
function sound_Callback(hObject, eventdata, handles)
% hObject    handle to sound (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(guitext,'Visible','off');
mp;

% --- Executes on button press in say.
function say_Callback(hObject, eventdata, handles)
% hObject    handle to say (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(guitext,'Visible','off');
luo;
