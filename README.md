# SpringBootCodeGenerator

![image](https://img.shields.io/badge/SpringBoot2-%E2%98%85%E2%98%85%E2%98%85%E2%98%85%E2%98%85-brightgreen.svg)
![image](https://img.shields.io/badge/Freemarker-%E2%98%85%E2%98%85%E2%98%85%E2%98%85%E2%98%85-brightgreen.svg)
![image](https://img.shields.io/badge/CodeGenerator-%E2%98%85%E2%98%85%E2%98%85%E2%98%85%E2%98%85-brightgreen.svg)
[![Build Status](https://travis-ci.org/moshowgame/SpringBootCodeGenerator.svg?branch=master)](https://travis-ci.org/moshowgame/SpringBootCodeGenerator)

> 原项目地址 [SpringBootCodeGenerator](https://github.com/moshowgame/SpringBootCodeGenerator)
> 在此基础上进行了一些修改

### 项目介绍

基于SpringBoot2+Freemarker的代码生成器，用DDL SQL语句生成JPA/JdbcTemplate/Mybatis/BeetlSQL相关代码，支持mysql/oracle/pgsql等三大数据库。以释放双手为目的。

<table><tbody>
<tr><td>访问路径</td> <td>http://127.0.0.1:1234/generator</td></tr>
<tr><td>在线地址</td> <td>http://java.bejson.com/generator</td></tr>
<tr></tr>

<table><tbody>
<tr><td>字段名</td> <td>说明</td></tr>
<tr><td>packageName</td> <td>自定义的包名</td></tr>
<tr><td>authorName</td> <td>自定义的作者名</td></tr>
<tr><td>returnUtil</td> <td>自定义的返回Util</td></tr>
<tr><td>tableName</td> <td>sql中的表名</td></tr>
<tr><td>className</td> <td>java类名</td></tr>
<tr><td>classComment</td> <td>sql表备注/java类备注</td></tr>
<tr><td>fieldName</td> <td>字段名</td></tr>
<tr><td>fieldComment</td> <td>字段备注</td></tr>
</tbody></table>

### 运行效果

**首页**

![](https://raw.githubusercontent.com/gaohanghang/images/master/img20190524200756.png)

### 添加功能

#### JPA-NEW(将JPA修改为适合自己项目的模板)

![](https://raw.githubusercontent.com/gaohanghang/images/master/img20190707211702.png)

#### bean get set

项目中经常会遇到需要 get bean 所有属性和 set bean 所有属性的情况，添加此功能方便开发

![](https://raw.githubusercontent.com/gaohanghang/images/master/img20190707212234.png)

#### SQL

使用Navicat 通常需要写select、insert、update、delete语句，比较麻烦，使用此功能只需要填充数据即可使用

![](https://raw.githubusercontent.com/gaohanghang/images/master/img20190707212624.png)

![](https://raw.githubusercontent.com/gaohanghang/images/master/img20190707212703.png)

![](https://raw.githubusercontent.com/gaohanghang/images/master/img20190707212728.png)

![](https://raw.githubusercontent.com/gaohanghang/images/master/img20190707212756.png)






