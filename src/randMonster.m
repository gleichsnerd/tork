function outputText = randMonster(position, curpos)

global inputText fLines static story title environment beenThereBool items ifTaken monsters dirRest restDet edit;

totLines = 35;

yourAttack = round(rand * 99 + 1);
theirAttack = round(rand * 99 + 1);
if position == [5,5]
    if yourAttack > 25
        outputText = ['You swing at your opponent to render them deceased. Again.'];
        monsters{curpos(1,1), curpos(1,2)}{1,1} = 'NO';
    elseif yourAttack <= 25
        outputText = ['You try to kick the witch, but miss by a mile.'];
        if theirAttack > 60 
            outputText = ['The witch sinks her claws into your throat. Sucks to suck.', char(10), char(10), 'You''ve lost the game.',char(10), char(10), 'Type "exit" to quit.'];
            set(edit, 'String', 'exit');
            monsters{curpos(1,1), curpos(1,2)}{1,1} = 'NO';
        end
    else
        outputText = ['Both of you appear to be quite clumsy. You best swing quick!'];
    end
    
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
    
elseif position == [2,3]
    if yourAttack > 50
        outputText = ['You snap your opponents brittle spine. Good job, jerk.'];
        monsters{curpos(1,1), curpos(1,2)}{1,1} = 'NO';
    elseif yourAttack <= 50
        outputText = ['You try to kick the skeleton, but miss by a mile.'];
        if theirAttack > 40 
            outputText = ['The skeleton prison shanks you in the gut. Sucks to suck.', char(10), char(10), 'You''ve lost the game.',char(10), char(10), 'Type "exit" to quit.'];
            set(edit, 'String', 'exit');
            monsters{curpos(1,1), curpos(1,2)}{1,1} = 'NO';
        end
    else
        outputText = ['Both of you appear to be quite clumsy. You best swing quick!'];
    end
    
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
    
else position == [11,6]
    if yourAttack > 75
        outputText = ['You manage to knock the knight off the bridge and into the river.', char(10), char(10), char(10), 'You notice a note on the ground. Since curiosity has yet to kill', char(10), 'your cat, you read it.',...
            char(10), char(10), 'tl;dr, the knight was Durden, and the man in the shack was killed over a gambling debt.' char(10), char(10), char(10), char(10), 'You walk across the bridge with the comfort of knowing you don''t have to play this game anymore.', char(10), char(10), 'Congrats, you won the game.',char(10), char(10), 'Type "exit" to quit.'] ;
        monsters{curpos(1,1), curpos(1,2)}{1,1} = 'NO';
    elseif yourAttack <=75
        outputText = ['You try to kick the knight in the groin, but break your foot.'];
        if theirAttack > 20 
            outputText = ['The knight decapitates you. Sucks to suck.', char(10), char(10), 'You''ve lost the game.', char(10), char(10), 'Type "exit" to quit.'];
            set(edit, 'String', 'exit');
        monsters{curpos(1,1), curpos(1,2)}{1,1} = 'NO';    
        end
    else
        outputText = ['Both of you appear to be quite clumsy. You best swing quick!'];
    end
    
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
    
    
   