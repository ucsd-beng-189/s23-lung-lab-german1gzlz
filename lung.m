%filename: lung.m (main program)
clear all
clf
global Pstar cstar n maxcount M Q camax RT cI;

% 760*.2093=159 mmHh
% 79/.2093 = atmosphere pressure = 377
% MAX altitude = 19150 ft

% new PP = 59
% atmosphere pressure = 281.8920
% MAX Altitude = 26500
    altitude = linspace(0,14600,17)
cref=0.2/(22.4*(310/273));
beta = .8
for i = 1:200
    %cI=cref-((i-1)*.0002)
    cstar=cref*(1-((i-1)*.01))
    setup_lung;
    cvsolve;
    outchecklung;

    figure(4)
    plot(cstar,PAbar,"ro")
    hold on
    plot(cstar,Pabar,"go")
    plot(cstar,Pv,"co")
    plot(cstar,PI,"bo");
end
    legend("Mean Alveolar PP","Mean Arterial PP","Venous PP","Inspired Air PP")
    xlabel("cStar")
    ylabel("Partial Pressures (mmHg)")
    title("Partial Pressures vs. cStar")
%     legend("Mean Alveolar PP","Mean Arterial PP","Venous PP","Inspired Air PP")
%     xlabel("Atitude (ft)")
%     ylabel("Partial Pressures (mmHg)")
%     title("Partial Pressures vs. Altitude")


%% Previous TASKS
%reference oxygen concentration (moles/liter):
%cref=0.2/(22.4*(310/273))
%rate of oxygen consumption (moles/minute):
%M=0.25*cref*5.6
% for i = 0:1:10
%     for j = 0:5
%         M=0.25*cref*5.6+(.001*j) %.0110 default
%     beta = 1;
%     setup_lung;
%     cvsolve;
%     outchecklung;
%     end
% end
% figure(5)
% mdata = [.030 .028 .030 .029 .028 .026 .025 .023 .021 .020 .019]
% betadata = [0 .1 .2 .3 .4 .5 .6 .7 .8 .9 1]
% plot(betadata,mdata)
% xlabel("Beta")
% ylabel("Maximum Sustainable Oxygen Consumption")
% title("Maximum Sustainable Oxygen Consumption vs Beta")

%     Plots Partial PRessures vs. Beta
%     figure(4)
%     plot(i/10,PI,"bo")
%     hold on
%     plot(i/10,PAbar,"ro")
%     plot(i/10,Pabar,"go")
%     plot(i/10,Pv,"co")
%     legend("Inspired PP","Mean Alveolar PP","Mean Arterial PP","Venous PP")
%     xlabel("Beta")
%     ylabel("Partial Pressure")
%     title("Partial Pressure vs. Beta")
% end
