function [ avgStats ] = avglvl( lvl )
%avglvl Function for testing purposes only. Prints the average class stats
%at a specified level to the command window

load avgClassStats.mat;
avgStats.lvl = lvl;
avgStats.mhp = avg.mhp(lvl);
avgStats.mmp = avg.mmp(lvl);
avgStats.att = avg.att(lvl);
avgStats.def = avg.def(lvl);
avgStats.mat = avg.mat(lvl);
avgStats.mdf = avg.mdf(lvl);
avgStats.agi = avg.agi(lvl);
avgStats.luk = avg.luk(lvl);

% Ignore MATLAB's complaining and just print it the easy way
avgStats

end

