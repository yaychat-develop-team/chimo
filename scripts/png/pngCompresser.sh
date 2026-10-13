dir=`pwd`
echo $dir
mkdir $dir/outputs

read -p "文件/文件夹路径 : " path

read -p "最小压缩质量(0-100) : " minQA
if [ -z $minQA ];then
    minQA=50
fi

read -p "最大压缩质量(0-100) : " maxQA
if [ -z $maxQA ];then
    maxQA=80
fi

read -p "生成文件名 : " name
if [ -z $name ];then
    name="${path##*/}"
    name="${name%%.*}"
fi

if [ -f $path ];then
    outputPath=$dir/outputs/$name.png
    if [ -f $outputPath ];then
        rm -rf $outputPath
    fi
    ./pngquant --quality=$minQA-$maxQA --speed 10 $path --output $outputPath
else
   for file in $path/*
   do
   if [ -f $file ];then
       filePath="${file##*/}"
       name="${filePath%%.*}"
       outputPath=$dir/outputs/$name.png
       if [ -f $outputPath ];then
            rm -rf $outputPath
       fi
       if [[ $filePath == *".png" ]]; then
            ./pngquant --quality=$minQA-$maxQA $file --output $outputPath
            echo $outputPath
       fi
   fi
   done
fi