function [neighbors] = NeighborsList(current,edges)
% Outputs neighbors list of current node
neighbors = [];
cnt = 0;
% Searching on both ID1 and ID2 to see all the neighbors
for i = 1: height(edges)
   if edges.ID2(i) == current
       cnt = cnt + 1;
       neighbors(1, cnt) = edges.ID1(i);
   end 
   if edges.ID1(i) == current
       cnt = cnt + 1;
       neighbors(1, cnt) = edges.ID2(i);
   end
end 
end

