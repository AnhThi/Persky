<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="per_admin_default" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<%@ Register TagPrefix="fjx" Namespace="com.flajaxian" Assembly="com.flajaxian.FileUploader" %>

<!DOCTYPE html>

<html lang="vi">
    <head runat="server">
        <title>Trang quản trị - perAdmin</title>
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

        <style>
            #ful_uploadanh{
                margin-left: 15px;
            }
            #dtl_baiviet tr td span{
                overflow: hidden;
            }
            #dtl_uploadanh tr td img, #dtl_baiviet tr td img{
                cursor: pointer;
                transition: 0.3s ease 0s;        
            }
            #dtl_uploadanh tr td img:hover, #dtl_baiviet tr td img:hover{
                transform: scale(1.1);
                transition-duration: 0.3s;
            }
            #btn_matkhau, #btn_dangxuat{
                margin-top: -15px; 
                margin-right: 25px; 
                margin-left: 7px;
            }
        </style>

    </head>
    <body>
        <form id="form_panel" runat="server">

            <asp:ScriptManager ID="scr_manager" runat="server">
            </asp:ScriptManager>

            <div class="container-fluid" id="panel-wrapper">
                <div class="page-header">
                    <a href="../default.aspx">
                        <img src="../image/logo_brand.png" alt="peradmin" class="img-responsive" style="width: 150px; height: 38px;"/>
                    </a>
                    <asp:Button ID="btn_dangxuat" Text="Đăng xuất" runat="server" CssClass="btn btn-primary pull-right"  OnClick="btn_dangxuat_Click" />
                    <button type="button" id="btn_matkhau" class="btn btn-default pull-right" data-toggle="modal" data-target="#div_doimatkhau" >Đổi mật khẩu</button>
                </div>

                <ul class="nav nav-tabs" id="myTab">
                    <li class="active"><a href="#dathang" data-toggle="tab">Yêu cầu</a></li>
                    <li><a href="#baiviet" data-toggle="tab">Bài viết</a></li>
                    <li><a href="#mautran" data-toggle="tab">Mẫu trần</a></li>
                    <li><a href="#vattu" data-toggle="tab">Vật tư</a></li>
                    <li><a href="#khachhang" data-toggle="tab">Khách hàng</a></li>
                    <li><a href="#duanz" data-toggle="tab">Dự án</a></li>
                    <li><a href="#thacmac" data-toggle="tab">Thắc mắc</a></li>
                    <li><a href="#slider" data-toggle="tab">Slider</a></li>
                </ul>
 
                <div class="tab-content">
<!------------------------------------------ YÊU CẦU ---------------------------------------------------------------------->
                    <div class="tab-pane active" id="dathang">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <br />
                                <div class="panel panel-default">
                                    <div class="panel-heading" style="background-color: #222222;">
                                        <p style="font-size: 20px; font-weight: bold; color: #279cf3;">Yêu cầu đặt của khách hàng</p>
                                    </div>
                                    <div class="panel-body">

                                        <ul class="nav nav-tabs">
                                            <li class="active"><a data-toggle="tab" href="#chuaduyet">Chưa duyệt</a></li>
                                            <li><a data-toggle="tab" href="#choxuli">Chờ xử lí</a></li>
                                            <li><a data-toggle="tab" href="#daduyet">Đã duyệt</a></li>
                                        </ul>

                                        <div class="tab-content">
                                            <div id="chuaduyet" class="tab-pane active fade in">
                                                <br />
                                                <asp:GridView ID="grv_chuaduyet" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="mayeucau" OnSelectedIndexChanging="grv_chuaduyet_SelectedIndexChanging" OnRowDeleting="grv_chuaduyet_RowDeleting" OnRowEditing="grv_chuaduyet_RowEditing">
                                                    <Columns>
                                                        <asp:BoundField DataField="mayeucau" HeaderText="Mã yêu cầu" >
                                                        <ItemStyle Width="12%" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="hoten" HeaderText="Họ tên khách" >
                                                        <ItemStyle Width="20%" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="ngaygui" HeaderText="Ngày gửi" >
                                                        <ItemStyle Width="15%" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="sodienthoai" HeaderText="Số điện thoại" >
                                                        <ItemStyle Width="12%" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="diachithicong" HeaderText="Địa chỉ thi công" >
                                                        </asp:BoundField>
                                                        <asp:CommandField ButtonType="Button" DeleteText="Duyệt" ShowDeleteButton="True">
                                                        <ControlStyle CssClass="btn btn-primary btn-sm" />
                                                        </asp:CommandField>
                                                        <asp:CommandField ButtonType="Button" EditText="Lưu trữ" ShowEditButton="True" UpdateText="Lưu trữ">
                                                        <ControlStyle CssClass="btn btn-primary btn-sm" />
                                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                        </asp:CommandField>
                                                        <asp:CommandField AccessibleHeaderText="Chi tiết" ButtonType="Button" SelectText="Xem chi tiết" ShowSelectButton="True">
                                                            <ControlStyle CssClass="btn btn-primary btn-sm" />
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                                        </asp:CommandField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                            <div id="choxuli" class="tab-pane fade">
                                                <br />
                                                <asp:GridView ID="grv_choxuli" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="mayeucau" OnSelectedIndexChanging="grv_choxuli_SelectedIndexChanging" OnRowDeleting="grv_choxuli_RowDeleting" >
                                                    <Columns>
                                                        <asp:BoundField DataField="mayeucau" HeaderText="Mã yêu cầu" >
                                                        <ItemStyle Width="12%" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="hoten" HeaderText="Họ tên khách" >
                                                        <ItemStyle Width="20%" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="ngaygui" HeaderText="Ngày gửi" >
                                                        <ItemStyle Width="15%" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="sodienthoai" HeaderText="Số điện thoại" >
                                                        <ItemStyle Width="12%" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="diachithicong" HeaderText="Địa chỉ thi công" >
                                                        </asp:BoundField>
                                                        <asp:CommandField AccessibleHeaderText="Chuyển trạng thái" ButtonType="Button" DeleteText="Duyệt" ShowDeleteButton="True">
                                                            <ControlStyle CssClass="btn btn-primary btn-sm" />
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="7%" />
                                                        </asp:CommandField>
                                                        <asp:CommandField AccessibleHeaderText="Chi tiết" ButtonType="Button" SelectText="Xem chi tiết" ShowSelectButton="True">
                                                            <ControlStyle CssClass="btn btn-primary btn-sm" />
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                                        </asp:CommandField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                            <div id="daduyet" class="tab-pane fade active">
                                                <br />
                                                <asp:GridView ID="grv_daduyet" CssClass="table" runat="server" AutoGenerateColumns="False" DataKeyNames="mayeucau" OnSelectedIndexChanging="grv_daduyet_SelectedIndexChanging" OnRowDeleting="grv_daduyet_RowDeleting">
                                                    <Columns>
                                                        <asp:BoundField DataField="mayeucau" HeaderText="Mã yêu cầu" >
                                                        <ItemStyle Width="12%" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="hoten" HeaderText="Họ tên khách" >
                                                        <ItemStyle Width="20%" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="ngaygui" HeaderText="Ngày gửi" >
                                                        <ItemStyle Width="15%" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="sodienthoai" HeaderText="Số điện thoại" >
                                                        <ItemStyle Width="12%" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="diachithicong" HeaderText="Địa chỉ thi công" >
                                                        </asp:BoundField>
                                                        <asp:CommandField ButtonType="Button" DeleteText="Xóa" ShowDeleteButton="True" >
                                                            <ControlStyle CssClass="btn btn-danger btn-sm" />
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="7%" />
                                                        </asp:CommandField>
                                                        <asp:CommandField AccessibleHeaderText="Chi tiết" ButtonType="Button" SelectText="Xem chi tiết" ShowSelectButton="True">
                                                            <ControlStyle CssClass="btn btn-primary btn-sm" />
                                                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                                        </asp:CommandField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div><!-- end panel-body -->
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="grv_chuaduyet" EventName="RowDeleting" />
                                <asp:AsyncPostBackTrigger ControlID="grv_chuaduyet" EventName="RowEditing" />
                                <asp:AsyncPostBackTrigger ControlID="grv_choxuli" EventName="RowDeleting" />
                                <asp:AsyncPostBackTrigger ControlID="grv_daduyet" EventName="RowDeleting" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div><!-- end tab yeu cau -->
             
<!------------------------------------------ BÀI VIẾT ---------------------------------------------------------------------->

                    <div class="tab-pane" id="baiviet">
                        <br />
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #222222;">
                                <p style="font-size: 20px; font-weight: bold; color: #279cf3;">Thêm bài viết</p>
                            </div>
                            <div class="panel-body">
                                <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                                    <br />
                                    <div class="input-group">
                                        <span class="input-group-addon glyphicon glyphicon glyphicon-pencil" id="ico_tieude"></span>
                                        <input runat="server" maxlength="65" name="txt_tieude" id="txt_tieude" type="text" class="form-control" placeholder="Tiêu đề bài viết" aria-describedby="ico_tieude" />
                                        <input type="hidden" runat="server" id="txt_mabv"/>
                                    </div>
                                    <br />
                                    <CKEditor:CKEditorControl ID="cke_baiviet" runat="server" Height="500px"></CKEditor:CKEditorControl>
                                    <br />
                                    <asp:Button ID="btn_dangbaiviet" CssClass="btn btn-default center-block" Text="Đăng bài" runat="server" OnClick="btn_dangbaiviet_Click" />
                                </div>
                                <br />
                                <span style="font-size: 18px;">Upload ảnh cho bài viết</span>
                                <br />
                                <fjx:FileUploader ID="ful_uploadanh" runat="server" AllowedFileTypes="Web Images (Jpeg, Gig, Png):*.jpg;*.jpeg;*.png;*.gif" RequestAsPostBack="true" OnFileReceived="ful_uploadanh_FileReceived">
                                    <Adapters>
                                        <fjx:FileSaverAdapter runat="server" FolderName="~/article" OnFileNameDetermining="ful_uploadanh_FileNameDetermining" />
                                    </Adapters>
                                </fjx:FileUploader>                          
                                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">     
                                                             
                                    <asp:UpdatePanel ID="udp_hienanhbaiviet" runat="server">
                                        <ContentTemplate>
                                            <br />
                                            <div class="panel panel-default" style="max-height: 647px">
                                                <div class="panel-heading text-center">
                                                    <asp:HiddenField ID="selected_tab" runat="server" />
                                                    <asp:Button CssClass="btn btn-default" ID="btn_refresh" Text="Hiện ảnh" runat="server" OnClick="btn_refresh_Click" />
                                                </div>
                                                <div class="panel-body">
                                                    <div>
                                                        <asp:DataList ID="dtl_uploadanh" runat="server" RepeatColumns="4" CssClass="table">
                                                            <ItemTemplate>
                                                                <asp:Image ID="img_anhbaiviet" CssClass="thumbnail" runat="server" Height="75px" Width="75px" ImageUrl='<%# Eval("link") %>' />
                                                                <span class="badge" style="margin-left: 29px;"><%# Eval("num") %></span>
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                    </div>  
                                                </div>
                                                <div class="panel-footer">
                                                    <span style="font-weight: bold;">Ảnh đại diện: </span>
                                                    <asp:DropDownList ID="ddl_anhbaiviet" runat="server" CssClass="dropdown">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btn_refresh" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>

                                </div>  
                            </div>                        
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #222222;">
                                <p style="font-size: 20px; font-weight: bold; color: #279cf3;">Quản lí bài viết</p>
                            </div>
                            <div class="panel-body">
                                <asp:DataList ID="dtl_baiviet" runat="server" RepeatColumns="7" CssClass="table" DataKeyField="mabaiviet" OnDeleteCommand="dtl_baiviet_DeleteCommand" OnEditCommand="dtl_baiviet_EditCommand">
                                    <ItemTemplate>
                                        <div style="width: 150px; overflow-x: hidden; overflow-y: hidden;">                   
                                            <a href="<%# "../hienthibaiviet.aspx?articleID=" + Eval("mabaiviet") %>" target="_blank" data-toggle="tooltip" title="<%# Eval("tieude") %>">
                                                <img class="thumbnail" alt="" src="<%# Eval("anhbaiviet") %>" width="150" height="110" />
                                            </a>                                      
                                            <small style="font-size: 10px; text-align: center;"><%# Eval("ngaydang") %></small>
                                            <p id="lbl_tieude" style="width: 600px; font-family: self_novecent;"><%# Eval("tieude") %></p>
                                            <asp:Button OnClientClick="return confirm('Bạn muốn xóa bài viết này ?')" CssClass="btn btn-danger btn-sm" ID="btn_xoabaiviet" CommandName="Delete" CommandArgument='<%# Eval("mabaiviet") + "#" + Eval("tieude") %>' Text="Xóa" runat="server" />
                                            <asp:Button CssClass="btn btn-default btn-sm pull-right" Text="Chỉnh sửa" CommandName="Edit" CommandArgument='<%# Eval("mabaiviet") %>' runat="server" />                                                          
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>
                    </div><!-- end tab bai viet -->
<!------------------------------------------ MẪU TRẦN ---------------------------------------------------------------------->
                    <div class="tab-pane" id="mautran">
                        <br />
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #222222;">
                                <p style="font-size: 20px; font-weight: bold; color: #279cf3;">Thêm mẫu trần</p>
                            </div>
                            <div class="panel-body">
                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                    <table class="table">
                                        <tr>
                                            <td style="width: 150px; font-weight: bold;"><p>Mã mẫu trần(*)</p></td>
                                            <td>
                                                <input disabled="disabled" id="txt_mamautran" type="text" runat="server" class="form-control" style="width: 400px;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><p style="font-weight: bold;">Tên mẫu trần(*)</p></td>
                                            <td>
                                                <input id="txt_tenmautran" type="text" runat="server" class="form-control" style="width: 400px;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><p style="font-weight: bold;">Trần dành cho</p></td>
                                            <td>
                                                <asp:DropDownList CssClass="form-control" Width="290px" ID="ddl_danhmucmautran" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><p style="font-weight: bold;">Thư mục ảnh(*)</p></td>
                                            <td>
                                                <span class="glyphicon glyphicon-folder-open" style="margin-right: 10px;"></span><span runat="server" id="lbl_thumucanhmautran">Thư mục chứa</span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><p style="font-weight: bold;">Ghi chú(nếu cần)</p></td>
                                            <td>
                                                <asp:TextBox ID="txt_ghichumautran" CssClass="form-control" TextMode="MultiLine" Height="80px" Width="400px" runat="server" />
                                            </td>
                                        </tr>
                                    </table>
                                    <span class="badge" style="font-size: 20px;">Upload ảnh cho mẫu trần</span>
                                    <br />
                                    <br />
                                    <fjx:FileUploader ID="ful_anhmautran" runat="server" AllowedFileTypes="Web Images (Jpeg, Gig, Png):*.jpg;*.jpeg;*.png;*.gif" RequestAsPostBack="true">
                                        <Adapters>
                                            <fjx:FileSaverAdapter runat="server" FolderName="~/article" OnFileNameDetermining="ful_anhmautran_FileNameDetermining" />
                                        </Adapters>
                                    </fjx:FileUploader>
                                    <br />
                                    <br />
                                    <asp:Button ID="btn_themmautran" CssClass="btn btn-primary center-block" Text="Thêm mẫu trần" runat="server" OnClick="btn_themmautran_Click" />
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                    <asp:UpdatePanel runat="server">
                                        <ContentTemplate>
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <asp:Button ID="btn_hienthianhmautran" CssClass="btn btn-default center-block" Text="Hiện ảnh" runat="server" OnClick="btn_hienthianhmautran_Click" />
                                                </div><!-- end panel-heading -->
                                                <div class="panel-body">
                                                    <asp:DataList ID="dtl_anhmautran" runat="server" RepeatColumns="5" CssClass="table" >
                                                        <ItemTemplate>
                                                            <asp:Image ID="img_anhbaiviet" CssClass="thumbnail" runat="server" Height="75px" Width="75px" ImageUrl='<%# Eval("link") %>' />
                                                            <span class="badge" style="margin-left: 29px;"><%# Eval("num") %></span>
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </div><!-- end panel_body -->
                                                <div class="panel-footer">
                                                    <span style="font-weight: bold;">Ảnh đại diện: </span>
                                                    <asp:DropDownList ID="ddl_anhdaidienmautran" runat="server" CssClass="dropdown">
                                                    </asp:DropDownList>
                                                </div><!-- end panel-footer -->
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btn_hienthianhmautran" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #222222;">
                                <p style="font-size: 20px; font-weight: bold; color: #279cf3;">Quản lí mẫu trần</p>
                            </div>
                            <div class="panel-body">
                                <asp:DataList ID="dtl_dsmautran" runat="server" RepeatColumns="7" CssClass="table" DataKeyField="mamathang" OnDeleteCommand="dtl_dsmautran_DeleteCommand">
                                    <ItemTemplate>
                                        <div style="width: 150px; overflow-x: hidden; overflow-y: hidden;">                   
                                            <a href="<%# "../hienthimautran.aspx?ceilingID=" + Eval("mamathang") %>" target="_blank" data-toggle="tooltip" title="<%# Eval("tenmathang") %>">
                                                <img class="thumbnail" alt="" src="<%# Eval("anhdaidien") %>" width="150" height="110" />
                                            </a>                                      
                                            <small style="font-size: 10px; text-align: center;"><%# Eval("ngaydang") %></small>
                                            <p id="lbl_tenmathang" style="font-size: 13px; font-weight: bold;"><%# Eval("tenmathang") %></p>
                                            <p id="lbl_danhmuc" style="width: 600px; font-family: self_novecent; font-size: 13px;"><%# Eval("tendanhmuc") %></p>
                                            <asp:Button OnClientClick="return confirm('Bạn muốn xóa mẫu trần này ?')" CssClass="btn btn-danger btn-sm" ID="btn_xoamautran" CommandName="Delete" CommandArgument='<%# Eval("mamathang") %>' Text="Xóa" runat="server" />
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>
                    </div><!-- end tab mau tran -->
<!------------------------------------------ VẬT TƯ ---------------------------------------------------------------------->
                    <div class="tab-pane" id="vattu">
                        <br />
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #222222;">
                                <p style="font-size: 20px; font-weight: bold; color: #279cf3;">Thêm vật tư</p>

                            </div>
                            <div class="panel-body">
                                <table class="table">
                                    <tr>
                                        <td style="width: 150px; font-weight: bold;"><p>Mã vật tư(*)</p></td>
                                        <td>
                                            <input disabled="disabled" id="txt_mavattu" type="text" runat="server" class="form-control" style="width: 400px;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><p style="font-weight: bold;">Tên vật tư(*)</p></td>
                                        <td>
                                            <input id="txt_tenvattu" type="text" runat="server" class="form-control" style="width: 400px;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><p style="font-weight: bold;">Danh mục vật tư</p></td>
                                        <td>
                                            <asp:DropDownList CssClass="form-control" Width="290px" ID="ddl_danhmucvattu" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><p style="font-weight: bold;">Đơn vị tính</p></td>
                                        <td>
                                            <asp:DropDownList CssClass="form-control" Width="190px" ID="ddl_donvitinhvattu" runat="server">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><p style="font-weight: bold;">Thư mục ảnh(*)</p></td>
                                        <td>
                                            <span class="glyphicon glyphicon-folder-open" style="margin-right: 10px;"></span><span runat="server" id="lbl_thumucchua">Thư mục chứa</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><p style="font-weight: bold;">Ghi chú(nếu cần)</p></td>
                                        <td>
                                            <asp:TextBox ID="txt_ghichuvattu" CssClass="form-control" TextMode="MultiLine" Height="80px" Width="400px" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                                <div class="row">
                                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                                        <CKEditor:CKEditorControl ID="cke_motavattu" runat="server" Height="500px"></CKEditor:CKEditorControl>
                                        <br />
                                        <asp:Button ID="btn_themvattu" CssClass="btn btn-primary center-block" Text="Thêm vật tư" runat="server" OnClick="btn_themvattu_Click" />
                                    </div>
                                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                        <span style="font-size: 18px;">Upload ảnh cho vật tư</span>
                                        <fjx:FileUploader ID="ful_uploadanhvattu" runat="server" AllowedFileTypes="Web Images (Jpeg, Gig, Png):*.jpg;*.jpeg;*.png;*.gif" RequestAsPostBack="true">
                                            <Adapters>
                                                <fjx:FileSaverAdapter runat="server" FolderName="~/article" OnFileNameDetermining="ful_uploadanhvattu_FileNameDetermining" />
                                            </Adapters>
                                        </fjx:FileUploader> 
                                        <div class="panel panel-default">
                                            <asp:UpdatePanel runat="server">
                                                <ContentTemplate>
                                                     <div class="panel-heading">
                                                        <asp:Button ID="btn_hienanhvattu" CssClass="btn btn-default center-block" Text="Hiện ảnh" runat="server" OnClick="btn_hienanhvattu_Click" />
                                                    </div><!-- end panel-heading -->
                                                    <div class="panel-body">
                                                        <asp:DataList ID="dtl_anhvattu" runat="server" RepeatColumns="4" CssClass="table" >
                                                            <ItemTemplate>
                                                                <asp:Image ID="img_anhbaiviet" CssClass="thumbnail" runat="server" Height="75px" Width="75px" ImageUrl='<%# Eval("link") %>' />
                                                                <span class="badge" style="margin-left: 29px;"><%# Eval("num") %></span>
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                    </div><!-- end panel_body -->
                                                    <div class="panel-footer">
                                                        <span style="font-weight: bold;">Ảnh đại diện: </span>
                                                        <asp:DropDownList ID="ddl_anhdaidienvattu" runat="server" CssClass="dropdown">
                                                        </asp:DropDownList>
                                                    </div><!-- end panel-footer -->
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="btn_hienanhvattu" EventName="Click" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- end panel-body -->
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #222222;">
                                <p style="font-size: 20px; font-weight: bold; color: #279cf3;">Quản lí vật tư</p>
                            </div>
                            <div class="panel-body">
                                <asp:DataList ID="dtl_dsvattu" runat="server" RepeatColumns="7" CssClass="table" DataKeyField="mamathang" OnDeleteCommand="dtl_dsvattu_DeleteCommand">
                                    <ItemTemplate>
                                        <div style="width: 150px; overflow-x: hidden; overflow-y: hidden;">                   
                                            <a href="<%# "../hienthimautran.aspx?ceilingID=" + Eval("mamathang") %>" target="_blank" data-toggle="tooltip" title="<%# Eval("tenmathang") %>">
                                                <img class="thumbnail" alt="" src="<%# Eval("anhdaidien") %>" width="150" height="110" />
                                            </a>                                      
                                            <small style="font-size: 10px; text-align: center;"><%# Eval("ngaydang") %></small>
                                            <p id="lbl_tenmathang" style="font-size: 13px; font-weight: bold;"><%# Eval("tenmathang") %></p>
                                            <p id="lbl_danhmuc" style="width: 600px; font-family: self_novecent; font-size: 13px;"><%# Eval("tendanhmuc") %></p>
                                            <asp:Button OnClientClick="return confirm('Bạn muốn xóa vật tư này ?')" CssClass="btn btn-danger btn-sm" ID="btn_xoamautran" CommandName="Delete" CommandArgument='<%# Eval("mamathang") %>' Text="Xóa" runat="server" />
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>
                    </div><!-- end tab vat tu -->
<!------------------------------------------ KHÁCH HÀNG ---------------------------------------------------------------------->
                    <div class="tab-pane" id="khachhang">
                        <br />
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #222222;">
                                <p style="font-size: 20px; font-weight: bold; color: #279cf3;">Thêm khách hàng</p>
                            </div>
                            <div class="panel-body">
                                <div class="col-xs-6">
                                    <table class="table">
                                        <tr>
                                            <td style="width: 150px; font-weight: bold;"><p>Mã khách hàng(*)</p></td>
                                            <td>
                                                <input disabled="disabled" id="txt_makhachhang" type="text" runat="server" class="form-control" style="width: 400px;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><p style="font-weight: bold;">Tên khách hàng (*)</p></td>
                                            <td>
                                                <input id="txt_tenkhachhang" type="text" runat="server" class="form-control" style="width: 400px;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><p style="font-weight: bold;">Số điện thoại (*)</p></td>
                                            <td>
                                                <input id="txt_sdtkhachhang" type="text" runat="server" class="form-control" style="width: 400px;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><p style="font-weight: bold;">Email</p></td>
                                            <td>
                                                <input id="txt_emailkhachhang" type="text" runat="server" class="form-control" style="width: 400px;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><p style="font-weight: bold;">Địa chỉ (*)</p></td>
                                            <td>
                                                <input id="txt_diachikhachhang" type="text" runat="server" class="form-control" style="width: 400px;" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Button ID="btn_themkhachhang" CssClass="btn btn-primary center-block" Text="Thêm khách hàng" runat="server" OnClick="btn_themkhachhang_Click" />
                                </div>                        
                            </div><!-- end panel-body -->
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #222222;">
                                <p style="font-size: 20px; font-weight: bold; color: #279cf3;">Quản lí khách hàng</p>
                            </div>
                            <div class="panel-body">
                                <asp:GridView ID="grv_dskhachhang" CssClass="table table-hover" runat="server">
                                </asp:GridView>
                            </div>
                        </div>
                    </div><!-- end tab vat tu -->
<!------------------------------------------ DỰ ÁN ---------------------------------------------------------------------->
                    <div class="tab-pane" id="duanz">
                        <br />
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #222222;">
                                <p style="font-size: 20px; font-weight: bold; color: #279cf3;">Cập nhật bộ ảnh dự án</p>
                            </div>
                            <div class="panel-body">
                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                    <table class="table">
                                        <tr>
                                            <td><p style="font-weight: bold;">Mã dự án (*)</p></td>
                                            <td>
                                                <input disabled="disabled" id="txt_maduan" type="text" runat="server" class="form-control" style="width: 400px;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><p style="font-weight: bold;">Tên dự án (*)</p></td>
                                            <td>
                                                <input id="txt_tenduan" type="text" runat="server" class="form-control" style="width: 400px;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 180px;"><p style="font-weight: bold;">Tên khách hàng (*)</p></td>
                                            <td>
                                                <asp:DropDownList ID="ddl_dskhachhang" CssClass="form-control" Width="200px" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 180px;"><p style="font-weight: bold;">Ngày khởi công (*)</p></td>
                                            <td>
                                                <input id="txt_ngaykhoicongduan" type="date" runat="server" class="form-control" style="width: 400px;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 180px;"><p style="font-weight: bold;">Ngày hoàn thành (*)</p></td>
                                            <td>
                                                <input id="txt_ngayhoanthanhduan" type="date" runat="server" class="form-control" style="width: 400px;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 180px;"><p style="font-weight: bold;">Diện tích (*) / m<sup>2</sup></p></td>
                                            <td>
                                                <input id="txt_dientichduan" type="text" runat="server" class="form-control" style="width: 400px;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 180px;"><p style="font-weight: bold;">Địa chỉ công trình (*)</p></td>
                                            <td>
                                                <input id="txt_diachicongtrinh" type="text" runat="server" class="form-control" style="width: 400px;" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Button ID="btn_themduan" Text="Thêm dự án" CssClass="btn btn-primary center-block" runat="server" OnClick="btn_themduan_Click" />
                                </div>
                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                                    <span style="margin-right: 12px;" class="glyphicon glyphicon-folder-open"></span>
                                    <span>Thư mục ảnh: </span>
                                    <span id="lbl_thumucanhduan" runat="server">Thư mục ảnh</span>
                                    <br />
                                    <fjx:FileUploader ID="ful_boanhduan" runat="server" AllowedFileTypes="Web Images (Jpeg, Gig, Png):*.jpg;*.jpeg;*.png;*.gif" RequestAsPostBack="true">
                                        <Adapters>
                                            <fjx:FileSaverAdapter runat="server" FolderName="~/article" OnFileNameDetermining="ful_boanhduan_FileNameDetermining" />
                                        </Adapters>
                                    </fjx:FileUploader>
                                    <div class="panel panel-default">
                                        <asp:UpdatePanel runat="server">
                                            <ContentTemplate>
                                                    <div class="panel-heading">
                                                    <asp:Button ID="btn_hienanhduan" CssClass="btn btn-default center-block" Text="Hiện ảnh" runat="server" OnClick="btn_hienanhduan_Click" />
                                                </div><!-- end panel-heading -->
                                                <div class="panel-body">
                                                    <asp:DataList ID="dtl_hienanhduan" runat="server" RepeatColumns="4" CssClass="table" >
                                                        <ItemTemplate>
                                                            <asp:Image ID="img_anhbaiviet" CssClass="thumbnail" runat="server" Height="75px" Width="75px" ImageUrl='<%# Eval("link") %>' />
                                                            <span class="badge" style="margin-left: 29px;"><%# Eval("num") %></span>
                                                        </ItemTemplate>
                                                    </asp:DataList>
                                                </div><!-- end panel_body -->
                                                <div class="panel-footer">
                                                    <span style="font-weight: bold;">Ảnh đại diện: </span>
                                                    <asp:DropDownList ID="ddl_hienanhdaidienduan" runat="server" CssClass="dropdown">
                                                    </asp:DropDownList>
                                                </div><!-- end panel-footer -->
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="btn_hienanhduan" EventName="Click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #222222;">
                                <p style="font-size: 20px; font-weight: bold; color: #279cf3;">Quản lí dự án</p>
                            </div>
                            <div class="panel-body">
                                <asp:DataList ID="dtl_dsduan" runat="server" RepeatColumns="7" CssClass="table" DataKeyField="maduan" OnDeleteCommand="dtl_dsduan_DeleteCommand">
                                    <ItemTemplate>
                                        <div style="width: 150px; overflow-x: hidden; overflow-y: hidden;">                   
                                            <a href="<%# "../hienthiduan.aspx?projectID=" + Eval("maduan") %>" target="_blank" data-toggle="tooltip" title="<%# Eval("tenduan") %>">
                                                <span style="font-size: 28px; margin-right: 7px;" class="glyphicon glyphicon-home"></span>
                                            </a>                                      
                                            <p style="font-size: 13px; font-weight: bold;"><%# Eval("tenduan") %></p>
                                            <p id="lbl_tenmathang" style="font-size: 10px;"><%# Eval("ngayhoanthanh") %></p>
                                            <p id="lbl_danhmuc" style="width: 600px; font-size: 10px;"><%# Eval("dientich") %> m<sup>2</sup></p>
                                            <asp:Button OnClientClick="return confirm('Bạn muốn xóa dự án này ?')" CssClass="btn btn-danger btn-sm" ID="btn_xoaduan" CommandName="Delete" CommandArgument='<%# Eval("maduan") %>' Text="Xóa" runat="server" />
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                            </div>
                        </div>
                    </div><!-- end tab quan li file -->
<!------------------------------------------ THẮC MẮC ----------------------------------------------------------------------> 
                    <div class="tab-pane" id="thacmac">
                        <br />
                        <div class="panel panel-default">
                            <div class="panel-heading" style="background-color: #222222;">
                                <p style="font-size: 20px; font-weight: bold; color: #279cf3;">Thêm câu hỏi</p>
                            </div>
                            <div class="panel-body">
                                <table class="table">
                                    <tr>
                                        <td style="width: 150px; font-weight: bold;"><p>Câu hỏi(*)</p></td>
                                        <td>
                                            <input id="txt_cauhoi" type="text" runat="server" class="form-control" style="width: 800px;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 150px; font-weight: bold;"><p>Nội dung trả lời(*)</p></td>
                                        <td>
                                            <asp:TextBox ID="txt_cautraloi" CssClass="form-control" TextMode="MultiLine" Width="800px" Height="150px" runat="server" />
                                        </td>
                                    </tr>
                                </table>
                                <asp:Button ID="btn_dangnoidungthacmac" CssClass="btn btn-primary center-block" Text="Đăng nội dung" runat="server" OnClick="btn_dangnoidungthacmac_Click" />
                            </div>
                            <asp:GridView ID="grv_thacmac" runat="server" AutoGenerateColumns="False" CssClass="table" DataKeyNames="cauhoi" OnRowDeleting="grv_thacmac_RowDeleting" >
                                <Columns>
                                    <asp:BoundField DataField="ngaydang" HeaderText="Ngày đăng" />
                                    <asp:BoundField DataField="cauhoi" HeaderText="Câu hỏi" />
                                    <asp:CommandField ButtonType="Button" DeleteText="Xóa" ShowDeleteButton="True">
                                    <ControlStyle CssClass="btn btn-danger" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                    </asp:CommandField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div><!-- end tab quan li file -->                     
<!------------------------------------------ SLIDER ---------------------------------------------------------------------->
                    <div class="tab-pane" id="slider">
                        <asp:UpdatePanel ID="udp_slider" runat="server">
                            <ContentTemplate>
                                <br />
                                <div class="panel panel-default">
                                    <div class="panel-heading" style="background-color:#222222;">
                                        <p style="font-size:20px; font-weight: bold; color:#279cf3;">Thay đổi Slider</p>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row" style="width:600px; margin: auto;">
                                            <div class="col-xs-6">
                                                <p style="font-weight: bold; font-size: 18px;">Upload ảnh</p>
                                                <fjx:FileUploader ID="ful_slider" runat="server" AllowedFileTypes="Ảnh IMG:*.jpg;" RequestAsPostBack="true">
                                                    <Adapters>
                                                        <fjx:FileSaverAdapter runat="server" FolderName="~/slider" OnFileNameDetermining="ful_slider_FileNameDetermining" />
                                                    </Adapters>
                                                </fjx:FileUploader>
                                            </div>
                                            <div class="col-xs-6">
                                                <p style="font-weight: bold; font-size: 18px;">Thông số và kích thước slider</p>
                                                <p>- Kích thước: 1600px x 700px</p>
                                                <p>- Loại file: JPG</p>
                                                <p>- Tên: sli_(0-5).jpg</p>
                                            </div>
                                        </div>
                                        <br />
                                        <asp:Button ID="btn_reloadalbum" CssClass="btn btn-default center-block" Text="Reload Album" runat="server" OnClick="btn_reloadalbum_Click" />
                                        <br />
                                        <asp:DataList ID="dtl_slider" runat="server" RepeatColumns="6" CssClass="table">
                                            <ItemTemplate>
                                                <asp:Image ID="img_slider" CssClass="thumbnail" runat="server" Height="88px" Width="200px" ImageUrl='<%# Eval("link") %>' />
                                                <span class="badge"><%# Eval("num") %></span>
                                        
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btn_reloadalbum" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>                      
                    </div><!-- end tab slider -->

                </div><!-- end tabs content -->

                <div style="height: 70px;"></div>

                <!-- Modal -->
                <div class="modal fade" id="div_doimatkhau" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Đổi mật khẩu</h4>
                        </div>
                        <div class="modal-body">
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon glyphicon glyphicon-lock" id="ico_oldpass"></span>
                                <input runat="server" name="txt_hoten" id="txt_matkhaucu" type="text" class="form-control" placeholder="Mật khẩu cũ" aria-describedby="ico_oldpass" />
                            </div>
                            <br />
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon glyphicon glyphicon-lock" id="ico_newpass"></span>
                                <input runat="server" name="txt_sdt" id="txt_matkhaumoi" type="text" class="form-control" placeholder="Mật khẩu mới" aria-describedby="ico_newpass" />
                            </div>             
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                            <asp:Button ID="btn_thaydoimatkhau" CssClass="btn btn-primary" Text="Cập nhật" runat="server" OnClick="btn_thaydoimatkhau_Click" />
                        </div>
                    </div>
                </div>
            </div><!-- end change password modal -->

            </div><!-- end container -->

        </form>       
    </body>
    <script type="text/javascript">
        $(document).ready(function () {
            $(function () {
                $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                    localStorage.setItem('lastTab', $(this).attr('href'));
                });
                var lastTab = localStorage.getItem('lastTab');
                if (lastTab) {
                    $('[href="' + lastTab + '"]').tab('show');
                }
            });
            $("#chb_anhbaiviet").click(function () {
                alert($("#chb_anhbaiviet").val());
            });
        });        
    </script>
</html>
