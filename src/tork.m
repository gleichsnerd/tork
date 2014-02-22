% TORK: Revenge of the Final Project
% FINAL VERSION - 12/11/12
% Adam Gleichsner (amg188) and Gabby Gutierrez (gmg58)


% Currently, the majority of the foundations of the game are present,
% including the text-based GUI, command analysis, navigation through
% a storyboard, and save/load.

% Basic commands:
%      directions (north, south, east, west)
%      input/output (load, save)
%      CLC equivalent (clear)
%      Quit game (exit)

% Things that need work:
%   -GUI resizing & multiple commands
%   -Keyword database
%   -The text border from hell
%   -Inventory system

function tork()

    %Greetings, fellow coder!
    
    curpos = [8,4];
    global inputText fLines static story title environment beenThereBool items ifTaken monsters dirRest restDet edit;
    
    newstory;
    
    f = figure('Position', [1 1 800 400], 'Visible', 'off', 'MenuBar', 'none', 'Name', 'TORK: Revenge of the Final Project');
    set(f, 'Color', 'black')%, 'ResizeFcn', @resize);
    movegui(f, 'center')
    
    totLines = 35;
    lineJump = 5;
    
    
    for i = 1:totLines
        fLines{i} = [char(10)];
    end
    
    
    fLines{3} = '    Welcome to Tork®, the ultimate final project RPG!';
    fLines{7} = '    Type in a direction such as "north" or "east" to navigate,';
    fLines{9} = '    or type in "save" or "load" to maintain your progress.';
    
    fLines{12} = '    Enjoy!';
    
    fLines{17} = 'You wake up in a meadow with no recollection of how you got there';
    fLines{19} = 'nor why you were even so tired to fall asleep in the most random of places.';
    
    fLines{22} = 'May I suggest going south?';
    
    screenText = '';
    
    for i = 1:totLines
        screenText = [screenText, fLines{i}];
    end
    
            
    static = uicontrol('Style', 'text', 'Position', [1 50 800 350], 'String', screenText);
    edit = uicontrol('Style', 'edit',  'Position', [1 1 800 50], 'KeyPressFcn', @enterKey);
    
    set(static, 'BackgroundColor', 'black', 'ForegroundColor', 'white', 'HorizontalAlignment', 'left');
    set(edit, 'BackgroundColor', 'black', 'ForegroundColor', 'white', 'HorizontalAlignment', 'left');
    
    set(f, 'Visible', 'on');
    
    function resize(source, event)
       fPos = get(f, 'Position'); 
       fH = fPos(4);
       fW = fPos(3);
       set(static, 'Position', [5, 1, fW - 10, fH]);
       set(edit, 'Position', [5, 1, fW - 10, 50]);
       iptsetpref('ImshowBorder','tight');
    end

    function enterKey(source, event)
            keyCheck = get(f, 'CurrentCharacter');
            outputText = '';
            inputText = '';
        
            if isequal(keyCheck, 13 )%  keyCheck == 13
                pause(.01);
                inputText = get(edit, 'String');
                if strcmp(inputText, 'save')
                    saveFunc(curpos);
                    outputText = 'Saved!';
                elseif strcmp(inputText, 'load')
                    curpos = loadFunc;
                    outputText = 'Loaded!';
                elseif strcmp(inputText, 'clear')
                    for i = 1:totLines
                        fLines{i} = [char(10)];
                    end
                elseif strcmp(inputText, 'exit')
                    close all;
                elseif strcmp(inputText, 'curpos')
                    outputText = [num2str(curpos(1)), ', ', num2str(curpos(2))];
                else
                    [outputText, curpos] = command2(inputText, curpos);
                    %lineJump = length(environment{curpos(1,1), curpos(1,2)}{1,1});
                end 
                    %for i = 1:29%totLines - (lineJump)
                    %    fLines{i} = fLines{i + lineJump};
                    %end
                    
                    %fLines{totLines - lineJump + 1} = ['>>', inputText, char(10)];
                    %fLines{totLines - lineJump + 2} = [outputText, char(10)];
                    
                    for i = 1:totLines
                        fLines{i} =  [char(10)];
                    end
                    
                    fLines{15} = ['>>', inputText, char(10)];
                    fLines{17} = [outputText, char(10)];
                    
                    screenText = '';
                    
                    for i = 1:totLines
                        screenText = [screenText, fLines{i}];
                    end
                    
                    set(static, 'String', screenText);
                    set(edit, 'String', '');
            end
    end

end

