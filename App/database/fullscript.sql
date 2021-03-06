USE [master]
GO
/****** Object:  Database [PERSKY]    Script Date: 08/15/2015 21:19:57 ******/
CREATE DATABASE [PERSKY] ON  PRIMARY 
( NAME = N'PERSKY', FILENAME = N'D:\Persky_DB\PERSKY.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PERSKY_log', FILENAME = N'D:\Persky_DB\PERSKY_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 1024KB )
GO
ALTER DATABASE [PERSKY] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PERSKY].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PERSKY] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [PERSKY] SET ANSI_NULLS OFF
GO
ALTER DATABASE [PERSKY] SET ANSI_PADDING OFF
GO
ALTER DATABASE [PERSKY] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [PERSKY] SET ARITHABORT OFF
GO
ALTER DATABASE [PERSKY] SET AUTO_CLOSE ON
GO
ALTER DATABASE [PERSKY] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [PERSKY] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [PERSKY] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [PERSKY] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [PERSKY] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [PERSKY] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [PERSKY] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [PERSKY] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [PERSKY] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [PERSKY] SET  ENABLE_BROKER
GO
ALTER DATABASE [PERSKY] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [PERSKY] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [PERSKY] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [PERSKY] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [PERSKY] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [PERSKY] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [PERSKY] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [PERSKY] SET  READ_WRITE
GO
ALTER DATABASE [PERSKY] SET RECOVERY SIMPLE
GO
ALTER DATABASE [PERSKY] SET  MULTI_USER
GO
ALTER DATABASE [PERSKY] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [PERSKY] SET DB_CHAINING OFF
GO
USE [PERSKY]
GO
/****** Object:  Table [dbo].[YEUCAU]    Script Date: 08/15/2015 21:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[YEUCAU](
	[MAYEUCAU] [varchar](20) NOT NULL,
	[HOTEN] [nvarchar](200) NULL,
	[EMAIL] [nvarchar](200) NULL,
	[SODIENTHOAI] [nvarchar](15) NULL,
	[DIACHITHICONG] [nvarchar](200) NULL,
	[NOIDUNG] [ntext] NULL,
	[NGAYGUI] [datetime] NULL,
	[TRANGTHAI] [nvarchar](50) NULL,
 CONSTRAINT [PK_MAYEUCAU] PRIMARY KEY CLUSTERED 
(
	[MAYEUCAU] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[YEUCAU] ([MAYEUCAU], [HOTEN], [EMAIL], [SODIENTHOAI], [DIACHITHICONG], [NOIDUNG], [NGAYGUI], [TRANGTHAI]) VALUES (N'2015-07-05-01-13-16', N'Công ty Lancy', N'lancy@master.com', N'01642777610', N'Số 1023, Trần Xuân Diệu, Ba Đình, Hà Nội', N'Chúng tôi đang trong quá trình thi công tòa nhà Lancy và hiện đang muốn tìm kiếm một đối tác có đủ khả năng thi công trần nhà cho 3 tầng 1 2 3. Mọi chi tiết cụ thể chúng ta có thể gặp mặt trược tiếp để làm việc sau.
Thân ái', CAST(0x0000A4CC00D9E179 AS DateTime), N'ĐÃ DUYỆT')
INSERT [dbo].[YEUCAU] ([MAYEUCAU], [HOTEN], [EMAIL], [SODIENTHOAI], [DIACHITHICONG], [NOIDUNG], [NGAYGUI], [TRANGTHAI]) VALUES (N'2015-07-05-01-46-55', N'Nguyễn Ngọc Yến Huỳnh', N'jinguyen46@yahoo.com', N'01642777610', N'Nguyễn Thái Sơn, Gò Vấp', N'Muốn đặt nhà cho chúng ta', CAST(0x0000A4CC00E31EB3 AS DateTime), N'CHỜ XỬ LÍ')
/****** Object:  Table [dbo].[THACMAC]    Script Date: 08/15/2015 21:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THACMAC](
	[CAUHOI] [nvarchar](200) NULL,
	[CAUTRALOI] [ntext] NULL,
	[NGAYDANG] [datetime] NOT NULL,
 CONSTRAINT [PK_THACMAC] PRIMARY KEY CLUSTERED 
(
	[NGAYDANG] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[THACMAC] ([CAUHOI], [CAUTRALOI], [NGAYDANG]) VALUES (N'Tôi nên sử dụng loại tấm nào cho trần phòng khách ?', N'Chào anh, để thi công phòng khách, chúng tôi khuyên anh nên sử dụng loại tấm MEGA hiện đang có trên website. Với các đặc tính chịu lực cao, chống thấm và nhẹ sẽ là lựa chọn tốt ưu cho ngôi nhà của anh. Thân ái', CAST(0x0000A4CE00000000 AS DateTime))
INSERT [dbo].[THACMAC] ([CAUHOI], [CAUTRALOI], [NGAYDANG]) VALUES (N'Đặc tính của tấm DECO hiện có trên website bao gồm những gì ?', N'Với tấm DECO do Persky cung cấp, quí khách hàng có thể yên tâm về chất lượng. Sử dụng công nghệ silicon của Ý cho phép chịu đừng được 10000 giờ chiếu sáng, 1 triệu tấn nước mưa và chịu tải đến 10kg. Thân ái', CAST(0x0000A4F5012B9B93 AS DateTime))
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 08/15/2015 21:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MAKHACHHANG] [varchar](20) NOT NULL,
	[TENKHACHHANG] [nvarchar](200) NULL,
	[SODIENTHOAI] [nvarchar](15) NULL,
	[EMAIL] [nvarchar](200) NULL,
	[DIACHI] [nvarchar](200) NULL,
 CONSTRAINT [PK_KHACHANG] PRIMARY KEY CLUSTERED 
(
	[MAKHACHHANG] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[KHACHHANG] ([MAKHACHHANG], [TENKHACHHANG], [SODIENTHOAI], [EMAIL], [DIACHI]) VALUES (N'KH-20150815041443', N'Nguyễn Anh Thi', N'01642777610', N'anhthi.nguyen@hotmai.com', N'Trần Xuân Soạn, Quận 7')
/****** Object:  Table [dbo].[BAIVIET]    Script Date: 08/15/2015 21:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BAIVIET](
	[MABAIVIET] [varchar](50) NOT NULL,
	[TIEUDE] [nvarchar](200) NULL,
	[ANHBAIVIET] [nvarchar](100) NULL,
	[NOIDUNG] [ntext] NULL,
	[NGAYDANG] [datetime] NULL,
 CONSTRAINT [PK_BAIVIET] PRIMARY KEY CLUSTERED 
(
	[MABAIVIET] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[BAIVIET] ([MABAIVIET], [TIEUDE], [ANHBAIVIET], [NOIDUNG], [NGAYDANG]) VALUES (N'2015-06-30-09-34-35', N'Tạo không gian sống sinh thái cho nhà phố với giếng trời', N'../article/Tạo không gian sống sinh thái cho nhà phố với giếng trời/gieng troi (1).jpg', N'<h2><strong><span style="font-size:16px">Trong việc thiết kế nh&agrave; ở, đặc biệt c&aacute;c nh&agrave; ở nhỏ như nh&agrave; l&ocirc;, biệt thự liền kế th&igrave; vấn đề th&ocirc;ng gi&oacute; v&agrave; chiếu s&aacute;ng l&agrave; một yếu tố quan trọng được đặt ra. Giải quyết vấn đề n&agrave;y th&igrave; giải ph&aacute;p sử dụng giếng trời tỏ ra kh&aacute; hiệu quả cả về mặt kh&ocirc;ng gian, thẩm mỹ v&agrave; kỹ thuật.</span></strong></h2>

<p><span style="color:rgb(0, 0, 0); font-family:arial,helvetica,sans-serif; font-size:14px">Giếng trời l&agrave; bộ phận th&ocirc;ng gi&oacute; v&agrave; chiếu s&aacute;ng cho nh&agrave; ống khi chiều d&agrave;i ng&ocirc;i nh&agrave; lớn hơn 12m. Th&ocirc;ng thường người ta d&ugrave;ng giếng trời để chiếu s&aacute;ng cho c&aacute;c ph&ograve;ng kh&ocirc;ng tiếp x&uacute;c với mặt ngo&agrave;i nh&agrave; như cầu thang, vệ sinh, hoặc ph&ograve;ng ngủ. Ph&iacute;a tr&ecirc;n m&aacute;i thường lợp bằng tấm lợp th&ocirc;ng minh để chiếu s&aacute;ng v&agrave; chống mưa. Độ rộng giếng trời t&ugrave;y thuộc v&agrave;o diện t&iacute;ch khu đất, nh&igrave;n chung kh&ocirc;ng n&ecirc;n nhỏ hơn 1m. Nh&agrave; c&agrave;ng cao th&igrave; giếng trời c&agrave;ng phải rộng.</span></p>

<p style="text-align: center;"><span style="color:rgb(0, 0, 0); font-family:arial,helvetica,sans-serif; font-size:14px"><img alt="" src="http://localhost:2116/article/T%e1%ba%a1o%20kh%c3%b4ng%20gian%20s%e1%bb%91ng%20sinh%20th%c3%a1i%20cho%20nh%c3%a0%20ph%e1%bb%91%20v%e1%bb%9bi%20gi%e1%ba%bfng%20tr%e1%bb%9di/gieng%20troi%20(7).jpg" style="height:675px; width:450px" /></span></p>

<p><span style="color:rgb(0, 0, 0); font-family:arial,helvetica,sans-serif; font-size:14px">Giếng trời th&ocirc;ng gi&oacute;, chiếu s&aacute;ng cho nh&agrave; c&oacute; chiều d&agrave;i thường lớn hơn 12m. Độ rộng giếng trời t&ugrave;y thuộc v&agrave;o diện t&iacute;ch khu đất.</span><br />
&nbsp;</p>

<div style="margin: 0px 0px 14px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; line-height: 19.6000003814697px; background: transparent;">Cấu tạo giếng trời gồm 3 phần: phần ch&acirc;n tiếp x&uacute;c mặt đất, phần lưng v&agrave; phần m&aacute;i. Phần ch&acirc;n c&oacute; thể bố tr&iacute; c&acirc;y hoa, non bộ kết hợp với kh&ocirc;ng gian tiếp kh&aacute;ch hoặc ph&ograve;ng ăn. Phần lưng l&agrave; nơi chiếu s&aacute;ng cho c&aacute;c tầng b&ecirc;n tr&ecirc;n. Phần m&aacute;i để chiếu s&aacute;ng, th&ocirc;ng gi&oacute;.</div>

<div style="margin: 0px 0px 14px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; line-height: 19.6000003814697px; text-align: center; background: transparent;"><img alt="" src="http://localhost:2116/article/T%e1%ba%a1o%20kh%c3%b4ng%20gian%20s%e1%bb%91ng%20sinh%20th%c3%a1i%20cho%20nh%c3%a0%20ph%e1%bb%91%20v%e1%bb%9bi%20gi%e1%ba%bfng%20tr%e1%bb%9di/gieng%20troi%20(5).jpg" style="height:675px; width:450px" /></div>

<div style="margin: 0px 0px 14px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; line-height: 19.6000003814697px; background: transparent;"><span style="color:rgb(0, 0, 0); font-family:arial,helvetica,sans-serif; font-size:14px">Phần ch&acirc;n giếng trời c&oacute; thể bố tr&iacute; tiểu cảnh kết hợp &aacute;nh s&aacute;ng trang tr&iacute;.</span></div>

<div style="margin: 0px 0px 14px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; line-height: 19.6000003814697px; text-align: center; background: transparent;"><span style="color:rgb(0, 0, 0); font-family:arial,helvetica,sans-serif; font-size:14px"><img alt="" src="http://localhost:2116/article/T%e1%ba%a1o%20kh%c3%b4ng%20gian%20s%e1%bb%91ng%20sinh%20th%c3%a1i%20cho%20nh%c3%a0%20ph%e1%bb%91%20v%e1%bb%9bi%20gi%e1%ba%bfng%20tr%e1%bb%9di/gieng%20troi%20(4).jpg" style="height:843px; width:600px" /></span></div>

<div style="margin: 0px 0px 14px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; line-height: 19.6000003814697px; background: transparent;"><span style="color:rgb(0, 0, 0); font-family:arial,helvetica,sans-serif; font-size:14px">Đ&ocirc;i khi để giữ lại c&acirc;y xanh đ&atilde; c&oacute; từ trước, nh&agrave; thiết kế sẽ &ldquo;chế&rdquo; v&agrave; t&iacute;nh to&aacute;n hợp l&yacute; để giữ được giếng trời &ldquo;xanh&rdquo; cho nh&agrave; phố.</span></div>

<div style="margin: 0px 0px 14px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; line-height: 19.6000003814697px; text-align: center; background: transparent;"><span style="color:rgb(0, 0, 0); font-family:arial,helvetica,sans-serif; font-size:14px"><img alt="" src="http://localhost:2116/article/T%e1%ba%a1o%20kh%c3%b4ng%20gian%20s%e1%bb%91ng%20sinh%20th%c3%a1i%20cho%20nh%c3%a0%20ph%e1%bb%91%20v%e1%bb%9bi%20gi%e1%ba%bfng%20tr%e1%bb%9di/gieng%20troi%20(2).jpg" style="height:603px; width:600px" /></span></div>

<div style="margin: 0px 0px 14px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; line-height: 19.6000003814697px; background: transparent;">
<div style="margin: 0px 0px 14px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; line-height: 19.6000003814697px; background: transparent;">
<div style="margin: 0px 0px 14px; padding: 0px; border: 0px; outline: 0px; vertical-align: baseline; background: transparent;">Ph&ograve;ng người gi&agrave; tiếp cận trực tiếp với khoảng xanh giếng trời rất tốt cho sức khỏe v&agrave; t&acirc;m l&yacute; c&aacute;c cụ hướng về thi&ecirc;n nhi&ecirc;n.</div>
</div>

<div style="margin: 0px 0px 14px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; line-height: 19.6000003814697px; background: transparent;">Với đặc điểm kh&ocirc;ng gian cao v&agrave; hẹp, &aacute;nh s&aacute;ng yếu, bạn c&oacute; thể trang tr&iacute; giếng trời giống như một th&aacute;c nước, một v&aacute;ch n&uacute;i để tạo cảm gi&aacute;c đưa thi&ecirc;n nhi&ecirc;n v&agrave;o trong nh&agrave;.</div>

<div style="margin: 0px 0px 14px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; line-height: 19.6000003814697px; text-align: center; background: transparent;"><img alt="" src="http://localhost:2116/article/T%e1%ba%a1o%20kh%c3%b4ng%20gian%20s%e1%bb%91ng%20sinh%20th%c3%a1i%20cho%20nh%c3%a0%20ph%e1%bb%91%20v%e1%bb%9bi%20gi%e1%ba%bfng%20tr%e1%bb%9di/gieng%20troi%20(6).jpg" style="height:638px; width:450px" /></div>

<div style="margin: 0px 0px 14px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; line-height: 19.6000003814697px; background: transparent;"><span style="color:rgb(0, 0, 0); font-family:arial,helvetica,sans-serif; font-size:14px">Giếng trời n&ecirc;n bố tr&iacute; ở vị tr&iacute; vừa phục vụ cho việc chiếu s&aacute;ng vừa phục vụ cho việc xử l&yacute; kh&ocirc;ng gian kiến tr&uacute;c. Với nh&agrave; l&ocirc; số tầng thường từ 3 - 5 tầng th&igrave; an to&agrave;n khi sử dụng cũng l&agrave; vấn đề n&ecirc;n ch&uacute; &yacute; khi thiết kế. Giải ph&aacute;p c&oacute; thể sử dụng l&agrave; gi&agrave;n gỗ hoặc sắt được thiết kế ph&ugrave; hợp với nội thất v&agrave; phong c&aacute;ch kiến tr&uacute;c của ng&ocirc;i nh&agrave;.</span></div>
</div>

<div style="margin: 0px 0px 14px; padding: 0px; border: 0px; outline: 0px; font-size: 14px; vertical-align: baseline; color: rgb(0, 0, 0); font-family: Arial, Helvetica, sans-serif; line-height: 19.6000003814697px; background: transparent;">&nbsp;</div>
', CAST(0x0000A4C701639236 AS DateTime))
INSERT [dbo].[BAIVIET] ([MABAIVIET], [TIEUDE], [ANHBAIVIET], [NOIDUNG], [NGAYDANG]) VALUES (N'2015-07-01-12-24-53', N'Tiểu cảnh hồ nước trong nhà, tại sao không', N'../article/Tiểu cảnh hồ nước trong nhà, tại sao không/honuoc1702141-600x450.jpg', N'<p style="text-align:center"><img alt="" src="http://localhost:2116/article/Ti%e1%bb%83u%20c%e1%ba%a3nh%20h%e1%bb%93%20n%c6%b0%e1%bb%9bc%20trong%20nh%c3%a0,%20t%e1%ba%a1i%20sao%20kh%c3%b4ng/honuoc1702149-600x399.jpg" style="height:399px; width:600px" /></p>

<p style="text-align:justify">Trong kh&ocirc;ng gian sống hiện đại, tiểu cảnh hồ nước c&ugrave;ng với v&agrave;i chậu c&acirc;y cảnh xanh m&aacute;t xung quanh vừa gi&uacute;p trang tr&iacute; cho ng&ocirc;i nh&agrave; th&ecirc;m sinh động, bắt mắt, vừa tạo cảm gi&aacute;c thư gi&atilde;n, r&uacute;t ngắn khoảng c&aacute;ch của con người với thi&ecirc;n nhi&ecirc;n, m&agrave; c&ograve;n c&oacute; &yacute; nghĩa về mặt phong thủy.</p>

<p style="text-align:justify">Khoa học phong thủy quan niệm &ldquo;kh&iacute; gặp thủy th&igrave; dừng, gặp phong th&igrave; t&aacute;n&rdquo;, ch&iacute;nh v&igrave; vậy một hồ nước nho nhỏ &iacute;t tốn k&eacute;m diện t&iacute;ch v&agrave; chi ph&iacute; được x&acirc;y trong nh&agrave; sẽ gi&uacute;p tăng kh&iacute; lực dồi d&agrave;o cho c&ocirc;ng tr&igrave;nh.&nbsp;Hồ nước m&aacute;t mẻ với tiếng nước chảy r&oacute;c r&aacute;ch, c&ugrave;ng với cỏ c&acirc;y hoa l&aacute; sinh động v&agrave; xanh m&aacute;t ở trong nh&agrave; sẽ l&agrave;m cho ng&ocirc;i nh&agrave; của bạn trở th&agrave;nh m&ocirc;i trường sống thoải m&aacute;i, giải tỏa bao căng thẳng trong cuộc sống.</p>

<p style="text-align:justify">Những tiểu cảnh hồ nước trong nh&agrave; dưới đ&acirc;y do c&aacute;c KTS&nbsp;<a href="http://khonggiandep.com.vn/" rel="nofollow" style="box-sizing: border-box; color: rgb(238, 29, 37); outline: none; background-color: transparent;" target="_blank">Kh&ocirc;ng Gian Đẹp</a>&nbsp;thiết kế l&agrave; những thiết kế đẹp mắt v&agrave; dễ ứng dụng cho bạn chọn lựa.</p>

<p style="text-align:center"><img alt="" src="http://localhost:2116/article/Ti%e1%bb%83u%20c%e1%ba%a3nh%20h%e1%bb%93%20n%c6%b0%e1%bb%9bc%20trong%20nh%c3%a0,%20t%e1%ba%a1i%20sao%20kh%c3%b4ng/honuoc1702143-600x450.jpg" style="height:450px; width:600px" /></p>

<p style="text-align:center"><em>Hồ nước ở ph&iacute;a trước nh&agrave;, vừa mở cổng sẽ bắt gặp khung cảnh m&aacute;t mẻ, tạo cảm gi&aacute;c thư th&aacute;i ngay khi bước v&agrave;o nh&agrave;.</em></p>

<p style="text-align:center"><em><img alt="" src="http://localhost:2116/article/Ti%e1%bb%83u%20c%e1%ba%a3nh%20h%e1%bb%93%20n%c6%b0%e1%bb%9bc%20trong%20nh%c3%a0,%20t%e1%ba%a1i%20sao%20kh%c3%b4ng/honuoc1702145-600x375.jpg" style="height:375px; width:600px" /></em></p>

<p style="text-align:center"><em>G&oacute;c chết dưới ch&acirc;n cầu thang trở n&ecirc;n thu h&uacute;t nhờ hồ nước v&agrave; cỏ c&acirc;y trang tr&iacute;</em></p>

<p style="text-align:center"><em><img alt="" src="http://localhost:2116/article/Ti%e1%bb%83u%20c%e1%ba%a3nh%20h%e1%bb%93%20n%c6%b0%e1%bb%9bc%20trong%20nh%c3%a0,%20t%e1%ba%a1i%20sao%20kh%c3%b4ng/honuoc1702146-600x450.jpg" style="height:450px; width:600px" /></em></p>

<p style="text-align:center"><em>Một chiếc cầu gỗ nhỏ xinh bắt qua hồ nước dưới ch&acirc;n cầu thang, đi đến ph&ograve;ng ăn.</em></p>
', CAST(0x0000A4C80006D5AC AS DateTime))
INSERT [dbo].[BAIVIET] ([MABAIVIET], [TIEUDE], [ANHBAIVIET], [NOIDUNG], [NGAYDANG]) VALUES (N'2015-07-05-04-13-02', N'Sự kết hợp độc đáo giữa vườn cây và đồ nội thất', N'../article/Sự kết hợp độc đáo giữa vườn cây và đồ nội thất/noi-that-2.jpg', N'<h2><strong><span style="font-size:18px">Bạn đ&atilde; bao giờ nghĩ sẽ kết hợp một vườn c&acirc;y với b&agrave;n, ghế để trồng c&acirc;y trong nh&agrave;? Đ&acirc;y l&agrave; một giải ph&aacute;p hiệu quả nếu muốn đem kh&ocirc;ng gian xanh v&agrave;o ng&ocirc;i nh&agrave; của bạn m&agrave; kh&ocirc;ng tốn th&ecirc;m diện t&iacute;ch.</span></strong></h2>

<p><span style="font-family:times new roman; font-size:16px">Bạn đ&atilde; bao giờ nghĩ sẽ kết hợp một&nbsp;</span><strong><a href="http://afamily.vn/giai-phap-tien-ich/hoc-nguoi-nhat-cach-trang-tri-vuon-cuc-dep-voi-cay-bonsai-20150409121926147.chn" style="margin: 0px; padding: 0px; text-decoration: none; outline: none; -webkit-appearance: none;" target="_blank" title="vườn&nbsp;cây">vườn&nbsp;c&acirc;y</a></strong><span style="font-family:times new roman; font-size:16px">&nbsp;với những vật dụng b&agrave;n, ghế để trồng c&acirc;y trong nh&agrave;? Đ&acirc;y l&agrave; một giải ph&aacute;p hiệu quả nếu muốn đem kh&ocirc;ng gian xanh v&agrave;o ng&ocirc;i nh&agrave; của bạn khi kh&ocirc;ng cần th&ecirc;m diện t&iacute;ch. N&oacute; vừa c&oacute; chức năng để trưng b&agrave;y l&agrave;m điểm nhấn, vừa gi&uacute;p bạn lạc v&agrave;o thế giới thi&ecirc;n nhi&ecirc;n m&agrave; kh&ocirc;ng cần phải bước ra khỏi nh&agrave;. Dưới đ&acirc;y l&agrave; những v&iacute; dụ về&nbsp;</span><a href="http://afamily.vn/do-noi-that.htm" style="margin: 0px; padding: 0px; text-decoration: none; outline: none; -webkit-appearance: none; font-family: ''Times New Roman''; font-size: 16px; line-height: 20px; -webkit-text-stroke-color: rgba(255, 255, 255, 0.00784314); -webkit-text-stroke-width: 0.100000001490116px;" target="_blank" title="đồ nội thất">đồ nội thất</a><span style="font-family:times new roman; font-size:16px">&nbsp;trồng c&acirc;y cảnh, hy vọng bạn sẽ t&igrave;m được những giải ph&aacute;p hay cho ng&ocirc;i nh&agrave; của m&igrave;nh.</span></p>

<p><strong>Thổi hồn v&agrave;o nghệ thuật trang tr&iacute;</strong></p>

<p><span style="font-family:times new roman; font-size:16px">Nghi&ecirc;n cứu cho thấy nếu giam minh trong văn ph&ograve;ng cả ng&agrave;y sẽ khiến cho sức khoẻ v&agrave; năng suất con người giảm s&uacute;t. Để tr&aacute;nh được những t&aacute;c động ti&ecirc;u cực n&agrave;y, Daniel Zeller đ&atilde; đặt trong ph&ograve;ng l&agrave;m việc của m&igrave;nh một chiếc b&agrave;n tr&agrave;n ngập c&acirc;y cảnh, bất cứ khi n&agrave;o muốn nghỉ ngơi v&agrave; đắm ch&igrave;m trong thi&ecirc;n nhi&ecirc;n, anh lại ngắm nh&igrave;n ốc đảo xanh n&agrave;y v&agrave; thư gi&atilde;n.</span></p>

<p style="text-align:center"><span style="font-family:times new roman; font-size:16px"><img alt="" src="http://localhost:2116/article/S%e1%bb%b1%20k%e1%ba%bft%20h%e1%bb%a3p%20%c4%91%e1%bb%99c%20%c4%91%c3%a1o%20gi%e1%bb%afa%20v%c6%b0%e1%bb%9dn%20c%c3%a2y%20v%c3%a0%20%c4%91%e1%bb%93%20n%e1%bb%99i%20th%e1%ba%a5t/noi-that-2.jpg" style="height:512px; width:736px" /></span></p>

<p style="text-align:center"><span style="font-family:times new roman; font-size:16px">Để l&agrave;m n&ecirc;n một chiếc b&agrave;n m&agrave; c&oacute; thể trồng được c&acirc;y, Better Home v&agrave; Garden&#39;s DIY đ&atilde; đưa ra một v&agrave;i tip hướng dẫn. Đơn giản ch&uacute;ng ta chỉ cần đặt những ống đồng bịt cao su v&agrave;o chậu hoa đ&atilde; c&oacute; sẵn đ&aacute;, v&agrave; đặt v&agrave;o đ&oacute; một v&agrave;i loại c&acirc;y xương rồng hoặc loại c&acirc;y kh&aacute;c.</span></p>

<p style="text-align:center"><span style="font-family:times new roman; font-size:16px"><img alt="" src="http://localhost:2116/article/S%e1%bb%b1%20k%e1%ba%bft%20h%e1%bb%a3p%20%c4%91%e1%bb%99c%20%c4%91%c3%a1o%20gi%e1%bb%afa%20v%c6%b0%e1%bb%9dn%20c%c3%a2y%20v%c3%a0%20%c4%91%e1%bb%93%20n%e1%bb%99i%20th%e1%ba%a5t/noi-that-3.jpg" style="height:866px; width:650px" /></span></p>

<p><strong>Vật dụng &aacute;nh s&aacute;ng m&agrave;u xanh</strong></p>

<p><span style="font-family:times new roman; font-size:16px">Chiếc đ&egrave;n kết hợp c&acirc;y cảnh n&agrave;y l&agrave; một giải ph&aacute;p ho&agrave;n hảo để đưa yếu tố thi&ecirc;n nhi&ecirc;n v&agrave;o&nbsp;</span><a href="http://afamily.vn/nha-hay/nhung-ngoi-nha-doi-cay-doc-dao-nhat-the-gioi-p2-20141103113514947.chn" style="margin: 0px; padding: 0px; text-decoration: none; outline: none; -webkit-appearance: none; font-family: ''Times New Roman''; font-size: 16px; line-height: 20px; -webkit-text-stroke-color: rgba(255, 255, 255, 0.00784314); -webkit-text-stroke-width: 0.100000001490116px;" target="_blank" title="ngôi nhà">ng&ocirc;i nh&agrave;</a><span style="font-family:times new roman; font-size:16px">, cho d&ugrave; bạn kh&ocirc;ng c&oacute; nhiều kh&ocirc;ng gian rộng.</span></p>

<p><span style="font-family:times new roman; font-size:16px"><img alt="" src="http://localhost:2116/article/S%e1%bb%b1%20k%e1%ba%bft%20h%e1%bb%a3p%20%c4%91%e1%bb%99c%20%c4%91%c3%a1o%20gi%e1%bb%afa%20v%c6%b0%e1%bb%9dn%20c%c3%a2y%20v%c3%a0%20%c4%91%e1%bb%93%20n%e1%bb%99i%20th%e1%ba%a5t/noi-that-4.jpg" style="height:675px; width:775px" />Chiếc đ&egrave;n Jos&eacute; de la O&lsquo;s Vicky Pendant l&agrave; một v&iacute; dụ rất hay khi bạn muốn trồng c&acirc;y trong nh&agrave;. Được trưng b&agrave;y tại hội chợ triển l&atilde;m đồ nội thất Milan, chiếc đ&egrave;n với nhiều t&iacute;nh năng sử dụng n&agrave;y c&oacute; thể tập trung được &aacute;nh s&aacute;ng m&agrave;u xanh v&agrave; gi&uacute;p cho c&acirc;y ph&aacute;t triển.</span></p>

<div style="margin: 0px; padding: 0px; font-family: ''Times New Roman''; font-size: 16px; line-height: 20px; -webkit-text-stroke-color: rgba(255, 255, 255, 0.00784314); -webkit-text-stroke-width: 0.100000001490116px;">Liệu bạn c&oacute; thể nu&ocirc;i lớn một c&aacute;i c&acirc;y m&agrave; kh&ocirc;ng c&oacute; rễ? Th&iacute; nghiệm mang t&ecirc;n &quot;Root&quot; của nghệ nh&acirc;n Kai Linke đ&atilde; kiểm chứng &yacute; tưởng n&agrave;y trong diện nhỏ. V&agrave; Linke hy vọng trong tương lai anh c&oacute; thể thực hiện được th&iacute; nghiệm với diện t&iacute;ch lớn hơn.</div>

<div style="margin: 0px; padding: 0px; font-family: ''Times New Roman''; font-size: 16px; line-height: 20px; -webkit-text-stroke-color: rgba(255, 255, 255, 0.00784314); -webkit-text-stroke-width: 0.100000001490116px; text-align: center;"><img alt="" src="http://localhost:2116/article/S%e1%bb%b1%20k%e1%ba%bft%20h%e1%bb%a3p%20%c4%91%e1%bb%99c%20%c4%91%c3%a1o%20gi%e1%bb%afa%20v%c6%b0%e1%bb%9dn%20c%c3%a2y%20v%c3%a0%20%c4%91%e1%bb%93%20n%e1%bb%99i%20th%e1%ba%a5t/noi-that-7.jpg" style="height:553px; width:849px" /></div>
', CAST(0x0000A4CC010B407F AS DateTime))
/****** Object:  Table [dbo].[DANHMUCHANG]    Script Date: 08/15/2015 21:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DANHMUCHANG](
	[MADANHMUC] [varchar](20) NOT NULL,
	[TENDANHMUC] [nvarchar](200) NULL,
 CONSTRAINT [PK_DANHMUC] PRIMARY KEY CLUSTERED 
(
	[MADANHMUC] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[DANHMUCHANG] ([MADANHMUC], [TENDANHMUC]) VALUES (N'_khungtran', N'Khung Trần')
INSERT [dbo].[DANHMUCHANG] ([MADANHMUC], [TENDANHMUC]) VALUES (N'_khungvachngan', N'Khung Vách Ngăn')
INSERT [dbo].[DANHMUCHANG] ([MADANHMUC], [TENDANHMUC]) VALUES (N'_phukien', N'Phụ Kiện')
INSERT [dbo].[DANHMUCHANG] ([MADANHMUC], [TENDANHMUC]) VALUES (N'_tam', N'Các Loại Tấm')
INSERT [dbo].[DANHMUCHANG] ([MADANHMUC], [TENDANHMUC]) VALUES (N'congtrinhkhac', N'Công Trình Khác')
INSERT [dbo].[DANHMUCHANG] ([MADANHMUC], [TENDANHMUC]) VALUES (N'nhahang-khachsan-bar', N'Nhà Hàng - Khách Sạn - Bar')
INSERT [dbo].[DANHMUCHANG] ([MADANHMUC], [TENDANHMUC]) VALUES (N'nhamay-xuong', N'Nhà Máy - Xưởng')
INSERT [dbo].[DANHMUCHANG] ([MADANHMUC], [TENDANHMUC]) VALUES (N'nhapho-chungcu', N'Nhà Phố - Chung Cư')
INSERT [dbo].[DANHMUCHANG] ([MADANHMUC], [TENDANHMUC]) VALUES (N'tttm-vanphong', N'Trung Tâm Thương Mại - Văn Phòng')
/****** Object:  Table [dbo].[CONGVIEC]    Script Date: 08/15/2015 21:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONGVIEC](
	[MACONGVIEC] [int] IDENTITY(1,1) NOT NULL,
	[CONGVIEC] [nvarchar](300) NULL,
 CONSTRAINT [PK_CONGVIEC] PRIMARY KEY CLUSTERED 
(
	[MACONGVIEC] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DVT]    Script Date: 08/15/2015 21:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DVT](
	[MADVT] [int] IDENTITY(1,1) NOT NULL,
	[DONVITINH] [nvarchar](150) NULL,
 CONSTRAINT [PK_DVT] PRIMARY KEY CLUSTERED 
(
	[MADVT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DVT] ON
INSERT [dbo].[DVT] ([MADVT], [DONVITINH]) VALUES (1, N'Mét Vuông')
INSERT [dbo].[DVT] ([MADVT], [DONVITINH]) VALUES (2, N'Tấm')
INSERT [dbo].[DVT] ([MADVT], [DONVITINH]) VALUES (3, N'Thanh')
INSERT [dbo].[DVT] ([MADVT], [DONVITINH]) VALUES (4, N'Kg')
SET IDENTITY_INSERT [dbo].[DVT] OFF
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 08/15/2015 21:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MANHANVIEN] [varchar](20) NOT NULL,
	[MATKHAU] [nvarchar](200) NULL,
	[TENNHANVIEN] [nvarchar](200) NULL,
	[CHUCVU] [nvarchar](100) NULL,
	[GIOITINH] [bit] NULL,
	[NGAYSINH] [datetime] NULL,
	[DIACHI] [nvarchar](200) NULL,
	[SODIENTHOAI] [nvarchar](15) NULL,
	[EMAIL] [nvarchar](200) NULL,
	[TRANGTHAI] [nvarchar](50) NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[MANHANVIEN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[NHANVIEN] ([MANHANVIEN], [MATKHAU], [TENNHANVIEN], [CHUCVU], [GIOITINH], [NGAYSINH], [DIACHI], [SODIENTHOAI], [EMAIL], [TRANGTHAI]) VALUES (N'13300116', N'yen huynh', N'Nguyễn Anh Thi', N'Quản trị website', 1, CAST(0x0000880E00000000 AS DateTime), N'Trần Xuân Soạn, Quận 7', N'01642777610', N'anhthi.nguyen@hotmail.com', N'Đang làm việc')
/****** Object:  Table [dbo].[MUCDOTHANTHIETCACNAM]    Script Date: 08/15/2015 21:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MUCDOTHANTHIETCACNAM](
	[MAKHACHHANG] [varchar](20) NOT NULL,
	[NAM] [varchar](4) NOT NULL,
	[TICHDIEM] [int] NOT NULL,
	[HIENVAT] [nvarchar](300) NULL,
 CONSTRAINT [PK_MDTTCN] PRIMARY KEY CLUSTERED 
(
	[MAKHACHHANG] ASC,
	[NAM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MATHANG]    Script Date: 08/15/2015 21:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MATHANG](
	[MAMATHANG] [varchar](20) NOT NULL,
	[MADANHMUC] [varchar](20) NULL,
	[MOTA] [ntext] NULL,
	[TENMATHANG] [nvarchar](200) NULL,
	[DONVITINH] [nvarchar](50) NULL,
	[GHICHU] [ntext] NULL,
	[THUMUCHINH] [nvarchar](100) NULL,
	[ANHDAIDIEN] [nvarchar](200) NULL,
	[NGAYDANG] [datetime] NULL,
	[DANHGIA] [int] NULL,
 CONSTRAINT [PK_MATHANG] PRIMARY KEY CLUSTERED 
(
	[MAMATHANG] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MATHANG] ([MAMATHANG], [MADANHMUC], [MOTA], [TENMATHANG], [DONVITINH], [GHICHU], [THUMUCHINH], [ANHDAIDIEN], [NGAYDANG], [DANHGIA]) VALUES (N'MT-20150707082705', N'nhapho-chungcu', N'', N'Mẫu trần dành cho nhà phố', N'Khong DVT', N'', N'MT-20150707082705', N'../mautran/MT-20150707082705/tran-thach-cao-phong-khach-03-09-2014.jpg', CAST(0x0000A4CE01512F54 AS DateTime), 0)
INSERT [dbo].[MATHANG] ([MAMATHANG], [MADANHMUC], [MOTA], [TENMATHANG], [DONVITINH], [GHICHU], [THUMUCHINH], [ANHDAIDIEN], [NGAYDANG], [DANHGIA]) VALUES (N'MT-20150707082949', N'nhahang-khachsan-bar', N'', N'Mẫu trần dành cho nhà hàng', N'Khong DVT', N'', N'MT-20150707082949', N'../mautran/MT-20150707082949/mau-tran-thach-cao-hanh-lang-sang-trong 006.jpg', CAST(0x0000A4CE015207FB AS DateTime), 0)
INSERT [dbo].[MATHANG] ([MAMATHANG], [MADANHMUC], [MOTA], [TENMATHANG], [DONVITINH], [GHICHU], [THUMUCHINH], [ANHDAIDIEN], [NGAYDANG], [DANHGIA]) VALUES (N'MT-20150707122518', N'tttm-vanphong', N'', N'Mẫu trần dành cho văn phòng', N'Khong DVT', N'', N'MT-20150707122518', N'../mautran/MT-20150707122518/Tran thach cao van phong 009.jpg', CAST(0x0000A4CE0009D546 AS DateTime), 0)
INSERT [dbo].[MATHANG] ([MAMATHANG], [MADANHMUC], [MOTA], [TENMATHANG], [DONVITINH], [GHICHU], [THUMUCHINH], [ANHDAIDIEN], [NGAYDANG], [DANHGIA]) VALUES (N'VT-20150706081649', N'_khungtran', N'<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px;"><span style="font-size:14px">OMEGA l&agrave; khung trần ch&igrave;m cao cấp của Vĩnh Tường, sử dụng để lắp đặt tại c&aacute;c vị tr&iacute; cần tải trọng cao v&agrave; diện t&iacute;ch lắp đặt lớn như trần kh&aacute;ch sạn, nh&agrave; h&agrave;ng, khu vực giải tr&iacute;,...Sản phẩm đ&atilde; được sử dụng tại The Venetian (Macau), Furama Villa (Đ&agrave; Nẵng),...</span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px;">&nbsp;</div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px;"><span style="font-size:14px">OMEGA c&oacute; c&aacute;c ưu điểm vượt trội:</span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px;"><span style="font-size:14px">- Linh động về khẩu độ thi c&ocirc;ng thanh ch&iacute;nh lẫn thanh phụ, th&iacute;ch hợp với c&aacute;c loại tấm kh&aacute;c nhau (v&iacute; dụ như cả tấm thạch cao ti&ecirc;u &acirc;m Gyptone&hellip;).</span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px;"><span style="font-size:14px">- C&oacute; cấu tạo gồm thanh ch&iacute;nh v&agrave; thanh phụ li&ecirc;n kết với nhau bằng kh&oacute;a li&ecirc;n kết đặc th&ugrave; d&agrave;nh ri&ecirc;ng cho sản phẩm n&agrave;y, gi&uacute;p gia tăng độ chịu tải cũng như độ bền hệ thống.</span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px;"><span style="font-size:14px">- Ph&ugrave; hợp cho cả trần nội thất v&agrave; ngoại thất</span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: center;"><span style="font-size:14px"><img alt="" src="http://localhost:2116/vattu/VT-20150706081649/hinhheomega-320x300px.jpg" /></span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: center;">&nbsp;</div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: center;"><img alt="" src="http://localhost:2116/vattu/VT-20150706081649/OMEGA-HeSPWatermark09Jun.JPG" style="height:236px; width:700px" /></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: center;"><img alt="" src="http://localhost:2116/vattu/VT-20150706081649/OMEGA-PhoiCanhTyDayWatermark09Jun.JPG" style="height:338px; width:600px" /></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: center;">&nbsp;</div>
', N'Khung trần nổi OMEGA', N'1', N'Được nhập khẩu từ Ý', N'VT-20150706081649', N'../vattu/VT-20150706081649/hinhheomega-320x300px.jpg', CAST(0x0000A4CD014F5EEE AS DateTime), 0)
INSERT [dbo].[MATHANG] ([MAMATHANG], [MADANHMUC], [MOTA], [TENMATHANG], [DONVITINH], [GHICHU], [THUMUCHINH], [ANHDAIDIEN], [NGAYDANG], [DANHGIA]) VALUES (N'VT-20150707090910', N'_tam', N'<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;"><span style="font-size:12.00119972229px"><strong>ấm Vĩnh Tường DECO Plus l&agrave; t&ecirc;n gọi để chỉ chung c&aacute;c loại tấm trang tr&iacute; IN LỤA NỔI VỚI SƠN LAU CH&Ugrave;I ĐƯỢC, c&oacute; nền thạch cao hoặc tấm cứng, c&oacute; m&agrave;u sắc mới v&agrave; nhận diện mới.</strong></span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;">&nbsp;</div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;"><strong>1. Đặc t&iacute;nh sản phẩm</strong></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;">&nbsp;</div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;"><span style="font-size:12.00119972229px"><strong>- Phủ sơn lau ch&ugrave;i được</strong></span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;"><span style="font-size:12.00119972229px">Tấm Vĩnh Tường DECO Plus được sơn bởi chất liệu ho&agrave;n to&agrave;n mới, lau ch&ugrave;i được, kh&ocirc;ng phai m&agrave;u v&agrave; được in nổi sắc n&eacute;t. T&iacute;nh năng ch&ugrave;i rửa được đ&atilde; được nghi&ecirc;n cứu v&agrave; kiểm tra tại Vĩnh Tường, cũng như đ&atilde; được lấy &yacute; kiến từ h&agrave;ng trăm nh&agrave; thầu, người thi c&ocirc;ng trong cả nước, l&agrave; t&iacute;nh năng được thị trường mong đợi</span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;"><span style="font-size:12.00119972229px"><strong>- M&agrave;u sắc mới</strong></span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;"><span style="font-size:12.00119972229px">Trong thời gian qua, bộ phận nghi&ecirc;n cứu sản phẩm đ&atilde; nghi&ecirc;n cứu m&agrave;u sơn được ưa th&iacute;ch nhất tr&ecirc;n thị trường để đưa v&agrave;o tấm trang tr&iacute; Vĩnh Tường DECO Plus v&agrave; đ&atilde; cho ra m&agrave;u sắc được ưa th&iacute;ch nhất tr&ecirc;n to&agrave;n quốc.</span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;"><span style="font-size:12.00119972229px"><strong>- Nền tấm mới, kh&ocirc;ng cong v&ecirc;nh</strong></span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;"><span style="font-size:12.00119972229px">Vĩnh Tường sẽ sử dụng tấm nền mới được nghi&ecirc;n cứu ph&ugrave; hợp với kh&iacute; hậu của Việt Nam. Tấm nền mới sẽ được sử dụng tr&ecirc;n 100% tấm trang tr&iacute; Vĩnh Tường DECO Plus , c&oacute; quy c&aacute;ch v&agrave; c&aacute;c đặc t&iacute;nh của sản phẩm kh&ocirc;ng thay đổi</span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;">&nbsp;</div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;"><span style="font-size:12.00119972229px"><strong>2. Quy c&aacute;ch sản phẩm</strong></span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;"><span style="font-size:12.00119972229px">K&iacute;ch thước: 605 x 605mm hoặc 605 x 1210mm</span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;"><span style="font-size:12.00119972229px">Nền: tấm cứng hoặc tấm thạch cao</span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;">&nbsp;</div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;"><span style="font-size:12.00119972229px"><strong>3. Nhận diện sản phẩm</strong></span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;"><span style="font-size:12.00119972229px"><strong>- Bao b&igrave;, đ&oacute;ng g&oacute;i:</strong></span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;"><span style="font-size:12.00119972229px">Viền bao b&igrave; bằng nilon m&agrave;u v&agrave;ng&nbsp;<strong>in chữ Vĩnh Tường &amp; ưu điểm Lau Ch&ugrave;i Được</strong>, 2 d&acirc;y đai Vĩnh Tường quấn 2 đầu kiện tấm.</span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;">&nbsp;</div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;"><span style="font-size:12.00119972229px">Đ&oacute;ng g&oacute;i 8 tấm/kiện với bất kỳ tấm trang tr&iacute; nền thạch cao Gyproc hay 10 tấm/kiện đối với tấm nền l&agrave; tấm cứng c&oacute; k&iacute;ch thước 605 x 1210mm</span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;">&nbsp;</div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: justify;"><span style="font-size:12.00119972229px">Đ&oacute;ng g&oacute;i 16 tấm/kiện đối với tấm 605 x 605mm</span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: center;"><span style="font-size:12.00119972229px"><img alt="" src="http://localhost:2116/vattu/VT-20150707090910/VTDECOPlus%20(1).png" style="height:235px; width:746px" /></span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: center;"><span style="font-size:12.00119972229px"><img alt="" src="http://localhost:2116/vattu/VT-20150707090910/InPhunSauTamDECOPlus-TamCung.JPG" style="height:525px; width:700px" /></span></div>

<div style="border: 0px; margin: 0px; padding: 0px; font-size: 12.00119972229px; font-family: arial; color: rgb(58, 58, 58); line-height: 16.8016796112061px; text-align: center;"><span style="font-size:12.00119972229px"><img alt="" src="http://localhost:2116/vattu/VT-20150707090910/VinhHoa.jpg" style="height:768px; width:768px" /></span></div>
', N'Tấm DECO', N'2', N'', N'VT-20150707090910', N'../vattu/VT-20150707090910/ChaoXuan.jpg', CAST(0x0000A4CE015D23B2 AS DateTime), 0)
INSERT [dbo].[MATHANG] ([MAMATHANG], [MADANHMUC], [MOTA], [TENMATHANG], [DONVITINH], [GHICHU], [THUMUCHINH], [ANHDAIDIEN], [NGAYDANG], [DANHGIA]) VALUES (N'VT-20150707091431', N'_phukien', N'<p><img alt="" src="http://localhost:2116/vattu/VT-20150707091431/Shadowline-PhoiCanh.jpg" style="height:296px; width:600px" /></p>

<p><span style="font-size:12px">Thanh Shadowline Vĩnh Tường với nguy&ecirc;n liệu nh&ocirc;m sơn tĩnh điện m&agrave;u trắng (hoặc kh&ocirc;ng sơn) được sử dụng thay thế thanh viền tường khung trần ch&igrave;m với nhiều ưu điểm vượt trội như:</span></p>

<p><br />
<span style="color:rgb(58, 58, 58); font-family:arial; font-size:12px">- T&iacute;nh thẩm mỹ cao&nbsp;<br />
- Dễ d&agrave;ng lắp đặt&nbsp;<br />
- Tạo khoảng c&aacute;ch với v&aacute;ch, gi&uacute;p hạn chế cong, &nbsp;v&otilde;ng nứt tại vị tr&iacute; li&ecirc;n kết giữa tường v&agrave; trần ở những khu vực c&oacute; độ rung lớn, hoặc ở khu vực trần rộng<br />
<br />
Thanh Shadowline Vĩnh Tường được sử dụng tại: Novotel (TP.HCM)</span></p>

<p><span style="color:rgb(58, 58, 58); font-family:arial; font-size:12px"><img alt="" src="http://localhost:2116/vattu/VT-20150707091431/ThanhShadowLINE-VinhTuong.JPG" style="height:267px; width:400px" /></span></p>

<p style="text-align: center;"><span style="color:rgb(58, 58, 58); font-family:arial; font-size:12px"><img alt="" src="http://localhost:2116/vattu/VT-20150707091431/Shadowline-Phoicanh1loptam9mm.jpg" style="height:283px; width:400px" /><img alt="" src="http://localhost:2116/vattu/VT-20150707091431/Shadowline-Phoicanh1loptam12.7mm.jpg" style="height:283px; width:400px" /></span></p>
', N'Thanh Shawline', N'3', N'', N'VT-20150707091431', N'../vattu/VT-20150707091431/Shadowline-PhoiCanh.jpg', CAST(0x0000A4CE015ECC5F AS DateTime), 0)
/****** Object:  Table [dbo].[DUAN]    Script Date: 08/15/2015 21:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DUAN](
	[MADUAN] [varchar](20) NOT NULL,
	[MANHANVIEN] [varchar](20) NULL,
	[MAKHACHHANG] [varchar](20) NULL,
	[TENDUAN] [nvarchar](200) NULL,
	[BOANH] [nvarchar](100) NULL,
	[NGAYKHOICONG] [datetime] NULL,
	[NGAYHOANTHANH] [datetime] NULL,
	[DIENTICH] [float] NULL,
	[DIACHI] [nvarchar](200) NULL,
	[MUCDOHOANTHANH] [nvarchar](20) NULL,
 CONSTRAINT [PK_DUAN] PRIMARY KEY CLUSTERED 
(
	[MADUAN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[DUAN] ([MADUAN], [MANHANVIEN], [MAKHACHHANG], [TENDUAN], [BOANH], [NGAYKHOICONG], [NGAYHOANTHANH], [DIENTICH], [DIACHI], [MUCDOHOANTHANH]) VALUES (N'DA-20150815045223', NULL, N'KH-20150815041443', N'Trần phòng tiếp tân khách sạn Century', N'DA-20150815045223', CAST(0x0000A3FA00000000 AS DateTime), CAST(0x0000A48C00000000 AS DateTime), 1000, N'Nguyễn Thái Bình, Quận 1', N'CHUA HOÀN THÀNH')
/****** Object:  StoredProcedure [dbo].[sp_getAll_Donvitinh]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getAll_Donvitinh]
as
	begin
		select *
		from DVT
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_getAll_Danhmuchang]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getAll_Danhmuchang]
as
	begin
		select *
		from DANHMUCHANG
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_getAll_Baiviet]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getAll_Baiviet]
as
	begin
		select *
		from BAIVIET
		order by NGAYDANG desc
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_Yeucau]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_delete_Yeucau]
@mayeucau varchar(20)
as
	begin
		delete from YEUCAU
		where MAYEUCAU = @mayeucau
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_Thacmac]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_delete_Thacmac]
@cauhoi nvarchar(200)
as
	begin
		delete THACMAC
		where CAUHOI = @cauhoi
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_delete_Baiviet]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_delete_Baiviet]
@mabaiviet nvarchar(50)
as
	begin
		delete 
		from BAIVIET
		where MABAIVIET = @mabaiviet
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_check_Nhanvien]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_check_Nhanvien]
@manhanvien varchar(20),
@matkhau nvarchar(200),
@chucvu nvarchar(100),
@trangthai nvarchar(50)
as
	begin
		select *
		from NHANVIEN
		where 
			MANHANVIEN = @manhanvien and
			MATKHAU = @matkhau and
			CHUCVU = @chucvu and
			TRANGTHAI = @trangthai
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_changeStatus_Yeucau]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_changeStatus_Yeucau]
@mayeucau varchar(20),
@tinhtrangmoi nvarchar(50)
as
	begin
		update YEUCAU
		set TRANGTHAI = @tinhtrangmoi
		where MAYEUCAU = @mayeucau
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_changepassword_Nhanvien]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_changepassword_Nhanvien]
@manhanvien varchar(20),
@matkhaucu nvarchar(200),
@matkhaumoi nvarchar(200)
as
	begin
		update NHANVIEN
		set MATKHAU = @matkhaumoi
		where MANHANVIEN = @manhanvien and MATKHAU=@matkhaucu
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_add_Yeucau]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_add_Yeucau]
@mayeucau varchar(20),
@hoten nvarchar(200),
@email nvarchar(200),
@diachithicong nvarchar(200),
@sodienthoai nvarchar(15),
@noidung ntext,
@ngaygui datetime

as
	begin
		insert into YEUCAU(MAYEUCAU, HOTEN, EMAIL, SODIENTHOAI, DIACHITHICONG, NOIDUNG, NGAYGUI)
		values(@mayeucau, @hoten, @email, @sodienthoai, @diachithicong, @noidung, @ngaygui)
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_add_Thacmac]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_add_Thacmac]
@cauhoi nvarchar(200),
@cautraloi ntext,
@ngaydang datetime
as
	begin
		insert into THACMAC
		values(@cauhoi, @cautraloi, @ngaydang)
	end
GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DONDATHANG](
	[MADONDATHANG] [varchar](20) NOT NULL,
	[MAKHACHHANG] [varchar](20) NULL,
	[MANHANVIEN] [varchar](20) NULL,
	[NGAYLAP] [datetime] NULL,
	[GHICHU] [ntext] NULL,
	[TIENCOC] [money] NULL,
	[TRANGTHAI] [nvarchar](100) NULL,
 CONSTRAINT [PK_DONDATHANG] PRIMARY KEY CLUSTERED 
(
	[MADONDATHANG] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_add_Khachhang]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_add_Khachhang]
@makhachhang varchar(20),
@tenkhachhang nvarchar(200),
@sodienthoai nvarchar(15),
@email nvarchar(200),
@diachi nvarchar(200)
as
	begin
		insert into KHACHHANG values(@makhachhang, @tenkhachhang, @sodienthoai, @email, @diachi)
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_getAll_Khachhang]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getAll_Khachhang]
as
	begin
		select *
		from KHACHHANG
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_getAll_Thacmac]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getAll_Thacmac]
as
	begin
		select *
		from THACMAC
		order by NGAYDANG desc
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_getAll_Yeucau]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_getAll_Yeucau]
@trangthai nvarchar(20)
as
	begin
		if(@trangthai = '')
			begin
				select *
				from YEUCAU
				order by NGAYGUI desc
			end
		else
			begin
				select *
				from YEUCAU
				where TRANGTHAI = @trangthai
				order by NGAYGUI desc
			end
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_getByID_Baiviet]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getByID_Baiviet]
@mabaiviet nvarchar(50)
as
	begin
		select *
		from BAIVIET
		where MABAIVIET = @mabaiviet
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_getByID_Yeucau]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getByID_Yeucau]
@mayeucau varchar(20)
as
	begin
		select *
		from YEUCAU
		where MAYEUCAU = @mayeucau
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_updatepassword_Nhanvien]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_updatepassword_Nhanvien]
@email nvarchar(200),
@matkhaumoi nvarchar(200)
as
	begin
		update NHANVIEN
		set MATKHAU = @matkhaumoi
		where EMAIL = @email
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_update_Baiviet]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_update_Baiviet]
@mabaiviet nvarchar(50),
@anhbaiviet nvarchar(100),
@noidung ntext
as
	begin
		update BAIVIET
		set ANHBAIVIET = @anhbaiviet,
			NOIDUNG = @noidung
		where MABAIVIET = @mabaiviet
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_add_Baiviet]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_add_Baiviet]
@mabaiviet nvarchar(50),
@tieude nvarchar(200),
@anhbaiviet nvarchar(100),
@noidung ntext,
@ngaydang datetime
as
	begin
		insert into BAIVIET
		values(@mabaiviet, @tieude, @anhbaiviet, @noidung, @ngaydang)
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_getTop_Baiviet]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getTop_Baiviet]
@soluong int
as
	begin
		select top (@soluong) *
		from BAIVIET
		order by NGAYDANG desc
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_getByType_Mautran]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getByType_Mautran]
@loaimautran nvarchar(100)
as
	begin
		select *
		from MATHANG
		where LOAIMAUTRAN = @loaimautran
		order by NGAYDANG desc
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_getByType_Mathang]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getByType_Mathang]
@madanhmuc varchar(20)
as
	begin
		select *
		from MATHANG
		where MADANHMUC = @madanhmuc
		order by NGAYDANG desc
	end
GO
/****** Object:  Table [dbo].[TONKHO]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TONKHO](
	[NAMTHANG] [varchar](20) NOT NULL,
	[NGAY] [int] NOT NULL,
	[MAMATHANG] [varchar](20) NOT NULL,
	[SLTON] [int] NULL,
	[SLTHUCTE] [int] NULL,
	[DONVITINH] [nvarchar](50) NULL,
 CONSTRAINT [PK_TONKHO] PRIMARY KEY CLUSTERED 
(
	[NAMTHANG] ASC,
	[NGAY] ASC,
	[MAMATHANG] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_setAlbum_Duan]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_setAlbum_Duan]
@maduan varchar(20)
as
	begin
		update DUAN
		set BOANH = @maduan
		where MADUAN = @maduan
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_getTop_Vattu]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getTop_Vattu]
@soluong int
as
	begin
		select top (@soluong) *
		from MATHANG
		where MAMATHANG like 'VT%'
		order by NGAYDANG desc
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_getTop_Mautran]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_getTop_Mautran]
@soluong int
as
	begin
		select top (@soluong) *
		from MATHANG
		where MAMATHANG like 'MT%'
		order by NGAYDANG desc
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_getTop_Duan]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_getTop_Duan]
as
	begin
		select top 6 *
		from DUAN
		order by NGAYHOANTHANH desc
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_getByID_Mathang]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getByID_Mathang]
@mamathang varchar(20)
as
	begin
		select *
		from MATHANG
		where MAMATHANG = @mamathang
		order by NGAYDANG desc
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_getById_Duan]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getById_Duan]
@maduan varchar(20)
as
	begin
		select *
		from DUAN inner join KHACHHANG
		on DUAN.MAKHACHHANG=KHACHHANG.MAKHACHHANG
		where MADUAN = @maduan
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_getByEmp_Duan]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_getByEmp_Duan]
as
	begin
		select MADUAN, TENDUAN
		from DUAN
		where BOANH is NULL
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_getAll_Vattu]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getAll_Vattu]
as
	begin
		select top 3 *
		from MATHANG
		where MADANHMUC = '_khungtran' 
		or MADANHMUC = '_khungvachngan' 
		or MADANHMUC = '_tam' 
		or MADANHMUC = '_phukien'
		order by NGAYDANG desc
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_getAll_Mautran]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_getAll_Mautran]
as
	begin
		select top 3 *
		from MATHANG
		where MADANHMUC = 'nhapho-chungcu' 
		or MADANHMUC = 'tttm-vanphong' 
		or MADANHMUC = 'nhahang-khachsan-bar' 
		or MADANHMUC = 'nhamay-xuong'
		or MADANHMUC = 'congtrinhkhac'
		order by NGAYDANG desc
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_getAll_Duan]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_getAll_Duan]
as
	begin
		select *
		from DUAN
		order by NGAYHOANTHANH desc
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_add_Duan]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_add_Duan]
@maduan varchar(20),
@tenduan nvarchar(200),
@makhachhang varchar(20),
@boanh nvarchar(100),
@ngaykhoicong datetime,
@ngayhoanthanh datetime,
@dientich float,
@diachi nvarchar(200)
as
	begin
		insert into DUAN(MADUAN, TENDUAN, MAKHACHHANG, BOANH, NGAYKHOICONG, NGAYHOANTHANH, DIENTICH, DIACHI)
		values(@maduan, @tenduan, @makhachhang, @boanh, @ngaykhoicong, @ngayhoanthanh, @dientich, @diachi)
	end
GO
/****** Object:  Table [dbo].[CHITIETDUAN]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHITIETDUAN](
	[MADUAN] [varchar](20) NOT NULL,
	[MAMATHANG] [varchar](20) NULL,
	[VITRITHICONG] [nvarchar](300) NULL,
 CONSTRAINT [PK_CTDU] PRIMARY KEY CLUSTERED 
(
	[MADUAN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHITIETDDH]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHITIETDDH](
	[MADONDATHANG] [varchar](20) NOT NULL,
	[MAMATHANG] [varchar](20) NOT NULL,
	[SOLUONGDAT] [int] NULL,
	[GIABAN] [money] NULL,
	[GIATHICONG] [money] NULL,
	[DONVITINH] [nvarchar](100) NULL,
 CONSTRAINT [PK_CHITIETDDH] PRIMARY KEY CLUSTERED 
(
	[MADONDATHANG] ASC,
	[MAMATHANG] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_add_Mathang]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_add_Mathang]
@mamathang varchar(20),
@madanhmuc varchar(20),
@mota ntext,
@tenmathang nvarchar(200),
@donvitinh nvarchar(50),
@ghichu ntext,
@thumuchinh nvarchar(100),
@anhdaidien nvarchar(200),
@ngaydang datetime,
@danhgia int
as
	begin
		insert into MATHANG
		values(@mamathang, @madanhmuc, @mota, @tenmathang, @donvitinh, @ghichu, @thumuchinh, @anhdaidien, @ngaydang, @danhgia)
	end
GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HOADON](
	[MAHOADON] [varchar](20) NOT NULL,
	[MADONDATHANG] [varchar](20) NULL,
	[MAKHACHHANG] [varchar](20) NULL,
	[MANHANVIEN] [varchar](20) NULL,
	[NGAYLAP] [datetime] NULL,
	[TIENDATHANHTOAN] [money] NULL,
	[GHICHU] [ntext] NULL,
 CONSTRAINT [PK_HOADON] PRIMARY KEY CLUSTERED 
(
	[MAHOADON] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HANGTRAVE]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HANGTRAVE](
	[MAMATHANG] [varchar](20) NOT NULL,
	[NGAYTRA] [datetime] NOT NULL,
	[MAKHACHHANG] [varchar](20) NOT NULL,
	[LYDOTRA] [ntext] NULL,
	[SOLUONGTRA] [int] NULL,
 CONSTRAINT [PK_HANGTRAVE] PRIMARY KEY CLUSTERED 
(
	[MAMATHANG] ASC,
	[NGAYTRA] ASC,
	[MAKHACHHANG] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DSGIA]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DSGIA](
	[MAGIA] [varchar](20) NOT NULL,
	[MAMATHANG] [varchar](20) NULL,
	[TENGIA] [nvarchar](200) NULL,
	[GIATRI] [money] NULL,
 CONSTRAINT [PK_DSGIA] PRIMARY KEY CLUSTERED 
(
	[MAGIA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHITIETHOADON]    Script Date: 08/15/2015 21:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHITIETHOADON](
	[MAHOADON] [varchar](20) NOT NULL,
	[MAMATHANG] [varchar](20) NOT NULL,
	[SOLUONGGIAO] [int] NULL,
	[GIA] [money] NULL,
	[DONVITINH] [nvarchar](100) NULL,
 CONSTRAINT [PK_CTHD] PRIMARY KEY CLUSTERED 
(
	[MAHOADON] ASC,
	[MAMATHANG] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Default [DF__YEUCAU__TRANGTHA__1A14E395]    Script Date: 08/15/2015 21:19:59 ******/
ALTER TABLE [dbo].[YEUCAU] ADD  CONSTRAINT [DF__YEUCAU__TRANGTHA__1A14E395]  DEFAULT (N'CHƯA DUYỆT') FOR [TRANGTHAI]
GO
/****** Object:  Default [DF__NHANVIEN__CHUCVU__014935CB]    Script Date: 08/15/2015 21:19:59 ******/
ALTER TABLE [dbo].[NHANVIEN] ADD  DEFAULT ('NHÂN VIÊN') FOR [CHUCVU]
GO
/****** Object:  Default [DF__NHANVIEN__TRANGT__023D5A04]    Script Date: 08/15/2015 21:19:59 ******/
ALTER TABLE [dbo].[NHANVIEN] ADD  DEFAULT ('ÐANG LÀM VI?C') FOR [TRANGTHAI]
GO
/****** Object:  Default [DF__MUCDOTHAN__TICHD__07020F21]    Script Date: 08/15/2015 21:19:59 ******/
ALTER TABLE [dbo].[MUCDOTHANTHIETCACNAM] ADD  DEFAULT ((0)) FOR [TICHDIEM]
GO
/****** Object:  Default [DF__MATHANG__DANHGIA__0CBAE877]    Script Date: 08/15/2015 21:19:59 ******/
ALTER TABLE [dbo].[MATHANG] ADD  CONSTRAINT [DF__MATHANG__DANHGIA__0CBAE877]  DEFAULT ((0)) FOR [DANHGIA]
GO
/****** Object:  Default [DF__DUAN__MUCDOHOANT__1367E606]    Script Date: 08/15/2015 21:19:59 ******/
ALTER TABLE [dbo].[DUAN] ADD  CONSTRAINT [DF__DUAN__MUCDOHOANT__1367E606]  DEFAULT ('CHUA HOÀN THÀNH') FOR [MUCDOHOANTHANH]
GO
/****** Object:  ForeignKey [FK_MDTTCN_KH]    Script Date: 08/15/2015 21:19:59 ******/
ALTER TABLE [dbo].[MUCDOTHANTHIETCACNAM]  WITH CHECK ADD  CONSTRAINT [FK_MDTTCN_KH] FOREIGN KEY([MAKHACHHANG])
REFERENCES [dbo].[KHACHHANG] ([MAKHACHHANG])
GO
ALTER TABLE [dbo].[MUCDOTHANTHIETCACNAM] CHECK CONSTRAINT [FK_MDTTCN_KH]
GO
/****** Object:  ForeignKey [FK_MH_DM]    Script Date: 08/15/2015 21:19:59 ******/
ALTER TABLE [dbo].[MATHANG]  WITH CHECK ADD  CONSTRAINT [FK_MH_DM] FOREIGN KEY([MADANHMUC])
REFERENCES [dbo].[DANHMUCHANG] ([MADANHMUC])
GO
ALTER TABLE [dbo].[MATHANG] CHECK CONSTRAINT [FK_MH_DM]
GO
/****** Object:  ForeignKey [FK__DUAN__MAKHACHHAN__6754599E]    Script Date: 08/15/2015 21:19:59 ******/
ALTER TABLE [dbo].[DUAN]  WITH CHECK ADD  CONSTRAINT [FK__DUAN__MAKHACHHAN__6754599E] FOREIGN KEY([MAKHACHHANG])
REFERENCES [dbo].[KHACHHANG] ([MAKHACHHANG])
GO
ALTER TABLE [dbo].[DUAN] CHECK CONSTRAINT [FK__DUAN__MAKHACHHAN__6754599E]
GO
/****** Object:  ForeignKey [FK_DUAN_KHACHHANG]    Script Date: 08/15/2015 21:19:59 ******/
ALTER TABLE [dbo].[DUAN]  WITH CHECK ADD  CONSTRAINT [FK_DUAN_KHACHHANG] FOREIGN KEY([MAKHACHHANG])
REFERENCES [dbo].[KHACHHANG] ([MAKHACHHANG])
GO
ALTER TABLE [dbo].[DUAN] CHECK CONSTRAINT [FK_DUAN_KHACHHANG]
GO
/****** Object:  ForeignKey [FK_DONDATHANG_KHACHHANG]    Script Date: 08/15/2015 21:20:11 ******/
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONDATHANG_KHACHHANG] FOREIGN KEY([MAKHACHHANG])
REFERENCES [dbo].[KHACHHANG] ([MAKHACHHANG])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DONDATHANG_KHACHHANG]
GO
/****** Object:  ForeignKey [FK_DONDATHANG_NHANVIEN]    Script Date: 08/15/2015 21:20:11 ******/
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONDATHANG_NHANVIEN] FOREIGN KEY([MANHANVIEN])
REFERENCES [dbo].[NHANVIEN] ([MANHANVIEN])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DONDATHANG_NHANVIEN]
GO
/****** Object:  ForeignKey [FK_TONKHO_MATHANG]    Script Date: 08/15/2015 21:20:11 ******/
ALTER TABLE [dbo].[TONKHO]  WITH CHECK ADD  CONSTRAINT [FK_TONKHO_MATHANG] FOREIGN KEY([MAMATHANG])
REFERENCES [dbo].[MATHANG] ([MAMATHANG])
GO
ALTER TABLE [dbo].[TONKHO] CHECK CONSTRAINT [FK_TONKHO_MATHANG]
GO
/****** Object:  ForeignKey [FK_CTDU_DUAN]    Script Date: 08/15/2015 21:20:11 ******/
ALTER TABLE [dbo].[CHITIETDUAN]  WITH CHECK ADD  CONSTRAINT [FK_CTDU_DUAN] FOREIGN KEY([MADUAN])
REFERENCES [dbo].[DUAN] ([MADUAN])
GO
ALTER TABLE [dbo].[CHITIETDUAN] CHECK CONSTRAINT [FK_CTDU_DUAN]
GO
/****** Object:  ForeignKey [FK_CTDDH_DONDATHANG]    Script Date: 08/15/2015 21:20:11 ******/
ALTER TABLE [dbo].[CHITIETDDH]  WITH CHECK ADD  CONSTRAINT [FK_CTDDH_DONDATHANG] FOREIGN KEY([MADONDATHANG])
REFERENCES [dbo].[DONDATHANG] ([MADONDATHANG])
GO
ALTER TABLE [dbo].[CHITIETDDH] CHECK CONSTRAINT [FK_CTDDH_DONDATHANG]
GO
/****** Object:  ForeignKey [FK_CTDDH_MATHANG]    Script Date: 08/15/2015 21:20:11 ******/
ALTER TABLE [dbo].[CHITIETDDH]  WITH CHECK ADD  CONSTRAINT [FK_CTDDH_MATHANG] FOREIGN KEY([MAMATHANG])
REFERENCES [dbo].[MATHANG] ([MAMATHANG])
GO
ALTER TABLE [dbo].[CHITIETDDH] CHECK CONSTRAINT [FK_CTDDH_MATHANG]
GO
/****** Object:  ForeignKey [FK_HD_DDH]    Script Date: 08/15/2015 21:20:11 ******/
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HD_DDH] FOREIGN KEY([MADONDATHANG])
REFERENCES [dbo].[DONDATHANG] ([MADONDATHANG])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HD_DDH]
GO
/****** Object:  ForeignKey [FK_HD_KH]    Script Date: 08/15/2015 21:20:11 ******/
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HD_KH] FOREIGN KEY([MAKHACHHANG])
REFERENCES [dbo].[KHACHHANG] ([MAKHACHHANG])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HD_KH]
GO
/****** Object:  ForeignKey [FK_HD_NHANVIEN]    Script Date: 08/15/2015 21:20:11 ******/
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HD_NHANVIEN] FOREIGN KEY([MANHANVIEN])
REFERENCES [dbo].[NHANVIEN] ([MANHANVIEN])
GO
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HD_NHANVIEN]
GO
/****** Object:  ForeignKey [FK_HANGTRAVE_KHACHHANG]    Script Date: 08/15/2015 21:20:11 ******/
ALTER TABLE [dbo].[HANGTRAVE]  WITH CHECK ADD  CONSTRAINT [FK_HANGTRAVE_KHACHHANG] FOREIGN KEY([MAKHACHHANG])
REFERENCES [dbo].[KHACHHANG] ([MAKHACHHANG])
GO
ALTER TABLE [dbo].[HANGTRAVE] CHECK CONSTRAINT [FK_HANGTRAVE_KHACHHANG]
GO
/****** Object:  ForeignKey [FK_HANGTRAVE_MATHANG]    Script Date: 08/15/2015 21:20:11 ******/
ALTER TABLE [dbo].[HANGTRAVE]  WITH CHECK ADD  CONSTRAINT [FK_HANGTRAVE_MATHANG] FOREIGN KEY([MAMATHANG])
REFERENCES [dbo].[MATHANG] ([MAMATHANG])
GO
ALTER TABLE [dbo].[HANGTRAVE] CHECK CONSTRAINT [FK_HANGTRAVE_MATHANG]
GO
/****** Object:  ForeignKey [FK_DSGIA_MATHANG]    Script Date: 08/15/2015 21:20:11 ******/
ALTER TABLE [dbo].[DSGIA]  WITH CHECK ADD  CONSTRAINT [FK_DSGIA_MATHANG] FOREIGN KEY([MAMATHANG])
REFERENCES [dbo].[MATHANG] ([MAMATHANG])
GO
ALTER TABLE [dbo].[DSGIA] CHECK CONSTRAINT [FK_DSGIA_MATHANG]
GO
/****** Object:  ForeignKey [FK_CTHD_HD]    Script Date: 08/15/2015 21:20:11 ******/
ALTER TABLE [dbo].[CHITIETHOADON]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_HD] FOREIGN KEY([MAHOADON])
REFERENCES [dbo].[HOADON] ([MAHOADON])
GO
ALTER TABLE [dbo].[CHITIETHOADON] CHECK CONSTRAINT [FK_CTHD_HD]
GO
/****** Object:  ForeignKey [FK_CTHD_MH]    Script Date: 08/15/2015 21:20:11 ******/
ALTER TABLE [dbo].[CHITIETHOADON]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_MH] FOREIGN KEY([MAMATHANG])
REFERENCES [dbo].[MATHANG] ([MAMATHANG])
GO
ALTER TABLE [dbo].[CHITIETHOADON] CHECK CONSTRAINT [FK_CTHD_MH]
GO
