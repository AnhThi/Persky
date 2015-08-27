<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="tintuc.aspx.cs" Inherits="tintuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headtag" Runat="Server">
    <style>
        #div_tungbaiviet div a{
            text-decoration: none;
            color: #212020;
        }
        #div_tungbaiviet div a:hover{
            text-decoration: none;
            color: #0094ff;
        }
        #div_tungbaiviet:hover{
            background-color: #f5f1f1;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="con_slider" Runat="Server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="con_body" Runat="Server" >
    <div class="container" style="margin-top: 80px;">
        <asp:DataList ID="dtl_dsbaiviet" runat="server" RepeatColumns="2" Width="1000px">
            <ItemTemplate>
                <div id="div_tungbaiviet" style="width: 450px; height: 130px; margin-bottom: 20px; overflow: hidden; border-top: 2px solid #484646; border-bottom: 1px dashed #484646; border-radius: 5px; transition: 0.3s ease 0s;">
                    <img src="<%# Eval("anhbaiviet") %>" style="width: 160px; height: 130px; float: left; margin-right: 15px;" />
                    <div style="padding-top: 1px;">
                        <a href="<%# "hienthibaiviet.aspx?articleID=" + Eval("mabaiviet") %>">
                            <h4><%# Eval("tieude") %></h4>
                        </a>
                        <small style="color: #565454;"><%# Eval("ngaydang") %></small>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

