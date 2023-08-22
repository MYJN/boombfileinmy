@echo off

::获取开始时间
set start_time=%time:~0,8%
set start_date=%date%
set Start_Time_Data=%start_date%_(%start_time%)
:: 输出提示信息及选择目录
echo ======================================================================================
echo +---不指定文件类型情况下,默认将复制所有文件
echo .
echo +---如果将文件模式指定为选项,则仅复制与该模式匹配的文件
echo .
echo +---例如:仅复制JPG图像文件可以添加通配符,可以目标目录路径后面指定多个图案
echo .                                                                
echo +---例如: robocopy Src_folder Dest_folder *.jpg *2.jpg
echo .
echo +---[当前执行开始时间-%Start_Time_Data%]
echo ======================================================================================
echo .
echo .
echo .

::输入目录
set /P Src_folder=[输入源目录位置]:
set /P Dest_folder=[输入目标目录位置]:
set /P LogFile_Folder=[输入日志目录位置]:

::执行任务命令
echo "........................Show Time........................"
::获取年月日
set YEAR=%date:~0,4%
set MONTH=%DATE:~5,2%
set DAY=%date:~8,2%
::获取时分秒
set HOUR=%time:~0,2%
set MINUTE=%time:~3,2%
SET SECOND=%time:~6,2%
::获取毫秒
set MILLISECIOND=%time:~9,2%
::当时钟小于等于9时,前面有个空格,这是少截取了一位,从第一位开始截取
set TMP_HOUR=%time:~1,1%
set NINE=9
set ZERO=0
::处理时钟是个位数的时候前面补上一个０,LEQ表示小于等于
if %HOUR% LEQ %NINE% set HOUR=%ZERO%%TMP_HOUR%
::年月日时分秒赋值
set DATE_TIME_STAMP="%YEAR%%MONTH%%DAY%_%HOUR%%MINUTE%%SECOND%"
::赋值文件命名
set LogFile="%LogFile_Folder%\[@Robocopy_log_%DATE_TIME_STAMP%].txt"
::定义排除文件及目录
set xf_list= thumbs.db *.bak desktop.ini .DS_STORE ._* __MACOSX .AppleDouble ._.* .DS_Store Thumbs.db .*.swp .*~ .svn $RECYCLE.BIN $Eis$Bak aquota.group aquota.user
set xd_list= "$RECYCLE.BIN" "System Volume Information" "RECYCLER" "lost+found" 

:: 执行robocopy任务命令 
robocopy %Src_folder% %Dest_folder% /E /J /X /ETA /FP /V /TEE /R:3 /W:30 /LOG+:"%LogFile%" /XF %xf_list% /XD %xd_list% /COMPRESS /XJ 

:: _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
:: ====================== Robocopy 参数提示======================
:: /S :: 复制子目录，但不复制空的子目录。
:: /E :: 复制子目录，包括空的子目录
:: /PURGE :: 删除源中不再存在的目标文件/目录
:: /MIR :: 镜像目录树 等同于 /E 加 /PURGE
:: /J :: 复制时使用未缓冲的 I/O 推荐在复制大文件时使用
:: /R:n :: 失败副本的重试次数: 默认为 1 百万
:: /W:n :: 两次重试间的等待时间: 默认为 30 秒
:: /XF 文件[文件]... :: 排除与给定名称/路径/通配符匹配的文件
:: /XD 目录[目录]... :: 排除与给定名称/路径匹配的目录
:: /COMPRESS :: 如果适用在文件传输期间请求网络压缩
:: /XJ:: 排除文件和目录的符号链接和接合点。
:: /XJD:: 排除目录和接合点的符号链接
:: /XJF :: 排除文件的符号链接
:: /FP :: 在输出中包含文件的完整路径名称
:: /ETA :: 显示复制文件的预期到达时间
:: /V :: 生成详细输出同时显示跳过的文件
:: /X :: 报告所有多余的文件，而不只是选中的文件
:: /MT[:n] :: 使用 n 个线程进行多线程复制(默认值为 8)。
::                       n 必须至少为 1，但不得大于 128。
::                       该选项与 /IPG 和 /EFSRAW 选项不兼容。
::                       使用 /LOG 选项重定向输出以便获得最佳性能
:: /ZB :: 使用可重新启动模式,如果拒绝访问使用备份模式
:: ====================== Robocopy 参数提示======================
:: _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

::获取结束时间
set end_time=%time:~0,8%
set end_date=%date%
set End_Time_Data=%end_date%_(%end_time%)
::结束 END
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
echo .+---[执行开始时间-%Start_Time_Data% ]                       
echo .+---[执行结束时间-%End_Time_Data% ]
echo Done.
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
pause
