<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headtag" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="con_slider" Runat="Server">
    <ul class="bxslider" style="margin-top: 45px;">
        <li><img src="slider/sli_0.jpg" /></li>
        <li><img src="slider/sli_1.jpg" /></li>
        <li><img src="slider/sli_2.jpg" /></li>
        <li><img src="slider/sli_3.jpg" /></li>
        <li><img src="slider/sli_4.jpg" /></li>
        <li><img src="slider/sli_5.jpg" /></li>
    </ul>  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="con_body" Runat="Server">
    <div class="container" style="margin-bottom: 80px;">
        <h1 id="def_baivietmoi" style="font-family: self_novecent; text-align: center; font-weight: bold; font-size: 35px; margin-top: 85px; margin-bottom: 20px;">bài viết</h1>
        <div class="table-responsive">
            <asp:DataList runat="server" ID="dtl_baivietmoi" CssClass="table" RepeatColumns="3" HorizontalAlign="Center" Width="100%">
                <ItemTemplate>
                    <div style="width: 90%; overflow-y: hidden; margin-left: 5%; margin-right: 5%;">
                        <img class="thumbnail center-block" alt="" src="<%# Eval("anhbaiviet") %>" width="310" height="220" />
                        <small style="font-size: 13px; text-align: center; color: #6d6c6c;"><%# "Đăng vào " + Eval("ngaydang", "{0:dd/M/yyyy}") %></small>         
                        <a href="<%# "hienthibaiviet.aspx?articleID=" + Eval("mabaiviet") %>" target="_blank" data-toggle="tooltip" title="<%# Eval("tieude") %>">
                            <p id="lbl_tieude" style="font-family: self_futara; font-size: 15px; font-weight: bold;"><%# Eval("tieude") %></p>
                        </a>                                           
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <h1 id="def_mautranmoi" style="font-family: self_novecent; text-align: center; font-weight: bold; font-size: 35px; margin-top: 85px; margin-bottom: 20px;">mẫu trần mới nhất</h1>
        <asp:DataList runat="server" ID="dtl_mautran" CssClass="table" RepeatColumns="3" HorizontalAlign="Center" Width="100%">
            <ItemTemplate>
                <div style="width: 90%; overflow-y: hidden; margin-left: 5%; margin-right: 5%;">
                    <img class="thumbnail center-block" alt="" src="<%# Eval("anhdaidien") %>" width="310" height="220" />        
                    <a href="<%# "hienthimautran.aspx?ceilingID=" + Eval("mamathang") %>" target="_blank" data-toggle="tooltip">
                        <p id="lbl_tieude" style="font-family: self_futara; font-size: 15px; font-weight: bold; text-align: center"><%# Eval("tenmathang") %></p>
                    </a>                                           
                </div>
            </ItemTemplate>
        </asp:DataList>
        <hr />
        <h1 id="def_vattumoi" style="font-family: self_novecent; text-align: center; font-weight: bold; font-size: 35px; margin-top: 85px; margin-bottom: 20px;">vật tư mới nhất</h1>
        <asp:DataList runat="server" ID="dtl_vattu" CssClass="table" RepeatColumns="3" Width="100%">
                <ItemTemplate>
                    <div style="width: 90%; overflow-y: hidden; margin-left: 5%; margin-right: 5%;">
                        <img class="thumbnail center-block" alt="" src="<%# Eval("anhdaidien") %>" width="310" height="220" />     
                        <a href="<%# "hienthivattu.aspx?materialID=" + Eval("mamathang") %>" target="_blank" data-toggle="tooltip">
                            <p id="lbl_tieude" style="font-family: self_futara; font-size: 15px; font-weight: bold; text-align: center"><%# Eval("tenmathang") %></p>
                        </a>                                           
                    </div>
                </ItemTemplate>
            </asp:DataList>
        <hr />
        <h1 id="def_duantieubieu" style="font-family: self_novecent; text-align: center; font-weight: bold; font-size: 35px; margin-top: 85px; margin-bottom: 20px;">dự án tiêu biểu</h1>
        <asp:DataList runat="server" ID="Dtl_dsduan" CssClass="table" RepeatColumns="3" Width="100%">
            <ItemTemplate>
                <div style="width: 90%; overflow-y: hidden; margin-left: 5%; margin-right: 5%;">
                    <span style="font-size: 28px; margin-right: 7px;" class="glyphicon glyphicon-home"></span>
                    <a href="<%# "hienthiduan.aspx?projectID=" + Eval("maduan") %>" target="_blank" data-toggle="tooltip">
                        <span id="lbl_tieude" style="font-family: self_futara; font-size: 1.25em; font-weight: bold; text-align: center"><%# Eval("tenduan") %></span>
                    </a>
                    <p style="margin-top: 15px;">Ngày hoàn thành: <%# Eval("ngayhoanthanh", "{0:dd/MM/yyyy}") %></p>
                    <p>Diện tích: <%# Eval("dientich") + "m2" %></p>
                    <p>Địa chỉ: <%# Eval("diachi") %></p>                                 
                </div>
            </ItemTemplate>
        </asp:DataList>
        <hr style="margin-bottom: 80px;" />
    </div>
</asp:Content>

