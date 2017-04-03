function onTimer (obj,events,arg)
data=datestr(date,29);
cur_data = data;
cur_time = fix(clock);
% str = sprintf('%s %.2d:%.2d:%.2d', cur_data, cur_time(4), cur_time(5), cur_time(6));
str1 = sprintf('%s', cur_data);
str2 = sprintf('%.2d:%.2d:%.2d', cur_time(4), cur_time(5), cur_time(6));
 set(arg(1),'String',str1);
 set(arg(2),'String',str2);