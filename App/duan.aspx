<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="duan.aspx.cs" Inherits="duan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headtag" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="con_slider" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="con_body" Runat="Server">
    <div class="container" style="margin-top: 100px">
        <asp:DataList ID="dtl_duan" runat="server" RepeatColumns="4" CssClass="table" Width="100%">
            <ItemTemplate>
                <div style="width: 90%; overflow-y: hidden; margin-left: 5%; margin-right: 5%;">
                        <span style="font-size: 28px;" class="glyphicon glyphicon-home"></span>
                        <a href="<%# "hienthiduan.aspx?projectID=" + Eval("maduan") %>" target="_blank" data-toggle="tooltip">
                            <span id="lbl_tieude" style="font-family: self_futara; font-size: 18px; font-weight: bold; text-align: center"><%# Eval("tenduan") %></span>
                        </a>
                        <p>Ngày hoàn thành: <%# Eval("ngayhoanthanh", "{0:dd/MM/yyyy}") %></p>
                        <p>Diện tích: <%# Eval("dientich") + "m2" %></p>
                        <p>Địa chỉ: <%# Eval("diachi") %></p>                                 
                    </div>
            </ItemTemplate>
        </asp:DataList>>
    </div>
</asp:Content>

