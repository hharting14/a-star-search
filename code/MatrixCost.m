function [Cost] = MatrixCost(nodes,edges)
% Outputs a cost matrix: rows = ID2 columns: ID1
size = height(nodes);
Cost = zeros(size,size);
for i = 1 : height(edges)
    Cost(edges.ID2(i),edges.ID1(i)) = edges.cost(i);
end
end

