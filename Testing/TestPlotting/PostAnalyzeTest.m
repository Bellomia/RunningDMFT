clear all
clc
global ignUlist
ignUlist = true;
% We don't have a SOI-values list, but we can obtain that by just
% inspecting the subdirectories...
[SOI_list, SOI_names] = get_list('SOI');
Nlines = length(SOI_list);
for iSOI = 1:Nlines
    SOIDIR = SOI_names(iSOI);
    fprintf(strcat(SOIDIR));
    cd(SOIDIR);
    if isfile('U_list.txt')
        U_list = load('U_list.txt');
    else
        U_list = [];
    end
    [ids,obs,U_list] = extract_line(U_list); fprintf('..DONE\n');
    save('observables_line.mat','ids','obs','U_list');
    cd('..');
end
