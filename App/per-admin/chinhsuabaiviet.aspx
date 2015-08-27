<%@ Page Language="C#" AutoEventWireup="true" CodeFile="chinhsuabaiviet.aspx.cs" Inherits="per_admin_chinhsuabaiviet" %>
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
        </style>
    </head>
    <body>
        <form id="form_" runat="server">
            <div class="container-fluid">
                <div class="page-header">
                    <a href="../default.aspx">
                        <img src="../image/logo_brand.png" alt="peradmin" class="img-responsive" style="width: 150px; height: 38px;"/>
                    </a>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" style="background-color: #222222;">
                        <p style="font-size: 20px; font-weight: bold; color: #279cf3;">Chỉnh sửa bài viết</p>
                    </div>
                    <div class="panel-body">
                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                            <br />
                            <div class="input-group">
                                <span class="input-group-addon glyphicon glyphicon glyphicon-pencil" id="ico_tieude"></span>
                                <input runat="server" disabled="disabled" maxlength="65" name="txt_tieude" id="txt_tieude" type="text" class="form-control" placeholder="Tiêu đề bài viết" aria-describedby="ico_tieude" />
                            </div>
                            <br />
                            <CKEditor:CKEditorControl ID="cke_baiviet" runat="server" Height="500px"></CKEditor:CKEditorControl>
                            <br />
                            <div style="width: 180px; margin: auto;">
                                <a href="dashboard.aspx">
                                    <input type="button" class="btn btn-default" value="Trở lại"/>
                                </a>
                                <asp:Button OnClientClick="return confirm('Bạn có chắc rằng sẽ cập nhật lại nội dung bài viết ?')" ID="btn_suabaiviet" CssClass="btn btn-primary" Text="Cập nhật" runat="server" OnClick="btn_suabaiviet_Click" />
                            </div>
                        </div>
                        <br />
                        <span style="font-size: 18px;">Upload ảnh cho bài viết</span>
                        <br />  
                        <fjx:FileUploader ID="ful_uploadanh" runat="server" AllowedFileTypes="Web Images (Jpeg, Gig, Png):*.jpg;*.jpeg;*.png;*.gif" RequestAsPostBack="true">
                            <Adapters>
                                <fjx:FileSaverAdapter runat="server" FolderName="~/article" OnFileNameDetermining="ful_uploadanh_FileNameDetermining" />
                            </Adapters>
                        </fjx:FileUploader>                          
                        <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">                              
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
                                    <asp:DropDownList ID="ddl_anhbaiviet" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>  
                    </div>                        
                </div>
                <div style="height: 70px;"></div>
            </div>
        </form>
    </body>
</html>
