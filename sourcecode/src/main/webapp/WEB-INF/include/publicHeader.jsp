<%--
  Created by IntelliJ IDEA.
  User: baiyuhong
  Date: 2018/9/29
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--_header 作为公共模版分离出去-->
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl">
            <a class="logo navbar-logo f-l mr-10 hidden-xs" href="/fore/foreIndex" target="_blank">Front-end Home</a>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a class="logo navbar-logo f-l mr-10 hidden-xs" href="/index">Back-end Home</a>

            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>

            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                    <li>
                        <c:if test="${subject.hasRole('admin')}">
                            Super Administrator
                         </c:if>
                        <c:if test="${!subject.hasRole('admin')}">
                            Business Administrator
                        </c:if>
                    </li>
                    <li class="dropDown dropDown_hover"> <a href="#" class="dropDown_A">Hello，${subject.principal} <i class="Hui-iconfont">&#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="${pageContext.request.contextPath}/islogout">Logout</a></li>
                        </ul>
                    </li>

                    <li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="Change theme"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" data-val="default" title="默认（黑色）">Defaut（Black）</a></li>
                            <li><a href="javascript:;" data-val="blue" title="蓝色">Blue</a></li>
                            <li><a href="javascript:;" data-val="green" title="绿色">Green</a></li>
                            <li><a href="javascript:;" data-val="red" title="红色">Red</a></li>
                            <li><a href="javascript:;" data-val="yellow" title="黄色">Yellow</a></li>
                            <li><a href="javascript:;" data-val="orange" title="橙色">Orange</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<!--/_header 作为公共模版分离出去-->
