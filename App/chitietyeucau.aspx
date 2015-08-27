<%@ Page Language="C#" AutoEventWireup="true" CodeFile="chitietyeucau.aspx.cs" Inherits="chitietyeucau" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Chi tiết yêu cầu - perAdmin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel='icon' type='image/ico' href="../image/admin.png">
        <link rel="stylesheet" href="../css/percss.css"/>
        <link rel="stylesheet" href="../css/per_editbootstrap.css"/>

        <!-- BOOTSTRAP -->
            <link href="../css/bootstrap.min.css" rel="stylesheet">
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
            <script src="../js/bootstrap.min.js"></script>
        <!-- END BOOTSTRAP -->
    </head>
    <body>
        <form id="form_main" runat="server">
            <div class="container-fluid" id="panel-wrapper">
                <div class="page-header">
                    <a href="../default.aspx">
                        <img src="../image/logo_brand.png" alt="peradmin" class="img-responsive" style="width: 150px; height: 38px;"/>
                    </a>
                </div>
                <div class="container">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="background-color: #222222;">
                            <p style="font-size: 20px; font-weight: bold; color: #279cf3;">Chi tiết yêu cầu của khách hàng</p>
                        </div>
                        <div class="panel-body">
                            <asp:DataList ID="dtl_chitietyeucau" runat="server" Width="100%">
                                <ItemTemplate>
                                    <table class="table" style="width: 100%;">
                                        <tr>
                                            <td style="width: 190px;">Mã yêu cầu</td>
                                            <td><%# Eval("mayeucau") %></td>
                                        </tr>
                                        <tr>
                                            <td>Tên khách hàng</td>
                                            <td><%# Eval("hoten") %></td>
                                        </tr>
                                        <tr>
                                            <td>Email</td>
                                            <td><%# Eval("email") %></td>
                                        </tr>
                                        <tr>
                                            <td>Số điện thoại</td>
                                            <td><%# Eval("sodienthoai") %></td>
                                        </tr>
                                        <tr>
                                            <td>Địa chỉ thi công</td>
                                            <td><%# Eval("diachithicong") %></td>
                                        </tr>
                                        <tr>
                                            <td>Ngày gửi yêu cầu</td>
                                            <td><%# Eval("ngaygui") %></td>
                                        </tr>
                                        <tr>
                                            <td>Trạng thái</td>
                                            <td><%# Eval("trangthai") %></td>
                                        </tr>
                                        <tr>
                                            <td>Nội dung</td>
                                            <td><%# Eval("noidung") %></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>                           
                        </div>                      
                    </div><!-- end panel -->
                    <br />
                    <a href="per-admin/dashboard.aspx">
                        <input type="button" class="btn btn-default center-block" value="Trở lại"/>
                    </a>
                </div><!-- end container -->
            </div><!-- end container-fluid -->
        </form>
    </body>
</html>
