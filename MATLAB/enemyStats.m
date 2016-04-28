% enemyStats.m - Given the average class stats (see stat spreadsheet),
% calculates enemy stats based on the expected level of the player at the
% time of encounter, and based on user-specified multipliers for each stat
% for each enemy.
%
% For example, if the player is expected to encounter a goblin when the
% player is Lvl 5, the goblin's stats can be calculated via
%
% goblin.lvl = 5;
% goblin = calcStats(goblin,mhp,mmp,att,def,mat,mdf,agi,luk);
%
% where mhp, mmp, ..., luk are user-specified percentages of the average
% class stat with the same name. For instance, if the user wants the goblin
% to have an attack of 90% the average class value for attack, att should
% be set to 90.0 (not 0.90).

clc
clear all
close all

%% Average class stats
lvl1.mhp = 70;  lvl99.mhp = 7000;   div.mph = 100;
lvl1.mmp = 15;  lvl99.mmp = 1500;   div.mmp = 100;
lvl1.att = 15;  lvl99.att = 300;    div.att = 20;
lvl1.def = 15;  lvl99.def = 300;    div.def = 20;
lvl1.mat = 15;  lvl99.mat = 300;    div.mat = 20;
lvl1.mdf = 15;  lvl99.mdf = 300;    div.mdf = 20;
lvl1.agi = 20;  lvl99.agi = 400;    div.agi = 20;
lvl1.luk = 20;  lvl99.luk = 400;    div.luk = 20;

avg.lvl = linspace(1,99,99);
for i = 1:99
    avg.mhp(i) = round(lvl1.mhp + (avg.lvl(i)-1)*(lvl99.mhp-lvl1.mhp)/98);
    avg.mmp(i) = round(lvl1.mmp + (avg.lvl(i)-1)*(lvl99.mmp-lvl1.mmp)/98);
    avg.att(i) = round(lvl1.att + (avg.lvl(i)-1)*(lvl99.att-lvl1.att)/98);
    avg.def(i) = round(lvl1.def + (avg.lvl(i)-1)*(lvl99.def-lvl1.def)/98);
    avg.mat(i) = round(lvl1.mat + (avg.lvl(i)-1)*(lvl99.mat-lvl1.mat)/98);
    avg.mdf(i) = round(lvl1.mdf + (avg.lvl(i)-1)*(lvl99.mdf-lvl1.mdf)/98);
    avg.agi(i) = round(lvl1.agi + (avg.lvl(i)-1)*(lvl99.agi-lvl1.agi)/98);
    avg.luk(i) = round(lvl1.luk + (avg.lvl(i)-1)*(lvl99.luk-lvl1.luk)/98);
end

% Scaling factor to account for multiple classes, if desired
avgscale = 1.0;
avg.mhp = round(avgscale*avg.mhp);
avg.mmp = round(avgscale*avg.mmp);
avg.att = round(avgscale*avg.att);
avg.def = round(avgscale*avg.def);
avg.mat = round(avgscale*avg.mat);
avg.mdf = round(avgscale*avg.mdf);
avg.agi = round(avgscale*avg.agi);
avg.luk = round(avgscale*avg.luk);

save('avgClassStats.mat','avg');

%% Enemy Stats
% Field outside of Trayflare
slime.lvl = 1;
slime = calcStats(slime,43,1,45,27,1,1,30,1);

manEatingPlant.lvl = 1;
manEatingPlant = calcStats(manEatingPlant,79,666,57,37,1,30,50,10);

hornet.lvl = 2;
hornet = calcStats(hornet,34,1,72,39,67,39,104,12);
