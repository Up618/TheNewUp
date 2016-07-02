# The New Up
## 怎么运行
* Import as maven project. Run on Server. 选择Tomcat.
* 如果你没有安装Tomcat，但是你装了Maven，也可以在cmd下打开项目所在目录，输入``mvn jetty:run``  

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
