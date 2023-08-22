@echo off
::定义窗口和窗口文字颜色
color  3f

::打印时间
title 提取文件名 %date% %time%

::输出一个-回车换行-空白行
::echo.

echo =====================

::输入目录
set /P Src_folder=[Please input path]::

::传参数%Src_folder%
dir %Src_folder% /b  >%userprofile%\Desktop\dir_name_list.csv
