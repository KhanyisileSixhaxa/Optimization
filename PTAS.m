function PTAS
    
   v = [2,6,8,7,3,4,6,5,10,9,8,11,12,15,6,8,13,14,15,16,13,14,15,26,13,9,25,26];
   w = [7,3,3,5,4,7,5,4,15,10,17,3,6,11,6,14,4,8,9,10,14,17,9,24,11,17,12,14];
   n = length(v);
   W = 30;
   k = 5;
   perm = nchoosek(1:n,k);
   m = length(perm);
   sw = zeros(m,1);
   S = [];
 
   for i=1:m
      F1 = perm(i,:);
      for j=1:length(F1)
          sw(i) = sw(i)+w(F1(j));
      end   
   end
  
   for i=1:m
        if sw(i) <= W
            S(i,:) = perm(i,:);
        end
   end
   
   S(~any(S,2),:)=[];
   profit = zeros(length(S),1);
   
   for i=1:length(S)
       F2 = S(i,:);
       for j=1:length(F2)
           profit(i) = profit(i)+v(F2(j));
       end
   end
   
   [mprofit,i] = max(profit);
   optSoln = S(i,:);
   disp('Profit is given by:')
   disp(mprofit);
   disp('Max combo set:')
   disp(optSoln);
   
end