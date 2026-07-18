# Alexander Baldree - CSD430 Module 6 JavaBean Database Project

## Database Info

Database: `CSD430`  
Username: `student1`  
Password: `pass`  
Table: `alex_movies_data`  

## Main Pages

- `index.jsp`
- `displayMovie.jsp`
- `createTable.jsp`
- `populateTable.jsp`
- `dropTable.jsp`

## JavaBean Source Code

- `WEB-INF/src/com/baldree/beans/MovieDBBean.java`
- `WEB-INF/src/com/baldree/beans/MovieRecord.java`

## Important Setup

Place your MySQL Connector/J jar inside:

```text
WEB-INF/lib
```

Example jar name:

```text
mysql-connector-j-8.0.33.jar
```

## Compile Command

Run this from inside the project folder:

```bash
javac -cp "WEB-INF/lib/mysql-connector-j-8.0.33.jar" -d WEB-INF/classes WEB-INF/src/com/baldree/beans/*.java
```

## Open in Tomcat

After copying the project folder into Tomcat `webapps`, open:

```text
http://localhost:8080/Module6_JavaBean_Movies_Project/index.jsp
```
