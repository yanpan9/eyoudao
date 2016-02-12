# eyoudao
goldendict词典的有道扩展程序  
基于windows有道词典的5.1.38.3211版本  

## 安装
	sudo apt-get install goldendict
	sudo apt-get install libxml2-dev
	sudo apt-get install libxslt1-dev

	git clone https://github.com/Onway/eyoudao.git
	cd eyoudao
	sudo ./install

## 卸载
	cd /opt/eyoudao
	sudo ./uninstall

## 配置
在goldendict的Edit - Dictionaries加入如下配置：  
![image](https://github.com/Onway/eyoudao/raw/master/img/setting.png)  
如果启用了多个eyoudao的扩展程序，可能要分别添加词典分组，否则css布局可能会相互影响。

## 效果图
![image](https://github.com/Onway/eyoudao/raw/master/img/preview.png)

## BUGS
* windows的有道辞典早已不是5.1版本了，xsl文件已经很旧了，所幸xml格式和api接口都没变。

## 版权
* xml数据和各种xsl,js,css,png文件都是修改或源自windows的有道词典安装文件。  
* pyfanyi.py程序由SkyHacker(skyhacker@126.com)编写。  

## 其他
* [有道与deepin联合开发的官方版本](http://cidian.youdao.com/index-linux.html)
* [openyoudao](http://www.openyoudao.org/)
