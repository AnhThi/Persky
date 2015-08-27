<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="danhsachvattu.aspx.cs" Inherits="danhsachvattu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headtag" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="con_slider" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="con_body" Runat="Server">
    <div class="container" style="margin-top: 110px;">
        <div class="table-responsive">
            <p runat="server" id="lbl_loaimautran" style="font-size: 22px; font-weight: bold;"></p>
            <asp:DataList runat="server" ID="dtl_mathang" CssClass="table" RepeatColumns="3">
                <ItemTemplate>
                    <div style="width: 310px; overflow-y: hidden;">
                        <img class="thumbnail" alt="" src="<%# Eval("anhdaidien") %>" width="310" height="220" />     
                        <a href="<%# "hienthivattu.aspx?materialID=" + Eval("mamathang") %>" target="_blank" data-toggle="tooltip">
                            <p id="lbl_tieude" style="font-family: self_futara; font-size: 18px; font-weight: bold; text-align: center"><%# Eval("tenmathang") %></p>
                        </a>                                           
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>

