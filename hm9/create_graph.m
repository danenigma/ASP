function [tempGraph,VX,stateS,HMMestimate] = create_graph(P,O,Y,N,PI_0)
tempGraph = zeros(4,N-1); 
VX = zeros(2,N);
VX(:,N) = zeros(2,1);
selectedEdges = zeros(2,N);
for i=1:N-1
    currentO = O(:,Y(i+1));
    currentO = [currentO(:),currentO(:)];
    tempGraph(:,i) = -log10(P(:).*currentO(:));
end

for i=N-1:-1:1
    [VX(1,i),selectedEdges(1,i+1)]= min(tempGraph(1:2,i) + VX(:,i+1));
    [VX(2,i),selectedEdges(2,i+1)]= min(tempGraph(3:4,i) + VX(:,i+1));      
end

currentO = O(:,Y(1));
stateSedges = -log10(PI_0.*currentO(:));
[stateS,stateSbestedge] = min(stateSedges + VX(1));
stateSbestedge
selectedEdges
HMMestimate = zeros(1,N);
HMMestimate(1) = stateSbestedge;
for i=2:N
HMMestimate(i) = selectedEdges(HMMestimate(i-1),i);
end
end