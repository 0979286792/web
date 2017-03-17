<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="preview_dotnet_templates_registration_Form_index" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="Coming soon, Bootstrap, Bootstrap 3.0, Free Coming Soon, free coming soon, free template, coming soon template, Html template, html template, html5, Code lab, codelab, codelab coming soon template, bootstrap coming soon template">
    <title>生物辨識圖鑑</title>
    <!-- ============ Google fonts ============ -->
    <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet'
        type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300,800'
        rel='stylesheet' type='text/css' />
    <!-- ============ Add custom CSS here ============ -->
    <link href="/resources/.css//bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="/resources/.css//style.css" rel="stylesheet" type="text/css" />
    <link href="/resources/.css//font-awesome.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#"></a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                    <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                        class="icon-bar"></span><span class="icon-bar"></span>
                </button>
            </div>
                <div class="collapse navbar-collapse navbar-menubuilder">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/">首頁</a> </li>
                    <li><a href="/products">圖鑑大全</a> </li>
                    <li><a href="/contact">登入</a> </li>           
                </ul>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <div id="banner">
                <h1> 歡迎蒞臨  生物辨識圖鑑</h1>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                        <legend>螃蟹資料<i class="fa fa-pencil pull-right"></i></legend>
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="中文名稱：" CssClass="col-lg-3 control-label"></asp:Label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="TextBox1" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="科別名稱：" CssClass="col-lg-3 control-label"></asp:Label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="TextBox2" runat="server" placeholder="" CssClass="form-control"
                                    ></asp:TextBox>
                                <div class="checkbox">
                                </div>
                            </div>
                        </div>

                          <div class="form-group">
                            <asp:Label ID="Label3" runat="server" Text="外觀形狀：" CssClass="col-lg-3 control-label"></asp:Label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="TextBox3" runat="server" placeholder="" CssClass="form-control"
                                   ></asp:TextBox>
                                <div class="checkbox">
                                </div>
                            </div>
                        </div>

                          <div class="form-group">
                            <asp:Label ID="Label4" runat="server" Text="習性：" CssClass="col-lg-3 control-label"></asp:Label>
                            <div class="col-lg-9">
                                <asp:TextBox ID="TextBox4" runat="server" placeholder="" CssClass="form-control"
                                   ></asp:TextBox>
                                <div class="checkbox">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-8">
                                <asp:Button ID="btninto" runat="server" CssClass="btn btn-primary" Text="新增" />
                           
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.backstretch.js" type="text/javascript"></script>
    <script type="text/javascript">
        'use strict';

        /* ========================== */
        /* ::::::: Backstrech ::::::: */
        /* ========================== */
        // You may also attach Backstretch to a block-level element
        $.backstretch(
        [
            "img/44.jpg",
            "img/colorful.jpg",
            "img/34.jpg",
            "img/images.jpg"
        ],

        {
            duration: 4500,
            fade: 1500
        }
    );
    </script>
    </form>
</body>
</html>
