function [songdata, songP, songNT] = song(rawdata, SC, GL, P, NT)
    nicedata = rawdata(ismember(GL,'Y')&(~(any(isnan(rawdata),2))),:);
    niceSC = SC(ismember(GL,'Y')&(~(any(isnan(rawdata),2))),:);
    niceP = P(ismember(GL,'Y')&(~(any(isnan(rawdata),2))),:);
    niceNT = NT(ismember(GL,'Y')&(~(any(isnan(rawdata),2))),:);
    songdata = nicedata(ismember(niceSC,'S'),:);
    songP = niceP(ismember(niceSC,'S'),:);
    songNT = niceNT(ismember(niceSC,'S'),:);
end