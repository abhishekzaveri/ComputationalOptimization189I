
function [X, dates, names] = load_stocks(dirname, startdate, enddate)

datafiles = dir([dirname, filesep, '*.csv']);
n = length(datafiles); % n stocks
names = cell(n, 1);
X = [];

for ii=1:n
   filename = datafiles(ii).name;
   names(ii) = {filename}; %stores names in names 
    
   stock = importdata([dirname, filesep, filename], ',');
   colData = stock.data(:,6); 
   colDates = stock.textdata(:,1);
   colDates(1) = [];
   
   dataMat = [colDates, strcat({''}, num2str(colData))];
   
   
   [startPos, c] = find(strcmp(dataMat,startdate));
   [endPos, c] = find(strcmp(dataMat,enddate));
   
   
   
   adjClose = flipud(str2double(dataMat(endPos:startPos, 2))); 
   dates = flipud(colDates); 
   
   p_1 = adjClose(1);
   r_t = [];
   
   
    for i = 1 :length(adjClose)
    r_t(i) = ((adjClose(i) - p_1) / p_1);    
    end
    
   X = [X r_t'];
   
  
   
   
    
    end
    %disp_stocks(X, dates, names)
    X
end
