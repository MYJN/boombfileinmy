@echo off

::��ȡ��ʼʱ��
set start_time=%time:~0,8%
set start_date=%date%
set Start_Time_Data=%start_date%_(%start_time%)
:: �����ʾ��Ϣ��ѡ��Ŀ¼
echo ======================================================================================
echo +---��ָ���ļ����������,Ĭ�Ͻ����������ļ�
echo .
echo +---������ļ�ģʽָ��Ϊѡ��,����������ģʽƥ����ļ�
echo .
echo +---����:������JPGͼ���ļ��������ͨ���,����Ŀ��Ŀ¼·������ָ�����ͼ��
echo .                                                                
echo +---����: robocopy Src_folder Dest_folder *.jpg *2.jpg
echo .
echo +---[��ǰִ�п�ʼʱ��-%Start_Time_Data%]
echo ======================================================================================
echo .
echo .
echo .

::����Ŀ¼
set /P Src_folder=[����ԴĿ¼λ��]:
set /P Dest_folder=[����Ŀ��Ŀ¼λ��]:
set /P LogFile_Folder=[������־Ŀ¼λ��]:

::ִ����������
echo "........................Show Time........................"
::��ȡ������
set YEAR=%date:~0,4%
set MONTH=%DATE:~5,2%
set DAY=%date:~8,2%
::��ȡʱ����
set HOUR=%time:~0,2%
set MINUTE=%time:~3,2%
SET SECOND=%time:~6,2%
::��ȡ����
set MILLISECIOND=%time:~9,2%
::��ʱ��С�ڵ���9ʱ,ǰ���и��ո�,�����ٽ�ȡ��һλ,�ӵ�һλ��ʼ��ȡ
set TMP_HOUR=%time:~1,1%
set NINE=9
set ZERO=0
::����ʱ���Ǹ�λ����ʱ��ǰ�油��һ����,LEQ��ʾС�ڵ���
if %HOUR% LEQ %NINE% set HOUR=%ZERO%%TMP_HOUR%
::������ʱ���븳ֵ
set DATE_TIME_STAMP="%YEAR%%MONTH%%DAY%_%HOUR%%MINUTE%%SECOND%"
::��ֵ�ļ�����
set LogFile="%LogFile_Folder%\[@Robocopy_log_%DATE_TIME_STAMP%].txt"
::�����ų��ļ���Ŀ¼
set xf_list= thumbs.db *.bak desktop.ini .DS_STORE ._* __MACOSX .AppleDouble ._.* .DS_Store Thumbs.db .*.swp .*~ .svn $RECYCLE.BIN $Eis$Bak aquota.group aquota.user
set xd_list= "$RECYCLE.BIN" "System Volume Information" "RECYCLER" "lost+found" 

:: ִ��robocopy�������� 
robocopy %Src_folder% %Dest_folder% /E /J /X /ETA /FP /V /TEE /R:3 /W:30 /LOG+:"%LogFile%" /XF %xf_list% /XD %xd_list% /COMPRESS /XJ 

:: _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
:: ====================== Robocopy ������ʾ======================
:: /S :: ������Ŀ¼���������ƿյ���Ŀ¼��
:: /E :: ������Ŀ¼�������յ���Ŀ¼
:: /PURGE :: ɾ��Դ�в��ٴ��ڵ�Ŀ���ļ�/Ŀ¼
:: /MIR :: ����Ŀ¼�� ��ͬ�� /E �� /PURGE
:: /J :: ����ʱʹ��δ����� I/O �Ƽ��ڸ��ƴ��ļ�ʱʹ��
:: /R:n :: ʧ�ܸ��������Դ���: Ĭ��Ϊ 1 ����
:: /W:n :: �������Լ�ĵȴ�ʱ��: Ĭ��Ϊ 30 ��
:: /XF �ļ�[�ļ�]... :: �ų����������/·��/ͨ���ƥ����ļ�
:: /XD Ŀ¼[Ŀ¼]... :: �ų����������/·��ƥ���Ŀ¼
:: /COMPRESS :: ����������ļ������ڼ���������ѹ��
:: /XJ:: �ų��ļ���Ŀ¼�ķ������ӺͽӺϵ㡣
:: /XJD:: �ų�Ŀ¼�ͽӺϵ�ķ�������
:: /XJF :: �ų��ļ��ķ�������
:: /FP :: ������а����ļ�������·������
:: /ETA :: ��ʾ�����ļ���Ԥ�ڵ���ʱ��
:: /V :: ������ϸ���ͬʱ��ʾ�������ļ�
:: /X :: �������ж�����ļ�������ֻ��ѡ�е��ļ�
:: /MT[:n] :: ʹ�� n ���߳̽��ж��̸߳���(Ĭ��ֵΪ 8)��
::                       n ��������Ϊ 1�������ô��� 128��
::                       ��ѡ���� /IPG �� /EFSRAW ѡ����ݡ�
::                       ʹ�� /LOG ѡ���ض�������Ա����������
:: /ZB :: ʹ�ÿ���������ģʽ,����ܾ�����ʹ�ñ���ģʽ
:: ====================== Robocopy ������ʾ======================
:: _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

::��ȡ����ʱ��
set end_time=%time:~0,8%
set end_date=%date%
set End_Time_Data=%end_date%_(%end_time%)
::���� END
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
echo .+---[ִ�п�ʼʱ��-%Start_Time_Data% ]                       
echo .+---[ִ�н���ʱ��-%End_Time_Data% ]
echo Done.
echo _/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
pause
