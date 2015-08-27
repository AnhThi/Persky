<%@ Page Language="C#" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="per_admin_default" %>

<!DOCTYPE html>

<html lang="vi">
    <head>
        <title>Đăng nhập cho Quản Trị viên</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel='icon' type='image/ico' href="../image/admin.png">
        <link rel="stylesheet" href="../css/percss.css"/>
        <link rel="stylesheet" href="../css/per_editbootstrap.css"/>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

        <!-- BOOTSTRAP -->
            <link href="../css/bootstrap.min.css" rel="stylesheet">
            <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
            <script src="../js/bootstrap.min.js"></script>
        <!-- END BOOTSTRAP -->

        <!-- ANGULAR JS -->
            <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
        <!-- END ANGULAR JS -->

        <!------------------------ SCRIPT ------------------------>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('#div_quenmatkhau').hide();
                    $("#check_manhanvien").hide();
                    $('#btn_quenmatkhau').click(function () {
                        $('#div_quenmatkhau').toggle(200);
                    });
                    $('#txt_manhanvien').keyup(function () {
                        var reg = new RegExp('^[0-9]+$');
                        var valid = reg.test($("#txt_manhanvien").val());
                        if (!valid) {
                            $("#btn_dangnhap").attr('disabled', 'disabled');
                            $("#check_manhanvien").show();
                        }
                        else {
                            $("#btn_dangnhap").removeAttr('disabled');
                            $("#check_manhanvien").hide();
                        }
                    });
                    $("#btn_dangnhap").click(function () {
                        $("#txt_manhanvien").attr("required", "required");
                        $("#txt_matkhau").attr("required");
                        $("#txt_nhaplaiemail").removeAttr("required");
                    });
                    $("#btn_guilaiemail").click(function () {
                        $("#txt_manhanvien").removeAttr("required");
                        $("#txt_matkhau").removeAttr("required");
                        $("#txt_nhaplaiemail").attr("required", "required");
                    });
                });
            </script>
        <!-------------------------------------------------------->
    </head>
    <body>
        <form name="form_admin" id="form_admin" runat="server">
            <div class="container" id="admin_wrapper">
                <div class="page-header">
                    <a href="../default.aspx">
                        <img src="../image/logo_brand.png" alt="peradmin" class="img-responsive" style="width: 150px; height: 38px;"/>
                    </a>
                </div>
                <div class="row center-block" style="width: 400px;">
                    <div class="row">
                        <p class="text-center" style="font-family: self_novecent; font-size: 22px;">đăng nhập</p>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon glyphicon glyphicon glyphicon-user" id="ico_username"></span>
                        <input runat="server" name="txt_manhanvien" id="txt_manhanvien" required="required" type="text" class="form-control" placeholder="Mã nhân viên" aria-describedby="ico_username" />
                    </div>
                    <small id="check_manhanvien">Mã nhân viên không hợp lệ</small>              
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon glyphicon glyphicon-lock" id="ico_password"></span>
                        <input runat="server" name="txt_matkhau" id="txt_matkhau" type="password" class="form-control" placeholder="Mật khẩu" aria-describedby="ico_password" required="required" />
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-xs-6">
                            
                        </div>
                        <div class="col-xs-6 text-right">
                            <a href="#" id="btn_quenmatkhau">Quên mật khẩu</a>
                        </div>
                    </div>
                    <br />
                    <asp:Button ID="btn_dangnhap" CssClass="btn btn-default center-block" Text="Đăng nhập" runat="server" BackColor="#0099ff" ForeColor="#ffffff" OnClick="btn_dangnhap_Click" />
                    <hr />
                    <div id="div_quenmatkhau">
                        <p class="text-center" style="font-family: self_novecent; font-size: 22px;">nhập lại email</p>
                        <div class="input-group">
                            <span class="input-group-addon glyphicon glyphicon-envelope" id="ico_lostpassword"></span>
                            <input runat="server" id="txt_nhaplaiemail" type="text" class="form-control" placeholder="Nhập lại email của bạn" aria-describedby="ico_losepassword" required />
                        </div>
                        <br />
                        <asp:Button ID="btn_guilaiemail" CssClass="btn btn-default center-block" Text="Gửi lại mật khẩu" runat="server" OnClick="btn_guilaiemail_Click" />
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
