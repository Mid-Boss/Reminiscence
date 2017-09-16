function [ foo ] = calcStats( foo,mhp,mmp,att,def,mat,mdf,agi,luk )
% [ foo ] = calcStats( foo,mhp,mmp,att,def,mat,mdf,agi,luk )
%
% Given an enemy structure, foo, with a level field, .lvl,
% calculates the the enemy's stats based on the percentages mhp, mmp, ...,
% luk of the average class stats

load avgClassStats.mat;
avg = avg;

lvl = foo.lvl;
foo.mhp = myround(avg.mhp(lvl)*mhp/100,mhp);
foo.mmp = myround(avg.mmp(lvl)*mmp/100,mmp);
foo.att = myround(avg.att(lvl)*att/100,att);
foo.def = myround(avg.def(lvl)*def/100,def);
foo.mat = myround(avg.mat(lvl)*mat/100,mat);
foo.mdf = myround(avg.mdf(lvl)*mdf/100,mdf);
foo.agi = myround(avg.agi(lvl)*agi/100,agi);
foo.luk = myround(avg.luk(lvl)*luk/100,luk);

    function [bar] = myround(a,b)
        bar = round(a);
        if(bar == 0 && b ~= 0)
            bar = 1;
        end
    end
end

