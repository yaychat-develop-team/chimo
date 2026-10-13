dir=`pwd`
echo $dir
mkdir $dir/outputs

read -p "选择：1.压缩 2.生成动图 : " type

read -p "文件夹路径 : " path

if [ $type = 2 ]
then
read -p "循环次数 : " loopNum
read -p "每帧时长 : " d
read -p "每帧质量(0-100) : " qa
fi

if [ $type = 1 ]
then
read -p "压缩质量(0-100) : " qa
fi

read -p "生成文件名 : " name
if [ -z $name ];then
    name="${path##*/}"
    name="${name%%.*}"
fi

if [ $type = 2 ]
then
imgs=''
for file in $path/*
do
#这里只操作png文件
if [ -f $file ] && [ "${file##*.}" = "png" ]
then
imgs=$imgs$file" -lossy -q $qa -m 5 -d $d "
fi
done
libwebp-1.5.0/bin/img2webp -loop $loopNum $imgs -o $dir/outputs/$name.webp
fi

if [ $type = 1 ];then
    if [ -f $path ];then
        # libwebp-1.5.0/bin/cwebp $path -q $qa -m 6 -o $dir/outputs/$name.webp
        libwebp-1.5.0/bin/cwebp $path -q $qa -jpeg_like -mt -m 6 -o $dir/outputs/$name.webp
        # libwebp-1.5.0/bin/cwebp $path -crop 0 860 1125 716 -q $qa -jpeg_like -mt -m 6 -o $dir/outputs/$name.webp
    else
        for file in $path/*
        do
        if [ -f $file ];then
            name="${file##*/}"
            name="${name%%.*}"
            # libwebp-1.5.0/bin/cwebp $file -q $qa -m 6 -o $dir/outputs/$name.webp
            libwebp-1.5.0/bin/cwebp $file -q $qa -jpeg_like -mt -m 6 -o $dir/outputs/$name.webp
            # libwebp-1.5.0/bin/cwebp $file -resize 750 0 -q $qa -jpeg_like -mt -m 6 -o $dir/outputs/$name.webp
        fi
        done
    fi
fi