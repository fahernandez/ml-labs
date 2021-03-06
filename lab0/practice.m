clear;
format bank;
X = [1, 1987;1, 1997;1, 1991]; %3x2
XT=X'; %2x3
XTX=XT*X;
Y=[14.97;14.42;14.36];
XTY=XT*Y;
invXTX=inv(XT*X);
B=invXTX*XTY;

M = cell(8,1);
for n = 1:8
 M{n} = magic(n);
end
M;

S.name = 'Ed Plum';
S.score = 83;
S.grade = 'B+';
S;

S(2).name = 'Toni Miller';
S(2).score = 91;
S(2).grade = 'A-';

function ave = average(x)
    ave = sum(x(:))/numel(x); 
end

fid = fopen(filename, 'r');
if (fid == -1)
error('cannot open file for reading');
end
