﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="hienthimautran.aspx.cs" Inherits="hienthimautran" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headtag" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="con_slider" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="con_body" Runat="Server">
    <div class="container" style="margin-top: 80px;">
        <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
            <asp:DataList runat="server" ID="dtl_laymautran" RepeatColumns="1" Width="100%" CssClass="table">
                <ItemTemplate>
                </ItemTemplate>
            </asp:DataList>
            <p runat="server" style="font-size: 23px; margin-top: 45px; margin-bottom: 20px;" id="lbl_tenmautran"></p>
            <asp:DataList runat="server" ID="dtl_hienthidsmautran" RepeatColumns="3" Width="100%" CssClass="table">
                <ItemTemplate>
                    <img src="<%# Eval("pathImg") %>" width="240" height="150"/>
                </ItemTemplate>
            </asp:DataList>
        </div>
            
        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" style="margin-top: 100px;">
            <div class="panel panel-default visible-lg">
                <div class="panel-heading" style="background-color: #438fc1;">
                    <p style="font-size: 20px; font-weight: bold; color: #ffffff; text-align: center;background-color: #438fc1;">Tin khác</p>
                </div>
                <div class="panel-body">
                    <asp:DataList runat="server" ID="dtl_tinkhac" RepeatColumns="1" Width="100%" CssClass="table">
                        <ItemTemplate>
                            <a href="<%# "hienthibaiviet.aspx?articleID=" + Eval("mabaiviet") %>">
                                <p><%# Eval("tieude") %></p>
                            </a>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
            <div class="panel panel-default visible-lg">
                <div class="panel-heading" style="background-color: #438fc1;">
                    <p style="font-size: 20px; font-weight: bold; color: #ffffff; text-align: center; background-color: #438fc1;">Mẫu trần</p>
                </div>
                <div class="panel-body">
                    <asp:DataList runat="server" ID="dtl_hienthimautran" RepeatColumns="1" Width="100%" CssClass="table">
                        <ItemTemplate>
                            <img src="<%# Eval("anhdaidien") %>" width="190" height="150" class="center-block"/>
                            <a href="<%# "hienthimautran.aspx?ceilingID=" + Eval("mamathang") %>">
                                <p style="text-align: center; margin-top: 8px;"><%# Eval("tenmathang") %></p>
                            </a>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
            <div class="panel panel-default visible-lg">
                <div class="panel-heading" style="background-color: #438fc1;">
                    <p style="font-size: 20px; font-weight: bold; color: #ffffff; text-align: center; background-color: #438fc1;">Vật tư</p>
                </div>
                <div class="panel-body">
                        <asp:DataList runat="server" ID="dtl_hienthivattu" RepeatColumns="1" Width="100%" CssClass="table">
                        <ItemTemplate>
                            <img src="<%# Eval("anhdaidien") %>" width="190" height="150" class="center-block"/>
                            <a href="<%# "hienthivattu.aspx?materialID=" + Eval("mamathang") %>">
                                <p style="text-align: center; margin-top: 8px;"><%# Eval("tenmathang") %></p>
                            </a>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
        </div>
        <div style="height: 70px;"></div>
    </div>
</asp:Content>

