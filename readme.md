# The New Up
## 怎么运行
* Import as maven project. Run on Server. 选择Tomcat.
* 如果你没有安装Tomcat，但是你装了Maven，也可以在cmd下打开项目所在目录，输入``mvn jetty:run``  

## 配置文件
* src/main/resources/jdbc.properties是配置jdbc连接的文件，请根据你的实际情况修改
* src/main/webapp/WEB-INF/applicationContext.xml是spring的配置文件，请仔细阅读并根据你的需要修改
