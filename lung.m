%filename: lung.m (main program)
clear all
clf
global Pstar cstar n maxcount M Q camax RT cI;
for i = 0:.1:10
    beta = .1*i;
    setup_lung
    cvsolve
    outchecklung

    %Plots Partial PRessures vs. Beta
    figure(4)
    plot(i/10,PI,"bo")
    hold on
    plot(i/10,PAbar,"ro")
    plot(i/10,Pabar,"go")
    plot(i/10,Pv,"co")
    legend("Inspired PP","Mean Alveolar PP","Mean Arterial PP","Venous PP")
    xlabel("Beta")
    ylabel("Partial Pressure")
    title("Partial Pressure vs. Beta")
end
