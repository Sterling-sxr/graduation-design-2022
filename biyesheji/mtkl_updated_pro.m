function W=mtkl_updated_pro(G,location,destination,running_times,feasible_way,point)            %读入地图，出发地，目的地，运行次数，可行路径矩阵，可行路径数
tic;
replication_number=running_times;            %查找路径循环次数
now_number1=transform(location);                %将始发地的字母地址转化成数字地址
destination_number=transform(destination);              %将目的地的字母地址转化成数字地址
min_distance=9999999;                %定义默认的最短距离为9999999
rng('shuffle')                %使随机数的随机值不确定
path=zeros(1,26);
while replication_number>=0                %开始蒙特卡洛算法次数循环
    once_distance=0;                %每一遍循环的距离清零
    now_number=now_number1;                %每一遍循环把现在地址重新设为始发地数字地址
    path(1)=now_number;                %定义每一遍循环时经过地点的数组
    path_num=1;
    if destination_number==now_number1                %当目的地和始发地相等时跳出循环
        min_distance=0;
        path_szmin=path;
        break;
    end
    while ~0                %查找能到目的地路径和距离的循环
        mtkl_number=randi(point(now_number));                %随机一个根据地点的可行路径数的非零整数
        once_distance=G(now_number,feasible_way(now_number,mtkl_number))+once_distance;                %距离累加
        path_num=path_num+1;
        path(path_num)=feasible_way(now_number,mtkl_number);                %路径累加
        now_number=feasible_way(now_number,mtkl_number);                %现在数字地址被随机数选中的地址替代
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
jige=find(path_szmin==destination_number,1,'first');
path_min=sz_transform(path_szmin(1));
for p=2:jige
    path_min=[path_min sz_transform(path_szmin(p))];%把经过路径的数字地址转化成字母地址
end
path_min
            %输出经过路径
    function site =transform(zmloc)                %读入的字母地址转化成数字地址以便计算
        switch zmloc
            case 'H'
                site=1;
            case 'He'
                site=2;
            case 'Li'
                site=3;
            case 'Be'
                site=4;
            case 'B'
                site=5;
            case 'C'
                site=6;
            case 'N'
                site=7;
            case 'O'
                site=8;
            case 'F'
                site=9;
            case 'Ne'
                site=10;
            case 'Na'
                site=11;
            case 'Mg'
                site=12;
            case 'Al'
                site=13;
            case 'Si'
                site=14;
            case 'P'
                site=15;
            case 'S'
                site=16;
            case 'Cl'
                site=17;
            case 'Ar'
                site=18;
            case 'K'
                site=19;
            case 'Ca'
                site=20;
            case 'Sc'
                site=21;
            case 'Ti'
                site=22;
            case 'V'
                site=23;
            case 'Cr'
                site=24;
            case 'Mn'
                site=25;
            case 'Fe'
                site=26;
            case 'Co'
                site=27;
            case 'Ni'
                site=28;
            case 'Cu'
                site=29;
            case 'Zn'
                site=30;
            case 'Ga'
                site=31;
            case 'Ge'
                site=32;
            case 'As'
                site=33;
            case 'Se'
                site=34;
            case 'Br'
                site=35;
            case 'Kr'
                site=36;
            case 'Rb'
                site=37;
            case 'Sr'
                site=38;
            case 'Y'
                site=39;
            case 'Zr'
                site=40;
            case 'Nb'
                site=41;
            case 'Mo'
                site=42;
            case 'Tc'
                site=43;
            case 'Ru'
                site=44;
            case 'Rh'
                site=45;
            case 'Pd'
                site=46;
            case 'Ag'
                site=47;
            case 'Cd'
                site=48;
            case 'In'
                site=49;
            case 'Sn'
                site=50;
        end
    end
    function site =sz_transform(szloc)                %数字地址转化成字母地址
        switch szloc
            case 1
                site='H';
            case 2
                site='He';
            case 3
                site='Li';
            case 4
                site='Be';
            case 5
                site='B';
            case 6
                site='C';
            case 7
                site='N';
            case 8
                site='O';
            case 9
                site='F';
            case 10
                site='Ne';
            case 11
                site='Na';
            case 12
                site='Mg';
            case 13
                site='Al';
            case 14
                site='Si';
            case 15
                site='P';
            case 16
                site='S';
            case 17
                site='Cl';
            case 18
                site='Ar';
            case 19
                site='K';
            case 20
                site='Ca';
            case 21
                site='Sc';
            case 22
                site='Ti';
            case 23
                site='V';
            case 24
                site='Cr';
            case 25
                site='Mn';
            case 26
                site='Fe';
            case 27
                site='Co';
            case 28
                site='Ni';
            case 29
                site='Cu';
            case 30
                site='Zn';
            case 31
                site='Ga';
            case 32
                site='Ge';
            case 33
                site='As';
            case 34
                site='Se';
            case 35
                site='Br';
            case 36
                site='Kr';
            case 37
                site='Rb';
            case 38
                site='Sr';
            case 39
                site='Y';
            case 40
                site='Zr';
            case 41
                site='Nb';
            case 42
                site='Mo';
            case 43
                site='Tc';
            case 44
                site='Ru';
            case 45
                site='Rh';
            case 46
                site='Pd';
            case 47
                site='Ag';
            case 48
                site='Cd';
            case 49
                site='In';
            case 50
                site='Sn';
        end
    end
toc;
end