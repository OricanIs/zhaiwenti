<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>宅文体商品管理</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="/asset/sellerAsset/css/zyUpload.css" type="text/css">
    <link href="/asset/sellerAsset/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/asset/sellerAsset/css/sb-admin.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="/asset/sellerAsset/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="/asset/sellerAsset/css/bookRepertory.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/seller/pendingOrderPage.action"><s:property value="#session.seller.name"/> </a>
        </div>
        <!-- Top Menu Items -->
        <ul class="nav navbar-right top-nav">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <s:property value="#session.seller.username"/> <b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <%--<li>--%>
                        <%--<a href="#" class="switchModel" data-target="seller-info"><i class="fa fa-fw fa-user" ></i> 我的信息</a>--%>
                    <%--</li>--%>
                    <li class="divider"></li>
                    <li>
                        <a href="/seller/exit.action"><i class="fa fa-fw fa-power-off"></i> 退出</a>
                    </li>
                </ul>
            </li>
        </ul>
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav side-nav">
                <li>
                    <a href="/seller/pendingOrderPage.action"><i class="fa fa-fw fa-bar-chart-o"></i> 待处理订单</a>
                </li>
                <li>
                    <a href="/seller/waitingOrderPage.action"><i class="fa fa-fw fa-table"></i> 已接受订单</a>
                </li>
                <li >
                    <a href="/seller/completeOrderPage.action"><i class="fa fa-fw fa-edit"></i> 已完成订单</a>
                </li>
                <li class="active">
                    <a href="/seller/repertoryPage.action"><i class="fa fa-fw fa-wrench"></i> 库存查看</a>
                </li>
                <li>
                    <a href="/seller/categoryPage.action"><i class="fa fa-fw fa-file"></i> 分类管理</a>
                </li>
            </ul>
        </div>
    </nav>
    <div id="page-wrapper">
        <div class="container-fluid" id="book-repertory">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        商品管理
                    </h1>
                </div>
            </div>
            <div class="row">
                <form action="/seller/repertoryPage.action" id="inputId" method="post">
                    <div class="col-sm-4 form-horizontal">
                        <div class="form-group">
                            <div class="row">
                                <label for="num" class="col-sm-4 control-label">商品名称：</label>
                                <div class="col-sm-8">
                                    <input type="text" name="notautosubmit" style="display:none"/>
                                    <input type="tel" name="name" autofocus maxlength="11" class="form-control animated" placeholder="输入商品名称" id="num">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <div class=" col-sm-1 form-horizontal margin_left3" >
                    <div class="form-group btn-group btn-group-sm">
                        <button type="button" class="btn btn-primary" data-loading-text="查询中..." id="search"> <span class="glyphicon glyphicon-search"></span> 搜索 </button>
                    </div>
                </div>
                <div class="margin_left3 col-sm-1 form-horizontal">
                    <div class="form-group btn-group btn-group-sm">
                        <button type="button" class="btn btn-success" data-loading-text="添加中..." id="add"> <span class="glyphicon glyphicon-saved"></span> 添加商品 </button>
                    </div>
                </div>
            </div>
            <s:if test="pageBean.list.size!=0">
                <table class="table table-bordered table-hover">
                    <thead>
                    <th>图片</th>
                    <th>名称</th>
                    <th>价格</th>
                    <th>是否热销</th>
                    <th>状态</th>
                    <th>商品介绍</th>
                    <th>类别</th>
                    <th>销售量</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                    <s:iterator value="pageBean.list" var="product">
                        <tr id="<s:property value="#product.id"/>">
                            <input type="hidden" class="category" value="<s:property value="#product.category.id"/>"/>
                            <td>

                                <s:iterator value="#product.image.split(',')" var="image">
                                <img  src="<s:property value="#image"/>" data-html="true" data-toggle="popover" data-content="<img class='largeImg' src='<s:property value="#image"/>'>">
                                </s:iterator>
                            </td>
                            <td class="title"  name="名称" title="<s:property value="#product.name"/>"><s:property value="#product.name"/></td>
                            <td  class="price" > <s:property value="#product.price"/></td>
                            <td class="isHot"  name="热销状态"><s:if test="#product.state==0">正常</s:if><s:else>热销</s:else> </td>
                            <td class="state"><s:if test="#product.state==0">正常</s:if><s:else>异常</s:else></td>
                            <td class="comments"><s:property value="#product.comments"/></td>
                            <td class="state"><s:property value="#product.category.name"/></td>
                            <td class="sellCount"><s:property value="#product.sellNum"/></td>
                            <td>
                                <div class="btn-group btn-group-xs">
                                    <button class="btn btn-primary product-edit">修改</button>
                                </div>
                                <div class="btn-group btn-group-xs">
                                    <button class="btn btn-danger product-del">下架</button>
                                </div>
                            </td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
                <nav>
                    <ul class="pagination pagination-sm">
                        <s:url value="%{pageBean.url}" var="bookRepertory"></s:url>
                        <s:if test="pageBean.page!=pageBean.startIndex">
                            <li>
                                <a href="<s:property value="#bookRepertory"/>?page=1" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </s:if>
                        <s:if test="pageBean.page!=pageBean.startIndex||pageBean.page!=pageBean.endIndex">
                            <s:iterator var="i" begin="pageBean.startIndex" end="pageBean.endIndex">
                                <s:if test="pageBean.page==#i">
                                    <li class="active">
                                        <span aria-hidden="true"><s:property value="#i"/></span>
                                    </li>
                                </s:if>
                                <s:else>
                                    <li>
                                        <a href="<s:property value="#bookRepertory"/>?page=<s:property value="#i"/>&isbn=<s:property value="isbn"/>" aria-label="Previous">
                                            <span aria-hidden="true"><s:property value="#i"/></span>
                                        </a>
                                    </li>
                                </s:else>
                            </s:iterator>
                        </s:if>

                        <s:if test="pageBean.page!=pageBean.endIndex">
                            <li>
                                <a href="<s:property value="#bookRepertory"/>?page=<s:property value="pageBean.totalPage" />&isbn=<s:property value="isbn"/>" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </s:if>
                    </ul>
                    <ul class="info">
                        <li class="pages"><s:property value="pageBean.totalPage"/></li>
                        <li class="orders"><s:property value="pageBean.totalCount"/></li>
                    </ul>
                </nav>
            </s:if>
            <s:else>
                <h3 align="center" style="margin-top: 100px">无结果 </h3>
            </s:else>
            <!--  <hr style="margin-bottom:-10px"> -->
        </div>
    </div>
</div>
<!-- 类别编辑 -->
<div class="modal" id="editModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">商品修改</h4>
            </div>
            <div class="modal-body">
                <div id="uploadForm" class="col-xs-10 col-xs-offset-1">
                    <div class="upload_box">
                        <div class="upload_main single_main">
                            <div class="status_bar">
                                <div id="status_info" class="info">选中0张文件</div>
                                <div class="btns">
                                    <input onchange="javascript:imageChange(event)" id="fileImage" type="file" size="30" name="image">
                                    <div class="webuploader_pick">选择文件</div>
                                </div>
                            </div>
                            <div id="preview" class="upload_preview">
                            </div>
                        </div>
                    </div>
                </div>
                <form class="form-horizontal">
                    <input id="productId" type="hidden" maxlength="10" class="form-control" v-model="productId">
                    <div class="form-group">
                        <label for="inputPassword" class="col-sm-2 control-label">名称</label>
                        <div class="col-sm-8">
                            <input type="text" maxlength="10" class="form-control" v-model="title">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-sm-2 control-label">价格</label>
                        <div class="col-sm-8">
                            <input type="text" maxlength="10" class="form-control productPrice" v-model="price">
                            <p id="productPriceE" hidden  class="pic-msg">请输入正确的数值,eg:1.1</p>

                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-sm-2 control-label">商品介绍</label>
                        <div class="col-sm-8">
                            <textarea class="form-control" maxlength="150" v-model="comments"> rows="3"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-sm-2 control-label">类别</label>
                        <div class="col-sm-8" style="height: 50px">
                            <select class="form-control" v-model="selected">
                                <s:iterator value="categories" var="category">
                                    <option value="<s:property value="#category.id"/>"><s:property value="#category.name"/></option>
                                </s:iterator>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" v-on="click:confirmEdit" class="btn btn-primary">确定</button>
            </div>
        </div>
    </div>
</div>
<!-- 删除提醒 -->
<div class="modal" id="delModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <div class="modal-body">
                <p>您确定要删除这一个订单嘛？</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" id="del" class="btn btn-primary">确定</button>
            </div>
        </div>
    </div>
</div>

<script src="/asset/sellerAsset/js/jquery.js"></script>
<script src="/asset/sellerAsset/js/bootstrap.min.js"></script>
<script src="/asset/sellerAsset/js/ajaxfileupload.js"></script>
<script src="http://cdn.bootcss.com/vue/0.12.16/vue.min.js"></script>
<script type="text/javascript">
    var image = 1;
    $("#search").click(function(e){
        var id = $("#num").val();
        if(id!=''){
            $("#inputId").submit();
            $("#num").val("");
        }else {
            $("#num").val("");
            alert("输入有误，请从新输入");
        }
    })
    $("[data-toggle='popover']").popover({
        placement:'left',
        html:true,
        trigger:'hover'
    });
    var id , discountEl , remainEl , priceEl , prePriceEl; //定义一个全局ID
    //对弹框绑定Vue模型
    var modal = new Vue({
        el:'#editModal',
        data:{
            title:'',
            price:'',
            selected:1,
            productId:'',
            comments:''
        },
        methods:{

            changePic:function(e){
                e.preventDefault();
                $(e.target).siblings('input[type="file"]').click();
            },
            pictureChangeHandle:function(e){
                var target = $(e.target);
                var reader = new FileReader();
                //将文件以二进制形式读入页面
                reader.readAsDataURL(e.target.files[0]);
                reader.onload=function(e){
                    var result=document.getElementById("result");
                    target.parent().siblings('img').attr('src',this.result);
                }
            },
            confirmEdit:function(e){
                //确定修改
                if(!isfloat(this.price)){
                    $("#productPriceE").show();
                    return;
                }
                var name = this.title;
                var price = this.price;
                var categoryId = this.selected;
                var productId = $("#productId").val().trim();
                var comments = this.comments;
                $.post('/seller/addUpdateProduct.action',{"name":name,"price":price,"id":productId,"categoryId":categoryId,"comments":comments},function (data) {
                    if(data=="success"){
                        window.location.href="/seller/repertoryPage.action"
                    }else if(data=="noLogin"){
                        window.location.href="/seller/pendingOrderPage.action"
                    }else{
                        $("#imageE").show();
                    }
                })

                $("#editModal").modal('hide');
            }
        }
    })
    var orderId;

    $("table").on('click','.product-edit',function(){
        id = $(this).parents('tr').attr('id')
        var $trEl = $("#"+id);
        modal.$data.title = $trEl.find('.title').text().trim();
        modal.$data.price = $trEl.find('.price').text().trim();
        modal.$data.selected = $trEl.find('.category').val().trim();
        modal.$data.comments = $trEl.find('.comments').text().trim();
        modal.$data.productId = id;
        $("#editModal").modal('show').find('input').first().focus();
    })
    $("table").on('click','.product-del',function(){
        id = $(this).parents('tr').attr('id')
        orderId = id;
        $("#delModal").modal('show');

    })
    $("#del").click(function(e){
        //发起post请求，删除订单
        $.post("/seller/productOperation.action",{"id":orderId,"state":3},function(data){
            if(data=="notFound"){
                alert("没有找到此商品")
                window.location.href = "/seller/repertoryPage.action";
            }else if(data=="noLogin"){
                window.location.href = "/seller/pendingOrderPage.action";
            }else{
                $("#delModal").modal('hide');
                $("#" + orderId).remove();
                var ordersNum = parseInt($(".orders").text().trim())
            }
        })

    })
    $("#add").click(function(){
        modal.$data.id = '';
        modal.$data.title = '';
        modal.$data.price = '';
        modal.$data.selected =2;
        modal.$data.productId = '';
        modal.$data.comments = '';
        $("#preview").empty();
        $("#changePic").text("上传图片");
        $("#editModal").modal('show').find('input').first().focus();
    })

    //模态框关闭后清除遗留
    $("#editModal").on('hide.bs.modal',function(){

        $(".modal-discount").removeClass('has-error').find('.help-block').text("")
    })
    function isfloat(oNum){

        if(!oNum) return false;

        var strP=/^\d+(\.\d+)?$/;

        if(!strP.test(oNum)) return false;

        try{

            if(parseFloat(oNum)!=oNum) return false;

        }catch(ex){

            return false;

        }

        return true;

    }
</script>
<script type="text/javascript">
    $(function () {
        $(".webuploader_pick").click(function () {
            $("#fileImage").click();
        })



    })

    function imageChange(e) {

        var productId = $("#productId").val();
        $.ajaxFileUpload(
                {
                    url:'/seller/saveImage.action',
                    data:{"id":productId},
                    secureuri: false, //是否需要安全协议，一般设置为false
                    fileElementId:'fileImage', //文件上传域的ID
                    dataType:'html', //返回值类型 一般设置为json
                    success: function (data, status)  //服务器成功响应处理函数
                    {
                        var reg = new RegExp("^[0-9]*$");
                        if(reg.test(data.responseText)){
                            $("#productId").val(data.responseText);
                        }else if(data.responseText=="noLogin"){
                                window.location.href="/seller/pendingOrderPage.action"
                        }else{
                            $("#imageE").show();
                        }
                    },
                    error: function (data, status, e)//服务器响应失败处理函数
                    {
                        var reg = new RegExp("^[0-9]*$");
                        if(reg.test(data.responseText)){
                            $("#productId").val(data.responseText);
                        }else if(data.responseText=="noLogin"){
                            window.location.href="/seller/pendingOrderPage.action"
                        }else{
                            $("#imageE").show();
                        }
                    }
                }
        )

        var target = $(e.target);
        var reader = new FileReader();
        //将文件以二进制形式读入页面
        reader.readAsDataURL(e.target.files[0]);
        reader.onload=function(e){
            var innerhtml = '<div class="add_upload">'
                    +'<div class="file_bar">		<div style="padding:5px;">			<p class="file_name">删除</p>                                                                         <span class="file_del" data-index="'+image+'" title="删除"></span>		</div>	</div>'
                    +'<a  class="hightwith" title="点击添加文件" id="rapidAddImg" class="add_imgBox" href="javascript:void(0)">'
                    +'<div class="uploadImg" >'
                    +'<img class="upload_image hightwith" style="height: 120px" src="'+this.result+'" />'
                    +'</div></a></div>';
            var el = $(innerhtml);
            el.find(".file_del").bind('click',function(){
                var productId = $("#productId").val();
                var index = $(this).attr("data-index");
                console.log(index);
//               $.post()
            })
            el.bind({
                mouseenter: function(){
                    $(this).find(".file_bar").addClass("file_hover");
                },
                mouseleave: function(){
                    $(this).find(".file_bar").removeClass("file_hover");
                }
            })
            image++;
            $("#preview").append(el);
        }
    }
</script>
</body>

</html>
