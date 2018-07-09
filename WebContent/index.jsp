<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--
	作者：1327547720@qq.com
	时间：2018-07-08
	描述：
	"https://ajax.googleapis.com/ajax/libs/angularjs/1.2.13/angular.js"
-->
	<script type="text/javascript" src="WEB-INF/js/angular.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body ng-app="myapp" ng-controller="myctrl">
	<br>
	<input type="text" ng-model="username">
	<br>
	最爱的人:<span style="color: red;">{{username}}</span>
	<br>
	  <input ng-model="query"/>
	  	<br>
	排序方式:<select ng-model="sortType">
	    <option value="name">
		按名字排序</option>
	    <option value="age">
		按年龄排序</option>
	  	</select>
	  <ul>
	    <li ng-repeat="phone in phones
			| filter:query | orderBy:sortType">
		     {{phone.name}}
		     <p>{{phone.sex}}</p>
		     <p>{{phone.age}}</p>
	    </li>
	   </ul>
   
		<div ng-controller="mydate">
			现在时间:{{date}}
		</div>
			
	<script type="text/javascript">
   // 初始化 myapp 模块 
		var myapp = angular.module("myapp",[]);
		var data=[{
	   		name:"迪丽热巴",
	   		sex:"女",
	   		age:24
	   	},
	   	{
	   		name:"迪丽热巴2",
	   		sex:"女2",
	   		age:23
	   	},{
	   		name:"迪丽热巴3",
	   		sex:"女2",
	   		age:22
	   	},{
	   		name:"迪丽热巴4",
	   		sex:"女2",
	   		age:21
	   	}
		]
		// 定义模块的控制器 
		// 依赖注入 ，$scope作用域对象，操作当前作用域视图 
		myapp.controller("myctrl", ["$scope", function($scope){
			// 对模型进行初始化赋值 
			$scope.username = "欢欢欢";
			$scope.phones = data;
			 $scope.sortType = 'age';
		}]);
		myapp.controller("mydate", ["$scope","$timeout", function($scope,$timeout){
			
			 var update_date=function(){
			 	$scope.date=new Date();
			 	$timeout(function(){
			 		update_date();
			 	},1000);
			 }
			 update_date();
		}]);
	</script>

</body>
</html>