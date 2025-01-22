clear
clc
f = Filter(50, 500, 9);
f.FilterResponse(225);

f = Filter(50, 500, 10);
f.FilterResponse(1000);


f2 = Filter(800, 2000, 9);
f2.FilterResponse(225);

f2 = Filter(800, 2000, 9);
f2.FilterResponse(1000);