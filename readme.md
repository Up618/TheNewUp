# The New Up
## 怎么运行
* __不需要fork！直接clone本项目！！__
* Import as maven project. Run on Server. 选择Tomcat.
* 如果你没有安装Tomcat，但是你装了Maven，或者你想尝试一下不用IDE也运行这个项目，也可以在cmd下打开项目所在目录，输入``mvn jetty:run``  

## 配置文件
* src/main/resources/jdbc.properties是配置jdbc连接的文件，请根据你的实际情况修改
```
jdbc.driverClassName=com.mysql.jdbc.Driver
jdbc.url=jdbc:mysql://localhost/up2
jdbc.username=root
jdbc.password=root
```
* src/main/webapp/WEB-INF/applicationContext.xml是spring的配置文件，请修改以下内容
```xml
    <property name="hibernateProperties">
			<value>
				hibernate.dialect=org.hibernate.dialect.MySQLDialect
				hibernate.hbm2ddl.auto=create-drop
				hibernate.show_sql=true
				hibernate.hbm2ddl.import_files=import.sql
			</value>
		</property>
```
将``hibernate.hbm2ddl.auto``的值改成create-drop（创建删除）或者update（更新）
* src/main/resouces/import.sql是默认导入的sql脚本，你可以在里面添加测试数据


## 已完成部分
* 登陆和注册  
* 发简单文本微博
* 查看自己的微博

## 未完成部分
* 个人主页部分的前端待完善
* 没有点赞和评论的前端
* 日志

## License
The MIT License (MIT)  
Copyright (c) 2016 Up618