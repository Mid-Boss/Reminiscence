function [ output_args ] = printPers( lvl,mhp,mmp,att,def,mat,mdf,agi,luk )
%Based on the input level and given stats, outputs the percentages of the
%average class stat to the command window.
%   Use this function to quickly calculate percentages for existing enemies
%   in the game (which existed before the creation of calcStats.m)

load avgClassStats.mat;
avg = avg;
avgStats.lvl = lvl;
avgStats.mhp = avg.mhp(lvl);
avgStats.mmp = avg.mmp(lvl);
avgStats.att = avg.att(lvl);
avgStats.def = avg.def(lvl);
avgStats.mat = avg.mat(lvl);
avgStats.mdf = avg.mdf(lvl);
avgStats.agi = avg.agi(lvl);
avgStats.luk = avg.luk(lvl);

out.lvl = avgStats.lvl;
out.mhp = myround(mhp/avgStats.mhp*100,mhp);
out.mmp = myround(mmp/avgStats.mmp*100,mmp);
out.att = myround(att/avgStats.att*100,att);
out.def = myround(def/avgStats.def*100,def);
out.mat = myround(mat/avgStats.mat*100,mat);
out.mdf = myround(mdf/avgStats.mdf*100,mdf);
out.agi = myround(agi/avgStats.agi*100,agi);
out.luk = myround(luk/avgStats.luk*100,luk);

out

    function [bar] = myround(a,b)
        bar = round(a);
        if(bar == 0 && b ~= 0)
            bar = 1;
        end
    end
end

