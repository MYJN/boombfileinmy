@echo off
::���崰�ںʹ���������ɫ
color  3f

::��ӡʱ��
title ��ȡ�ļ��� %date% %time%

::���һ��-�س�����-�հ���
::echo.

echo =====================

::����Ŀ¼
set /P Src_folder=[Please input path]::

::������%Src_folder%
dir %Src_folder% /b  >%userprofile%\Desktop\dir_name_list.csv
