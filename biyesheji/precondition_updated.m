function [W,Q,min_W,min_Q]= precondition_updated(G)                %读出地图上每个地点可行路准确位置
[x,~]=size(G);                %地图的尺寸
point=zeros([1 x]);                %每个地点的可行路径数数组
min_point=zeros([1 x]);
feasible_way=zeros(x);                %记录每个地点的可行路径是第几条路的矩阵
min_feasible_way=zeros(x);
for i=1:x                %循环遍历每一个点
    z=1;
    a=1;
    for j=1:x
        if G(i,j)~=0
            point(i)=point(i)+1;                %当某个地点的某条路径为通路时，可行路径数+1
            feasible_way(i,z)=j;                %矩阵记录这个可行路径是第几条路
            if G(i,j)<=10                %当路线距离小于10存入到短路径地图里
                min_feasible_way(i,a)=j;
                min_point(i)=min_point(i)+1;
                a=a+1;
            end
            z=z+1;
        end
    end
end
W=feasible_way;                %返回可行路径矩阵
Q=point;                %返回可行路径数
min_W=min_feasible_way;
min_Q=min_point;
end






