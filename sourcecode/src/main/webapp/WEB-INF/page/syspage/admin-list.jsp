<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: baiyuhong
  Date: 2018/10/4
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../../include/publicMeta.jsp"%>
<%@include file="../../include/publicHeader.jsp"%>
<%@include file="../../include/publicMenu.jsp"%>

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> Home
        <span class="c-gray en">&gt;</span>
        Administrator management
        <span class="c-gray en">&gt;</span>
        Administrator list <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="Refresh" ><i class="Hui-iconfont">&#xe68f;</i></a> </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <span class="l"> <a href="javascript:;" onclick="admin_add('Add administrator','adminAdd','800','500')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> Add administrator</a> </span>
                <span>Note: If the administrator password of the current login is modified, it will prompt that there is no permission. Please log in again.</span>
                <span class="r">Total data：<strong>${total}</strong></span>
            </div>
            <table class="table table-border table-bordered table-bg" id="mytable">
                <thead>
                <tr>
                    <th scope="col" colspan="10">List of post-stage administrators</th>
                </tr>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th width="">ID</th>
                    <th width="">Admin Name</th>
                    <th width="">Admin password</th>
                    <th width="">Encrypted salt</th>
                    <th width="">Role</th>
                    <th width="">Address</th>
                    <th width="">Phone</th>
                    <th width="100">Is it enabled</th>
                    <th width="100">Operation</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${us}" var="sysUser">
                <tr class="text-c">
                    <td><input type="checkbox" value="1" name=""></td>
                    <td>${sysUser.id}</td>
                    <td>${sysUser.name}</td>
                    <td>${fn:substring(sysUser.password, 0, 5)}...</td>
                    <td>${fn:substring(sysUser.salt, 0, 5)}...</td>
                    <td>
                        <c:forEach items="${user_roles[sysUser]}" var="role">
                            ${role.name} <br>
                        </c:forEach>
                    </td>
                    <td>${sysUser.address}</td>
                    <td>${sysUser.phone}</td>
                    <td class="td-status">
                       <c:if test="${sysUser.status==1}">
                            <span class="label label-success radius">Enable</span>
                        </c:if>
                        <c:if test="${sysUser.status==0}">
                            <span class="label radius">Disable</span>
                        </c:if>

                    </td>
                    <c:if test="${subject.hasRole('admin')}">
                        <td class="td-manage" >
                                <c:if test="${sysUser.status==0}">
                                <a style="text-decoration:none" onclick="start(this,'${sysUser.name}')" href="javascript:;">
                                    <i class="Hui-iconfont">
                                        &#xe631;
                                    </i>
                                </a>
                            </c:if>
                            <c:if test="${sysUser.status==1}">
                            <a style="text-decoration:none" onclick="stop(this,'${sysUser.name}')" href="javascript:;">
                                <i class="Hui-iconfont">
                                    &#xe615;
                                </i>
                            </a>
                            </c:if>
                            <a title="Edit" href="javascript:;" onclick="admin_edit('Admin edit','editUser?id=${sysUser.id}','1','800','500')" class="ml-5" style="text-decoration:none">
                                <i class="Hui-iconfont">&#xe6df;</i>
                            </a>
                            <a deleteLink="true" title="Delete" href="/config/deleteUser?id=${sysUser.id}"  class="ml-5" style="text-decoration:none">
                                <i class="Hui-iconfont">&#xe6e2;</i>
                            </a>
                        </td>
                    </c:if>
                    <c:if test="${!subject.hasRole('admin')}">
                        <td>No operation permission</td>
                    </c:if>
                </tr>
                </c:forEach>
                </tbody>
            </table>

        </article>
        <article class="cl pd-20">
            <%@include file="../adminPage.jsp"%>
        </article>
    </div>
</section>

<%@include file="../../include/publicFooter.jsp"%>

<script type="text/javascript">
    /*
        参数解释：
        title	标题
        url		请求的url
        id		需要操作的数据id
        w		弹出层宽度（缺省调默认值）
        h		弹出层高度（缺省调默认值）
    */
        $(function(){
            $("a").click(function(){
                var deleteLink = $(this).attr("deleteLink");
                console.log(deleteLink);
                if("true"==deleteLink){
                    var confirmDelete = confirm("Confirm to delete?");
                    if(confirmDelete)
                        return true;
                    return false;

                }
            });
        })

    /*管理员-增加*/
    function admin_add(title,url,w,h){
        layer_show(title,url,w,h);
    }

    /*管理员-编辑*/
    function admin_edit(title,url,id,w,h){
        layer_show(title,url,w,h);
    }

    /*自定义*/
    function start(obj,name) {
        layer.confirm('Confirm to enable？',function(){
            $.get(
                "enableStatus",
                {"name":name},
                function (result) {
                    if("success"==result){
                       // location.reload();
                        $(obj).parents("tr").find(".td-manage").prepend('<a onclick="start(this,\'${sysUser.name}\')" href="javascript:;" title="Disable" style="text-decoration:none"></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">Enable</span>');
                        //$(obj).remove();
                        layer.msg('Enable!', {icon: 6,time:1000});
                        location.reload();
                    }
                }
            );
      });
    }
    function stop(obj,name) {
        layer.confirm('Confirm to diable？',function(){
            $.get(
                "stopStatus",
                {"name":name},
                function (result) {
                    if("success"==result){
                        // location.reload();
                        $(obj).parents("tr").find(".td-manage").prepend('<a onclick="start(this,\'${sysUser.name}\')" href="javascript:;" title="Enable" style="text-decoration:none"></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">Disable</span>');
                        //$(obj).remove();
                        layer.msg('Disable!', {icon: 6,time:1000});
                        location.reload();
                    }
                }
            );
        });
    }



</script>

</body>
</html>
