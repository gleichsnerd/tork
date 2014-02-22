function saveFunc(curpos)

    global story title environment beenThereBool items ifTaken monsters dirRest restDet;

    fid = fopen('curpos.d', 'w');
    fprintf(fid, '%d %d', curpos(1), curpos(2));
    fclose(fid);
    
    story{1,2} = environment;
    story{1,6} = monsters;
    
    save('savestory', 'story');
    
end