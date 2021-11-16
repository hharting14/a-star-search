%% Peer Graded Assignment Week1: A* Search
clear
clc

% Import files and creating variables
nodes = importNodes('nodes.csv');
edges = importEdges('edges.csv');
start = 1; 
goal = 12;
[cost] = MatrixCost(nodes,edges);

% Initializing variables
past_cost = zeros(1,height(nodes));
for k = 2 : height(nodes) 
    past_cost(1,k) = inf;    
end
optimistic_ctg = nodes.hcost';
est_tot_cost = past_cost + nodes.hcost';
parent_node = zeros(1,height(nodes));
parent_node(1,1) = 0; 

% Initializing open, closed:
open = [nodes.ID(start);est_tot_cost(1)];
closed = [];
updateOpen = [];

% Search algorithm:
while ~isempty(open)
    current = open(1,1);
    open(:,1) = [];
    closed = horzcat(closed,current);
    if current == goal
        % Return success and the path to the goal
        mypath = CreatePath(parent_node,start,goal);
        fprintf('The shortest path is: \n')
        fprintf('\n')
        disp(mypath)
        fprintf('Success \n')
        break
    end
    % Outputs neighbors list of current node
    [neighbors] = NeighborsList(current,edges);
    for i = 1 : length(neighbors)
        if ~ismember(neighbors(i),closed)
            tentative_past_cost = past_cost(current) + cost(current,neighbors(i)); 
            if tentative_past_cost < past_cost(neighbors(i))
                past_cost(neighbors(i)) = tentative_past_cost;
                parent_node(neighbors(i)) = current;
                % Put neighbor /sorting open by est_tot_cost;
                est_tot_cost(neighbors(i)) = past_cost(neighbors(i)) + nodes.hcost(neighbors(i))';
                updateOpen = [nodes.ID(neighbors(i));est_tot_cost(neighbors(i))];                
                for j = 1 : length(open)
                    if updateOpen(1,1) == open[1,j]
                        open(:,j) = [];
                        open(nodes.ID(neighbors(i)),j) = updateOpen;
                    end
                end
                open = horzcat(open,updateOpen);
                open = sort(open,2);
            end                           
        end
    end
end
% Finally write a csv file with path
csvwrite('path.csv', mypath);    
