function Y=dynamic_query(map,location,destination_A,destination_B,running_times)
tic;
[first_mindistance_1,first_minpath_1]=mtkl(map,location,destination_A,running_times);                %计算始发地地址到第一个地点的最短路径
[first_mindistance_2,first_minpath_2]=mtkl(map,destination_A,destination_B,running_times);                %计算第一个地点到第二个地点的最短路径
first_mindistance=first_mindistance_1+first_mindistance_2;
first_minpath=[first_minpath_1(1:end-1) first_minpath_2];
[second_mindistance_1,second_minpath_1]=mtkl(map,location,destination_B,running_times);                %计算始发地到第二个地点的最短路径
[second_mindistance_2,second_minpath_2]=mtkl(map,destination_B,destination_A,running_times);                %计算第二个地点到第一个地点的最短路径
second_mindistance=second_mindistance_1+second_mindistance_2;
second_minpath=[second_minpath_1(1:end-1) second_minpath_2];
if first_mindistance>=second_mindistance                %对比先去第一个地点和先去第二个地点的距离
    Y=first_mindistance;                %并返回最短距离
    first_minpath
else
    Y=second_mindistance;
    second_minpath
end
    function [W,E] = mtkl(G,location,destination,running_times)                %查找两个点之间的最短距离和路径
        replication_number=running_times;            %查找路径循环次数
        [x,~]=size(G);              %从矩阵中查找一共有几个地点
        point=zeros([1 x]);             %定义地点的可行路径数
        now_number1=transform(location);                %将始发地的字母地址转化成数字地址
        destination_number=transform(destination);              %将目的地的字母地址转化成数字地址
        min_distance=9999999;                %定义默认的最短距离为9999999
        rng('shuffle')                %使随机数的随机值不确定
        for i=1:x
            for j=1:x                %循环遍历每一个地点
                if G(i,j)~=0                %当某一地点的一路径是通路时
                    point(i)=point(i)+1;                %那么那一地点的可行数+1
                end
            end
        end
        while replication_number>=0                %开始蒙特卡洛算法次数循环
            once_distance=0;                %每一遍循环的距离清零
            now_number=now_number1;                %每一遍循环把现在地址重新设为始发地数字地址
            path=[now_number];                %定义每一遍循环时经过地点的数组
            if destination_number==now_number1                %当目的地和始发地相等时跳出循环
                min_distance=0;
                path_szmin=path;
                break;
            end
            while ~0                %查找能到目的地路径和距离的循环
                real_number=0;                %定义随着选择数字判断非零数字的地址
                mtkl_number=randi(point(now_number));                %随机一个根据地点的可行路径数的非零整数
                for search=1:x                %开始循环遍历当前所在地址的每一个路口
                    if G(now_number,search)~=0                %如果某一路口是非零通路那么通路地址就会前进一位
                        real_number=real_number+1;
                    end
                    if real_number==mtkl_number                %当通路地址和随机地址相等时
                        once_distance=G(now_number,search)+once_distance;                %距离会累加
                        now_number=search;                %到达的地点数字会赋给现在的地点数字
                        path=[path search];                %经过地点的数字会累加
                        break;
                    end
                end
                if now_number==destination_number                %当现在的地址到达目的地时跳出循环
                    break;
                end
            end
            if once_distance<min_distance                %每一次的循环得到的距离会和之前得到的最小距离作比较并替换
                min_distance=once_distance;
                path_szmin=path;                %经过路径进行替换
            end
            replication_number=replication_number-1;                %循环次数减一
        end
        W=min_distance;                %把最小数值赋给结果
        [~,o]=size(path_szmin);                %计算经过路径数字的数量
        for p=1:o
            path_min(p)=sz_transform(path_szmin(p));                %把经过路径的数字地址转化成字母地址
        end
        E=path_min;                %输出经过路径
        function site =transform(zmloc)                %读入的字母地址转化成数字地址以便计算
            switch zmloc
                case 'A'
                    site=1;
                case 'B'
                    site=2;
                case 'C'
                    site=3;
                case 'D'
                    site=4;
                case 'E'
                    site=5;
                case 'F'
                    site=6;
                case 'G'
                    site=7;
                case 'H'
                    site=8;
                case 'I'
                    site=9;
                case 'J'
                    site=10;
                case 'K'
                    site=11;
                case 'L'
                    site=12;
                case 'M'
                    site=13;
                case 'N'
                    site=14;
                case 'O'
                    site=15;
                case 'P'
                    site=16;
                case 'Q'
                    site=17;
                case 'R'
                    site=18;
                case 'S'
                    site=19;
                case 'T'
                    site=20;
                case 'U'
                    site=21;
                case 'V'
                    site=22;
                case 'W'
                    site=23;
                case 'X'
                    site=24;
                case 'Y'
                    site=25;
                case 'Z'
                    site=26;
            end
        end
        function site =sz_transform(szloc)                %数字地址转化成字母地址
            switch szloc
                case 1
                    site='A';
                case 2
                    site='B';
                case 3
                    site='C';
                case 4
                    site='D';
                case 5
                    site='E';
                case 6
                    site='F';
                case 7
                    site='G';
                case 8
                    site='H';
                case 9
                    site='I';
                case 10
                    site='J';
                case 11
                    site='K';
                case 12
                    site='L';
                case 13
                    site='M';
                case 14
                    site='N';
                case 15
                    site='O';
                case 16
                    site='P';
                case 17
                    site='Q';
                case 18
                    site='R';
                case 19
                    site='S';
                case 20
                    site='T';
                case 21
                    site='U';
                case 22
                    site='V';
                case 23
                    site='W';
                case 24
                    site='X';
                case 25
                    site='Y';
                case 26
                    site='Z';
            end
        end
    end
toc;
end