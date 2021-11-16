function [path] = CreatePath(parent_node,start,goal)
% Outputs the shortest path to goal
path = goal;
searchpos = goal;
while parent_node(searchpos) ~= start
    searchpos = parent_node(searchpos);
    path = horzcat(path,searchpos);
end
path = horzcat(path,start);
% Flip path: start to goal
path = flip(path);
end

