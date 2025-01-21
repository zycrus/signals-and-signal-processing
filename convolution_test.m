clear
clc
f = Filter(50, 500);
f.FilterResponse(225);
f.FilterResponse(1000);