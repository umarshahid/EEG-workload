function prevstate = mcolonops(state)
% overload MATLAB colon operator with multi-colon capability 
%
% mcolonops(STATE) where STATE is
%   'colon' 'off' 'matlab' : Set to Matlab original COLON mode.
% 	'mcolon' 'on' 'compatible': mcolon "compatible" mode, similar results
%       to Matlab colon returned when invoking with scalar inputs.
% 	'fullmcolon': full mcolon mode, arrays will be generated by MCOLON
%        engine in all configurations.
%
% INQUIRING: prevstate = mcolonops(...) return the current state before
%                                       the new state is set.
%
% See also: colon, mcolon, mcolsettol
%
% Author: Bruno Luong <brunoluong@yahoo.com>
% Last update: 31/December/2010

persistent OVERLOADCOLON_STATE
persistent OVERLOAD_PATH

if isempty(OVERLOADCOLON_STATE)
    OVERLOADCOLON_STATE = 'colon';
end
if nargout>=1 || nargin<1
    prevstate = OVERLOADCOLON_STATE; % Return the previous state
end

if nargin>=1
    if ~isempty(OVERLOAD_PATH)
        try
            rmpath(OVERLOAD_PATH);
        catch %#ok
            warning('mcolon:rmpath', ...
                    'mcolonops can''t remove path %s', OVERLOAD_PATH);
        end
        OVERLOADCOLON_STATE = 'colon';
        OVERLOAD_PATH = '';
    end
    
    bsxopsroot = fileparts(mfilename('fullpath'));
    switch lower(state)
        case {'c' 'colon' 'off' 'matlab'}
        case {'m' 'mc' 'mcolon' 'on' 'compatible'}
            OVERLOADCOLON_STATE = 'mcolon';
            OVERLOAD_PATH = [bsxopsroot '/overload/compatible'];
            addpath(OVERLOAD_PATH);
        case {'f' 'fullmcolon'}
            OVERLOADCOLON_STATE = 'fullmcolon';
            OVERLOAD_PATH = [bsxopsroot '/overload/fullmcolon'];
            addpath(OVERLOAD_PATH);
        otherwise
            error('mcolonops: unknown state <%s>', state);
    end
end

% Prevent the persistent variable to be cleared
mlock;

end