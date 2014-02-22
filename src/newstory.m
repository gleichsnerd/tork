function newstory()
    
    global story title environment beenThereBool items ifTaken monsters dirRest restDet;
    
    load('originalstory.mat');
    
    title = story{1,1};
    environment = story{1,2};
    beenThereBool = story{1,3};
    items = story{1,4};
    ifTaken = story{1,5};
    monsters = story{1,6};
    dirRest = story{1,7};
    restDet = story{1,8};
    
end