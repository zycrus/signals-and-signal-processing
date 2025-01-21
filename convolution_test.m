clear
clc
f = Filter(50, 500);
f.FilterResponse(225);
f.FilterResponse(1000);


f2 = Filter(800, 2000);
f2.FilterResponse(225);
f2.FilterResponse(1000);