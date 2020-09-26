function varargout = EEG_CAPTURE_TOOL(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EEG_CAPTURE_TOOL_OpeningFcn, ...
                   'gui_OutputFcn',  @EEG_CAPTURE_TOOL_OutputFcn, ...
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


% --- Executes just before EEG_CAPTURE_TOOL is made visible.
function EEG_CAPTURE_TOOL_OpeningFcn(hObject, eventdata, handles, varargin)

% Choose default command line output for EEG_CAPTURE_TOOL
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EEG_CAPTURE_TOOL wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EEG_CAPTURE_TOOL_OutputFcn(hObject, eventdata, handles)

% Get default command line output from handles structure
varargout{1} = handles.output;



function sub_txtbox_Callback(hObject, eventdata, handles)
% hObject    handle to sub_txtbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sub_txtbox as text
%        str2double(get(hObject,'String')) returns contents of sub_txtbox as a double


% --- Executes during object creation, after setting all properties.
function sub_txtbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sub_txtbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btn_cap.
function btn_cap_Callback(hObject, eventdata, handles)
% Get Data From Edit Text
duration = str2num(get(handles.time_txtbox,'String'));
duration = duration * 512;
userInput = get(handles.sub_txtbox,'String');

% Initiate Neurosky Library
data = zeros(1,duration); %holder for EEG capture duration

portNum = 3;
comPortName1 = sprintf('\\\\.\\COM%d', portNum);
TG_BAUD_57600 = 57600;
TG_STREAM_PACKETS = 0;
TG_DATA_RAW = 4;
loadlibrary('Thinkgear.dll');

connectionId1 = calllib('Thinkgear', 'TG_GetNewConnectionId');
error_check(connectionId1, comPortName1,TG_BAUD_57600,TG_STREAM_PACKETS)

get_eeg_data(duration,data, connectionId1, TG_DATA_RAW, userInput)



% --- Executes on button press in btn_disconnect.
function btn_disconnect_Callback(hObject, eventdata, handles)
global StopState;
StopState = 1;


function error_check(connectionId, comPortName1,TG_BAUD_57600,TG_STREAM_PACKETS)
    if ( connectionId < 0 )
    error( sprintf( 'ERROR: TG_GetNewConnectionId() returned %d.\n', connectionId ) );
    end;

    % Set/open stream (raw bytes) log file for connection
    errCode = calllib('Thinkgear', 'TG_SetStreamLog', connectionId, 'streamLog.txt' );
    if( errCode < 0 )
        error( sprintf( 'ERROR: TG_SetStreamLog() returned %d.\n', errCode ) );
    end;

    % Set/open data (ThinkGear values) log file for connection
    errCode = calllib('Thinkgear', 'TG_SetDataLog', connectionId, 'dataLog.txt' );
    if( errCode < 0 )
        error( sprintf( 'ERROR: TG_SetDataLog() returned %d.\n', errCode ) );
    end;

    % Attempt to connect the connection ID handle to serial port "COM3"
    errCode = calllib('Thinkgear', 'TG_Connect',  connectionId,comPortName1,TG_BAUD_57600,TG_STREAM_PACKETS );
    if ( errCode < 0 )
        error( sprintf( 'ERROR: TG_Connect() returned %d.\n', errCode ) );
    end

    fprintf( 'Connected.  Reading Packets...\n' );

function get_eeg_data(duration, data, connectionId, TG_DATA_RAW, userInput)
    global StopState;
    StopState = 0;
    j = 0;
    i = 0;
    while (i < duration)   %loop for 20 seconds
        if (calllib('Thinkgear','TG_ReadPackets',connectionId,1) == 1)   %if a packet was read...

            if (calllib('Thinkgear','TG_GetValueStatus',connectionId,TG_DATA_RAW) ~= 0)   %if RAW has been updated 
                j = j + 1;
                i = i + 1;
                data(j) = calllib('Thinkgear','TG_GetValue',connectionId,TG_DATA_RAW);
                total(i) = calllib('Thinkgear','TG_GetValue',connectionId,TG_DATA_RAW);
            end
        end


        if (j == 256)
            handles.data = data;
            plot(handles.data)
            axis([0 255 -2000 2000])
            drawnow;            %plot the data, update every .5 seconds (256 points)
            j = 0;
        end

        if StopState == 1
            assignin('base', userInput, total);
            calllib('Thinkgear', 'TG_FreeConnection', connectionId );
            break;
        end

    end

    assignin('base', userInput, total);
    calllib('Thinkgear', 'TG_FreeConnection', connectionId );
        



function time_txtbox_Callback(hObject, eventdata, handles)
% hObject    handle to time_txtbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of time_txtbox as text
%        str2double(get(hObject,'String')) returns contents of time_txtbox as a double


% --- Executes during object creation, after setting all properties.
function time_txtbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time_txtbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
