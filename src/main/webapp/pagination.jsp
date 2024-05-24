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

        /* Paging Index css */
        #page_index {
            width: 100%;
            display: flex;
            justify-content: center;
        }

        .svg_arrow_div {
            display: inline;
            background-color: rgba(251, 0, 0, 0.72);
            border-radius: 100px;
            padding: 12px 11px;
            opacity: 0.8;
            margin: 0%;
        }

        .arrow_mid {
            margin-top: 20px;
            background-color: rgb(220, 220, 220);
            display: inline;
            border-radius: 40px;
            padding: 10px 0px;
            margin: 0% 10px;
        }

        .arrow_mid li {
            display: inline;
            margin: 0px;
            border-radius: 50px;
            padding: 20px 25px;
        }

        #between {
            border: 2px solid rgba(251, 0, 0, 0.72);
        }
    </style>
    
	<c:if test="${sessionScope.totalPages le 6}">	
		<style>
	        .arrow_mid li:nth-child(${sessionScope.currPageNo + 1}) {
	   	        border: 2px solid rgba(251, 0, 0, 0.72);
	       	}	
		</style>        
	</c:if>
	<c:if test="${sessionScope.totalPages gt 6 and sessionScope.currPageNo+1 le 3}">	
		<style>
	        .arrow_mid li:nth-child(${sessionScope.currPageNo + 1}) {
	   	        border: 2px solid rgba(251, 0, 0, 0.72);
	       	}	
		</style>        
	</c:if>
	<c:if test="${sessionScope.totalPages gt 6 and sessionScope.currPageNo+1 eq sessionScope.totalPages-2}">	
		<style>
	        #five {
	   	        border: 2px solid rgba(251, 0, 0, 0.72);
	       	}	
		</style>        
	</c:if>
	<c:if test="${sessionScope.totalPages gt 6 and sessionScope.currPageNo+1 eq sessionScope.totalPages-1}">	
		<style>
	        #six {
	   	        border: 2px solid rgba(251, 0, 0, 0.72);
	       	}	
		</style>        
	</c:if>
	<c:if test="${sessionScope.totalPages gt 6 and sessionScope.currPageNo+1 eq sessionScope.totalPages}">	
		<style>
	        #seven {
	   	        border: 2px solid rgba(251, 0, 0, 0.72);
	       	}	
		</style>        
	</c:if>
	
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
        <div class="svg_arrow_div left-arrow">
            <c:import url="svg/left-arrow.svg" />
        </div>
        <div class="arrow_mid">
            <c:choose>
                <c:when test="${sessionScope.totalPages gt 6 and sessionScope.currPageNo+1 gt 3 and sessionScope.currPageNo+1 lt sessionScope.totalPages-2}">
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                    <li>..</li>
                    <li id="between"> ${ sessionScope.currPageNo+1 } </li>
                    <li>..</li>
                    <li>${sessionScope.totalPages-2}</li>
                    <li>${sessionScope.totalPages-1}</li>
                    <li>${sessionScope.totalPages}</li>
                </c:when>
                <c:when test="${sessionScope.totalPages gt 6}">
                    <li>1</li>
                    <li>2</li>
                    <li>3</li>
                    <li> . . . </li>
                    <li id="five">${sessionScope.totalPages-2}</li>
                    <li id="six">${sessionScope.totalPages-1}</li>
                    <li id="seven">${sessionScope.totalPages}</li>
                </c:when>
                <c:otherwise>
                    <c:forEach var="pageNo" begin="1" end="${sessionScope.totalPages}">
                        <li>${pageNo}</li>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="svg_arrow_div right-arrow">
            <c:import url="svg/right-arrow.svg" />
        </div>
    </div>
    
    <form id="my-form" action="./second" method="post">
        <input id="currPageNo" type="hidden" name="currPageNo" value="${sessionScope.currPageNo}">
    </form>

    <script type="text/javascript" src="<c:url value='../index.js'/>"></script>
</body>

</html>