function [outputText, curpos] = storyboard(direction, curpos)
     
    global story title environment beenThereBool items ifTaken monsters dirRest restDet;

    curx = curpos(1);
    cury = curpos(2);
         
    if strcmp(direction, 'north') && strcmp(dirRest{curx, cury}{1,1}, 'n') == 0
        curx = curx - 1;
        %if beenThereBool{curx, cury} == 0
            outputText = [title{curx, cury}, char(10), char(10) char(10),];
            for i = 1:length(environment{curx, cury}{1,1})
                outputText = [outputText, environment{curx, cury}{1,1}{1,i}];
            end
        %else
        %    outputText = [title{curx, cury}];
        %end
        curpos = [curx, cury];
    elseif strcmp(direction, 'south') && strcmp(dirRest{curx, cury}{1,2}, 's') == 0
        curx = curx + 1;
        %if beenThereBool{curx, cury} == 0
            outputText = [title{curx, cury}, char(10), char(10) char(10),];
            for i = 1:length(environment{curx, cury}{1,1})
                outputText = [outputText, environment{curx, cury}{1,1}{1,i}];
            end
        %else
        %    outputText = [title{curx, cury}];
        %end
        curpos = [curx, cury];
    elseif strcmp(direction, 'east') && strcmp(dirRest{curx, cury}{1,3}, 'e') == 0
        cury = cury + 1;
        %if beenThereBool{curx, cury} == 0
            outputText = [title{curx, cury}, char(10), char(10) char(10),];
            for i = 1:length(environment{curx, cury}{1,1})
                outputText = [outputText, environment{curx, cury}{1,1}{1,i}];
            end
        %else
        %   outputText = [title{curx, cury}];
        %end
        curpos = [curx, cury];
    elseif strcmp(direction, 'west') && strcmp(dirRest{curx, cury}{1,4}, 'w') == 0
        cury = cury - 1;
        %if beenThereBool{curx, cury} == 0
            outputText = [title{curx, cury}, char(10), char(10), char(10)];
            for i = 1:length(environment{curx, cury}{1,1})
                outputText = [outputText, environment{curx, cury}{1,1}{1,i}];
            end
        %else
        %    outputText = [title{curx, cury}];
        %end
        curpos = [curx, cury];
    else
        outputText = ['Impossible!', char(10) , char(10),];
        curpos = [curx, cury];
    end

end