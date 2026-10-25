function G=automatic_map_generation(number)                %自动生成地图
map=zeros(number);
rng('shuffle');
for x=1:number
    for y=1:number
        suiji_juli=randi([0,20],1);                %随机从0到20生成距离长度
        if x==y                %如果路径是通向自身则路径距离为0
            map(x,y)=0;
            continue;
        end
        map(x,y)=suiji_juli;                %把随机值赋到矩阵上
    end
end
G=map;                %返回地图矩阵
end