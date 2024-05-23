<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Pagination</title>
    <style>
        #user-content-container {
            border-radius: 20px;
            margin: 30px 20px;
            background-color: rgb(207, 207, 207);


            display: flex;
            justify-content: space-evenly;
            flex-direction: row;
            flex-wrap: wrap;
        }

        .user-content {
            border: 5px solid rgb(124 0 232);
            border-radius: 20px;
            background-color: rgb(58 0 97);
            display: flex;
            flex-direction: column;
            font-size: 20px;
            min-width: 30%;
            padding-top: 50px;
            padding-bottom: 50px;
            margin: 20px 30px;
        }

        .row {
            background-color: rgb(169 197 255);
            margin: 30px 8%;
            padding: 15px 20px;
            border-radius: 15px;
            display: flex;
            justify-content: space-evenly;
            flex-wrap: wrap;
        }

        .row-header {
            text-align: center;
            border-radius: 15px;
            width: 40%;
            margin: auto;
            margin-bottom: 20px;
            border-bottom: 2px solid rgb(169 197 255);
            border-top: 2px solid rgb(169 197 255);
            color: rgb(250, 224, 253);
        }

        /* css for index */
        #page_index {
            width: 41%;
            margin: auto;
            border: 2px solid red;
        }

        .svg_arrow_div {
            display: inline;
            background-color: rgba(251, 0, 0, 0.72);
            border-radius: 100px;
            margin: 8px;
            padding: 12px 11px;
            opacity: 0.8;
        }

        .arrow_mid {
            margin-top: 20px;
            background-color: rgb(220, 220, 220);
            display: inline;
            border-radius: 40px;
            padding: 10px 0px;
        }

        .arrow_mid li {
            display: inline;
            margin: 0px;
            border-radius: 40px;
            padding: 15px 20px;
        }

        #one {
            border: 2px solid rgba(251, 0, 0, 0.72);
        }
    </style>
</head>

<body>
    <div id="user-content-container">

        <c:forEach var="student" items="${sessionScope.studentArr}">
            <div class="user-content">
                <div class="row-header">
                    <span>Id</span>
                    <span> : </span>
                    <span>${student.sid}</span>
                </div>
                <div class="row">
                    <span>Name</span>
                    <span> : </span>
                    <span>${student.sname}</span>
                </div>
                <div class="row">
                    <span>Age</span>
                    <span> : </span>
                    <span>${student.sage}</span>
                </div>
                <div class="row">
                    <span>Address</span>
                    <span> : </span>
                    <span>${student.saddress} </span>
                </div>
            </div>
        </c:forEach>
    </div>

    <div id="page_index">
        <div class="svg_arrow_div">
            <img src="src/main/webapp/svg/left-arrow.svg" alt="My Happy SVG" />
        </div>
        <div class="arrow_mid">
            <li id="one">1</li>
            <li id="two">2</li>
            <li>3</li>
            <li> . . . </li>
            <li>7</li>
            <li>8</li>
            <li>9</li>
        </div>
        <div class="svg_arrow_div">
            <img src="src/main/webapp/svg/right-arrow.svg" alt="My Happy SVG" />
        </div>
    </div>
</body>

</html>