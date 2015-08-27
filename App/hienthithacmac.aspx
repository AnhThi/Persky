<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="hienthithacmac.aspx.cs" Inherits="hienthithacmac" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headtag" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="con_slider" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="con_body" Runat="Server">
    <div class="container" style="margin-top: 110px;">
        <h2 style="text-align: center;">Thắc mắc thường gặp</h2>
        <asp:DataList ID="dtl_thacmac" runat="server" RepeatColumns="1" CssClass="table">
            <ItemTemplate>
                <h4><%# Eval("cauhoi") %></h4>
                <blockquote>
                    <small style="font-size: 15px;"><%# Eval("cautraloi") %></small>
                </blockquote>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

