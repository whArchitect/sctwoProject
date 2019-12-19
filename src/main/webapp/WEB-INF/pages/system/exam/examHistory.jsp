<%--
  Created by IntelliJ IDEA.
  User: q
  Date: 2019/12/19
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>考试历史</title>
    <link rel="stylesheet" href="${whContextPath}/resources/layui/css/layui.css">
    <link rel="stylesheet" href="${whContextPath}/resources/css/public.css">
    <style>
        #all{
            position: absolute;
            left: 11%;
        }
    </style>
</head>
<body class="childrenBody">
<div id="all" style="">
<!-- 搜索条件开始 -->
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>查询条件</legend>
</fieldset>
<form class="layui-form" method="post" id="searchFrm">
    <!-- 总的 -->
    <div class="layui-form-item">
        <!-- 每行的-->
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">试卷名称:</label>
                <div class="layui-input-inline">
                    <input type="text" name="checkid" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">考生姓名:</label>
                <div class="layui-input-inline">
                    <input type="text" name="startTime"  autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">批卷老师:</label>
                <div class="layui-input-inline">
                    <input type="text" name="endTime" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <!-- 每行的-->
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">开始时间:</label>
                <div class="layui-input-inline">
                    <input type="text" name="startTime" id="startTime" readonly="readonly"   autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">是否考试</label>
                <div class="layui-input-block">
                    <select name="city" lay-verify="required">
                        <option value=""></option>
                        <option value="1">已考</option>
                        <option value="0">缺考</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">是否批阅</label>
                <div class="layui-input-block">
                    <select name="city" lay-verify="required">
                        <option value=""></option>
                        <option value="1">已批阅</option>
                        <option value="0">未批阅</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
    <a href="${pageContext.request.contextPath}"></a>
    <div  class="layui-form-item" style="text-align: center;">
        <div class="layui-input-block">
            <button type="button" class="layui-btn layui-btn-normal  layui-icon layui-icon-search" id="doSearch">查询</button>
            <button type="reset" class="layui-btn layui-btn-warm  layui-icon layui-icon-refresh">重置</button>
        </div>
    </div>
</form>
<!-- 搜索条件结束 -->

<!-- 数据表格开始 -->
<table class="layui-hide" id="checkTable" lay-filter="checkTable" style=""></table>
</div>
<!-- toolbar工具条 -->
<div style="display: none;" id="checkToolBar">

</div>
<!-- checkBar是每条数据的操作项 -->
<div style="display: none;"  id="checkBar">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
</div>
<!-- 数据表格结束 -->

<!-- 添加和修改的弹出层开始 -->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv" >
    <form class="layui-form"  lay-filter="dataFrm" id="dataFrm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">检查时间:</label>
                <div class="layui-input-inline">
                    <input type="text" name="checkdate"  id="checkdate" readonly="readonly" placeholder="请输入起租时间"  autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">操作员:</label>
                <div class="layui-input-inline">
                    <input type="text" name="opername" lay-verify="required"  readonly="readonly" placeholder="请输入操作员" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">检查单号:</label>
            <div class="layui-input-block">
                <input type="text" name="checkid"  id="checkid" readonly="readonly" placeholder="请输入检查单号"  autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">出租单号:</label>
            <div class="layui-input-block">
                <input type="text" name="rentid" lay-verify="required"  readonly="readonly"  placeholder="请输入出租单号" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">赔付金额:</label>
                <div class="layui-input-inline">
                    <input type="text" name="paymoney" lay-verify="required"   placeholder="请输入车牌号" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">问题描述:</label>
                <div class="layui-input-inline">
                    <input type="text" name="checkdesc" lay-verify="required"   placeholder="请输入问题描述" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">存在问题:</label>
            <div class="layui-input-block">
                <input type="text" name="problem" lay-verify="required"   placeholder="请输入身份证号" autocomplete="off"
                       class="layui-input">
            </div>
        </div>

        <div class="layui-form-item" style="text-align: center;">
            <div class="layui-input-block">
                <button type="button" class="layui-btn layui-btn-normal layui-btn-sm layui-icon layui-icon-release" lay-filter="doSubmit" lay-submit="">提交</button>
                <button type="reset" class="layui-btn layui-btn-warm layui-btn-sm layui-icon layui-icon-refresh" >重置</button>
            </div>
        </div>
    </form>

</div>
<!-- 添加和修改的弹出层结束 -->

<script src="${whContextPath}/resources/layui/layui.js"></script>
<script type="text/javascript">
    var tableIns;
    layui.use([ 'jquery', 'layer', 'form', 'table','laydate'  ], function() {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var laydate = layui.laydate;
        laydate.render({
            elem:'#startTime',
            type:'datetime' //日期时间选择器:年月日 时分秒
        });
        laydate.render({
            elem:'#endTime',
            type:'datetime'
        });
        laydate.render({
            elem:'#checkdate',
            type:'datetime'
        });
        //渲染数据表格
        tableIns=table.render({
            elem: '#checkTable'   //渲染的目标对象
            ,url:'${whContextPath}/check/loadAllCheck' //数据接口
            ,title: '检查单数据表'//数据导出来的标题
            ,toolbar:"#checkToolBar"   //表格的工具条
            // ,height:'full-220'
            ,height: '480'
            ,cellMinWidth:100 //设置列的最小默认宽度
            ,page: true  //是否启用分页
            ,cols: [[   //列表数据
                 {field:'checkid', title:'序号',align:'center',width:'100'}
                ,{field:'checkdate', title:'试卷名称',align:'center',width:'150'}
                ,{field:'problem', title:'考生姓名',align:'center',width:'150'}
                ,{field:'opername', title:'批卷老师',align:'center',width:'150'}
                ,{field:'createtime', title:'成绩',align:'center',width:'150'}
                ,{field:'createtime', title:'开考时间',align:'center',width:'180'}
                ,{field:'createtime', title:'是否考试',align:'center',width:'100'}
                ,{field:'createtime', title:'是否批阅',align:'center',width:'100'}
                ,{fixed: 'right', title:'', toolbar: '#checkBar', width:100,align:'center'}
            ]]
        })
        //模糊查询
        $("#doSearch").click(function(){
            var params=$("#searchFrm").serialize();
            tableIns.reload({
                url:"${whContextPath}/check/loadAllCheck?"+params ,
                page:{
                    curr:1
                }
            })
        });

        //监听行工具事件
        table.on('tool(checkTable)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            if(layEvent === 'edit'){ //编辑
                openUpdateCheck(data);
            }
        });
        var url;
        var mainIndex;
        //打开修改页面
        function openUpdateCheck(data){
            mainIndex=layer.open({
                type:1,
                title:'修改检查单',
                content:$("#saveOrUpdateDiv"),
                area:['800px','400px'],
                success:function(index){
                    form.val("dataFrm",data);
                    url="${whContextPath}/check/updateCheck";
                }
            });
        }
        //保存
        form.on("submit(doSubmit)",function(obj){
            //序列化表单数据
            var params=$("#dataFrm").serialize();
            $.post(url,params,function(obj){
                layer.msg(obj.msg);
                //关闭弹出层
                layer.close(mainIndex);
                //刷新数据 表格
                tableIns.reload();
            })
        });
    });
</script>
</body>
</html>
