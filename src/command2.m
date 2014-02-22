function [outputText, curpos] = command2(inputText, curpos)

global story title environment beenThereBool items ifTaken monsters dirRest restDet edit;

[first, remain] = strtok(inputText);
a = 1 + 0:0;
tf = isequaln(remain, a);
if tf == 0
    tf2 = isspace(remain);
    remWords = find(tf2(find(tf2)));
    for i = 1:remWords(end)
    	[next, remain] = strtok(remain);
        word{i} = next;
    end
    [outputText, curpos] = processCMD(first, word, curpos);
else
    [outputText, curpos] = processCMD(first, curpos);
end
end


function [outputText, curpos] = processCMD(varargin)
    
    global story title environment beenThereBool items ifTaken monsters dirRest restDet edit;

    ouputText = ' ';
    directions = {'north', 'south', 'east', 'west', 'North', 'South', 'East', 'West', 'NORTH', 'SOUTH', 'EAST', 'WEST', 'N', 'S', 'E', 'W', 'n', 's', 'e', 'w', 'northeast' 'northwest' 'southeast' 'southwest' 'NORTHEAST' 'NORTHWEST' 'SOUTHEAST' 'SOUTHWEST' 'ne' 'nw' 'se' 'sw' 'NE' 'NW' 'SE' 'SW'};
    actions = {'look', 'open', 'take', 'attack', 'turn', 'read' 'Look' 'Open' 'Take' 'Turn' 'Attack' 'Read' 'LOOK' 'OPEN' 'TAKE' 'ATTACK' 'TURN' 'READ'};
    lantern = {'lantern' 'LANTERN' 'Lantern'};
    otherWords = {'the' 'of' 'THE' 'OF'};
    onOff = {'on' 'off' 'ON' 'OFF' 'On' 'Off'};

if nargin == 2
    curpos = varargin{2};
    compareDirections = 0;
    compareActions = 0;
    compareLantern = 0;
    compareOnOff = 0;
    compareOtherWords = 0;
    for i = 1:length(directions)
        if compareDirections ~= 1
            compareDirections = strcmp(directions, varargin{1});%compare cell array to input directions 
        end
    end
    for i = 1:length(actions)
        if compareActions ~= 1
            compareActions = strcmp(actions, varargin{1}); 
        end
    end
    for i = 1:length(lantern)
        if compareLantern ~= 1
            compareLantern = strcmp(lantern, varargin{1});%compare cell array to input DO 
        end
    end
     for i = 1:length(otherWords)
        if compareOtherWords ~= 1
            compareOtherWords = strcmp(otherWords, varargin{1});
        end
     end
     for i = 1:length(onOff)
        if compareOnOff ~= 1
            compareOnOff = strcmp(onOff, varargin{1});%compare cell array to input DO 
        end
    end
    if find(compareDirections) ~= 0
        [outputText, curpos] = storyboard(varargin{1}, varargin{2});
    elseif find(compareActions) ~= 0
        if varargin{1} == actions{4} %|| varargin{1} == actions{11} || varargin{1} == actions{16}
            witch = [5,5];
            skeleton = [2,3];
            knight = [11,6];
            if curpos == [5,5]
                while strcmp(monsters{curpos(1,1), curpos(1,2)}{1,1}, 'YES')
                    outputText = randMonster(witch, curpos)
                end
            elseif curpos == [2,3]
                while strcmp(monsters{curpos(1,1), curpos(1,2)}{1,1}, 'YES')
                    outputText = randMonster(skeleton, curpos)
                end
            elseif curpos == [11,6]
                while strcmp(monsters{curpos(1,1), curpos(1,2)}{1,1}, 'YES')
                    outputText = randMonster(knight, curpos)
                end
            else
                outputText = 'Said no one ever.';
            end
        else
            outputText = 'You must supply a direct object.';
        end
    elseif find(compareLantern) == 1
        outputText = 'What should I do with the lantern?';
    elseif find(compareOnOff) == 1
        outputText = 'You must supply a direct object.';
    else
        outputText = 'Said no one ever.';
    end
else
    x = 1 + 0:0;
    curpos = varargin{3};
    word = varargin{2};
    compareDirections1 = find(strcmp(directions, varargin{1})); %compare cell array to input directions and find logical values = 1
    compareActions1 = find(strcmp(actions, varargin{1}));
    compareLantern1 = find(strcmp(lantern, varargin{1})); %compare cell array to input DO and find logical values = 1
    compareOther1 = find(strcmp(otherWords, varargin{1}));
    compareOnOff1 = find(strcmp(onOff, varargin{1}));
    di1 = isequaln(compareDirections1, x);
    act1 = isequaln(compareActions1, x);
    lan1 = isequaln(compareLantern1, x);
    other1 = isequaln(compareOther1, x);
    nff1 = isequaln(compareOnOff1, x);
    if di1 == 0
      outputText = ['You have used the word ', varargin{1}, 'in a way that I don''t understand.'];
    elseif act1 == 0
        if varargin{1} == actions{5} || varargin{1} == actions{10} || varargin{1} == actions{17}
            if length(word) == 2
                compareLantern = find(strcmp(lantern, word(1)));
                lan = isequaln(compareLantern, x);
                if lan == 0
                    compareOnOff = find(strcmp(onOff, word(2)));
                    nff = isequaln(compareOnOff, x);
                    if nff == 0
                    else
                    end
                else
                    outputText = 'Said no one ever.';
                end
            else
                outputText = 'Said no one ever.';
            end
        else
            for i = 1:length(word)
                compareDirections{i} = find(strcmp(directions, word(i))); %compare cell array to input directions and find logical values = 1
                compareActions{i} = find(strcmp(actions, word(i)));
                compareLantern{i} = find(strcmp(lantern, word(i))); %compare cell array to input DO and find logical values = 1
                compareOther{i} = find(strcmp(otherWords, word(i)));
                compareOnOff{i} = find(strcmp(onOff, word(i)));
                di(i) = isequaln(compareDirections{i}, x);
                act(i) = isequaln(compareActions{i}, x);
                lan(i) = isequaln(compareLantern{i}, x);
                other(i) = isequaln(compareOther{i}, x);
                nff(i) = isequaln(compareOnOff{1}, x);
            end
            if di(i) == 0 || act(i) == 0 || lan(i) == 0 || nff(i) == 0
                outputText = 'Said no one ever.';
            end
        end      
    elseif lan1 == 0
        outputText = 'What should I do with the lantern?';
    else
        outputText = 'Said no one ever.';
    end
end
end
