USE [QLDSV_TC]
GO
/****** Object:  User [HTKN]    Script Date: 27/12/2024 10:33:15 CH ******/
CREATE USER [HTKN] FOR LOGIN [HTKN] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [MSmerge_69FD096BA62F4A4D92E257AC59D6F845]    Script Date: 27/12/2024 10:33:15 CH ******/
CREATE ROLE [MSmerge_69FD096BA62F4A4D92E257AC59D6F845]
GO
/****** Object:  DatabaseRole [MSmerge_ABB6A5D8443242A48179A62D349CF18D]    Script Date: 27/12/2024 10:33:15 CH ******/
CREATE ROLE [MSmerge_ABB6A5D8443242A48179A62D349CF18D]
GO
/****** Object:  DatabaseRole [MSmerge_E860D460260A4148B3151E96501B9551]    Script Date: 27/12/2024 10:33:15 CH ******/
CREATE ROLE [MSmerge_E860D460260A4148B3151E96501B9551]
GO
/****** Object:  DatabaseRole [MSmerge_PAL_role]    Script Date: 27/12/2024 10:33:15 CH ******/
CREATE ROLE [MSmerge_PAL_role]
GO
ALTER ROLE [db_owner] ADD MEMBER [HTKN]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_69FD096BA62F4A4D92E257AC59D6F845]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_ABB6A5D8443242A48179A62D349CF18D]
GO
ALTER ROLE [MSmerge_PAL_role] ADD MEMBER [MSmerge_E860D460260A4148B3151E96501B9551]
GO
/****** Object:  Schema [MSmerge_PAL_role]    Script Date: 27/12/2024 10:33:15 CH ******/
CREATE SCHEMA [MSmerge_PAL_role]
GO
/****** Object:  UserDefinedTableType [dbo].[DATA_TABLE_NHAP_DIEM]    Script Date: 27/12/2024 10:33:15 CH ******/
CREATE TYPE [dbo].[DATA_TABLE_NHAP_DIEM] AS TABLE(
	[MALTC] [int] NULL,
	[MASV] [nchar](10) NULL,
	[DIEM_CC] [int] NULL,
	[DIEM_GK] [float] NULL,
	[DIEM_CK] [float] NULL
)
GO
/****** Object:  Table [dbo].[LOPTINCHI]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOPTINCHI](
	[MALTC] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[NIENKHOA] [nchar](9) NOT NULL,
	[HOCKY] [int] NOT NULL,
	[MAMH] [nchar](10) NOT NULL,
	[NHOM] [int] NOT NULL,
	[MAGV] [nchar](10) NOT NULL,
	[MAKHOA] [nchar](10) NOT NULL,
	[SOSVTOITHIEU] [int] NOT NULL,
	[HUYLOP] [bit] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_LOPTINCHI] PRIMARY KEY CLUSTERED 
(
	[MALTC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_getAllLopTinChi]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[view_getAllLopTinChi]
AS select * from LOPTINCHI
GO
/****** Object:  Table [dbo].[LOP]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOP](
	[MALOP] [nchar](10) NOT NULL,
	[TENLOP] [nvarchar](50) NOT NULL,
	[KHOAHOC] [nchar](9) NOT NULL,
	[MAKHOA] [nchar](10) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_LOP] PRIMARY KEY CLUSTERED 
(
	[MALOP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_getAllLop]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[view_getAllLop]
AS select * from LOP
GO
/****** Object:  Table [dbo].[DANGKY]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANGKY](
	[MALTC] [int] NOT NULL,
	[MASV] [nchar](10) NOT NULL,
	[DIEM_CC] [int] NULL,
	[DIEM_GK] [float] NULL,
	[DIEM_CK] [float] NULL,
	[HUYDANGKY] [bit] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_DANGKY] PRIMARY KEY CLUSTERED 
(
	[MALTC] ASC,
	[MASV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_getAllDangKy]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[view_getAllDangKy]
AS select * from DANGKY
GO
/****** Object:  Table [dbo].[MONHOC]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MONHOC](
	[MAMH] [nchar](10) NOT NULL,
	[TENMH] [nvarchar](50) NOT NULL,
	[SOTIET_LT] [int] NOT NULL,
	[SOTIET_TH] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_MONHOC] PRIMARY KEY CLUSTERED 
(
	[MAMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_getAllMonHoc]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_getAllMonHoc]
as select * from MONHOC
GO
/****** Object:  View [dbo].[view_getNK]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[view_getNK]
as SELECT NIENKHOA FROM LOPTINCHI GROUP BY NIENKHOA
GO
/****** Object:  Table [dbo].[GIANGVIEN]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIANGVIEN](
	[MAGV] [nchar](10) NOT NULL,
	[MAKHOA] [nchar](10) NOT NULL,
	[HO] [nvarchar](50) NOT NULL,
	[TEN] [nvarchar](10) NOT NULL,
	[HOCVI] [nvarchar](20) NULL,
	[HOCHAM] [nvarchar](20) NULL,
	[CHUYENMON] [nvarchar](50) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_GIANGVIEN] PRIMARY KEY CLUSTERED 
(
	[MAGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_getAllGiangVien]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_getAllGiangVien] 
AS 
	SELECT * FROM GIANGVIEN;
GO
/****** Object:  Table [dbo].[CT_DONGHOCPHI]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_DONGHOCPHI](
	[MASV] [nchar](10) NOT NULL,
	[NIENKHOA] [nchar](9) NOT NULL,
	[HOCKY] [int] NOT NULL,
	[NGAYDONG] [date] NOT NULL,
	[SOTIENDONG] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_CT_DONGHOCPHI] PRIMARY KEY CLUSTERED 
(
	[MASV] ASC,
	[NIENKHOA] ASC,
	[HOCKY] ASC,
	[NGAYDONG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOCPHI]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOCPHI](
	[MASV] [nchar](10) NOT NULL,
	[NIENKHOA] [nchar](9) NOT NULL,
	[HOCKY] [int] NOT NULL,
	[HOCPHI] [int] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_HOCPHI] PRIMARY KEY CLUSTERED 
(
	[MASV] ASC,
	[NIENKHOA] ASC,
	[HOCKY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHOA]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHOA](
	[MAKHOA] [nchar](10) NOT NULL,
	[TENKHOA] [nvarchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_KHOA] PRIMARY KEY CLUSTERED 
(
	[MAKHOA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SINHVIEN]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SINHVIEN](
	[MASV] [nchar](10) NOT NULL,
	[HO] [nvarchar](50) NOT NULL,
	[TEN] [nvarchar](10) NOT NULL,
	[PHAI] [bit] NOT NULL,
	[DIACHI] [nvarchar](100) NULL,
	[NGAYSINH] [date] NULL,
	[MALOP] [nchar](10) NOT NULL,
	[DANGHIHOC] [bit] NOT NULL,
	[PASSWORD] [nvarchar](40) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
 CONSTRAINT [PK_SINHVIEN] PRIMARY KEY CLUSTERED 
(
	[MASV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CT_DONGHOCPHI] ([MASV], [NIENKHOA], [HOCKY], [NGAYDONG], [SOTIENDONG], [rowguid]) VALUES (N'N20DCCN126', N'2022-2023', 1, CAST(N'2023-05-28' AS Date), 12960000, N'1ae65155-78fd-ed11-ac7e-38d57a17f6cc')
INSERT [dbo].[CT_DONGHOCPHI] ([MASV], [NIENKHOA], [HOCKY], [NGAYDONG], [SOTIENDONG], [rowguid]) VALUES (N'N20DCCN126', N'2022-2023', 2, CAST(N'2023-05-28' AS Date), 1000000, N'07e7f9bf-78fd-ed11-ac7e-38d57a17f6cc')
INSERT [dbo].[CT_DONGHOCPHI] ([MASV], [NIENKHOA], [HOCKY], [NGAYDONG], [SOTIENDONG], [rowguid]) VALUES (N'N20DCCN126', N'2022-2023', 2, CAST(N'2023-05-29' AS Date), 500000, N'd0e4dab9-d3fd-ed11-ac7e-38d57a17f6cc')
GO
INSERT [dbo].[DANGKY] ([MALTC], [MASV], [DIEM_CC], [DIEM_GK], [DIEM_CK], [HUYDANGKY], [rowguid]) VALUES (1, N'N15DCCN001', 10, 10, 10, 0, N'd991fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[DANGKY] ([MALTC], [MASV], [DIEM_CC], [DIEM_GK], [DIEM_CK], [HUYDANGKY], [rowguid]) VALUES (1, N'N15DCCN002', 9, 9, 9, 0, N'da91fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[DANGKY] ([MALTC], [MASV], [DIEM_CC], [DIEM_GK], [DIEM_CK], [HUYDANGKY], [rowguid]) VALUES (1, N'N15DCCN003', 8, 8, 8, 0, N'db91fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[DANGKY] ([MALTC], [MASV], [DIEM_CC], [DIEM_GK], [DIEM_CK], [HUYDANGKY], [rowguid]) VALUES (1, N'N15DCCN005', 7, 7, 7, 0, N'dc91fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[DANGKY] ([MALTC], [MASV], [DIEM_CC], [DIEM_GK], [DIEM_CK], [HUYDANGKY], [rowguid]) VALUES (1, N'N15DCCN006', 0, 0, 0, 0, N'dd91fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[DANGKY] ([MALTC], [MASV], [DIEM_CC], [DIEM_GK], [DIEM_CK], [HUYDANGKY], [rowguid]) VALUES (3, N'N15DCCN001', 10, 10, 10, 0, N'de91fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[DANGKY] ([MALTC], [MASV], [DIEM_CC], [DIEM_GK], [DIEM_CK], [HUYDANGKY], [rowguid]) VALUES (3, N'N15DCCN002', 8, 8, 8, 0, N'df91fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[DANGKY] ([MALTC], [MASV], [DIEM_CC], [DIEM_GK], [DIEM_CK], [HUYDANGKY], [rowguid]) VALUES (3, N'N15DCCN003', 0, 0, 0, 0, N'e091fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[DANGKY] ([MALTC], [MASV], [DIEM_CC], [DIEM_GK], [DIEM_CK], [HUYDANGKY], [rowguid]) VALUES (3, N'N15DCCN004', 0, 0, 0, 0, N'e191fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[DANGKY] ([MALTC], [MASV], [DIEM_CC], [DIEM_GK], [DIEM_CK], [HUYDANGKY], [rowguid]) VALUES (3, N'N15DCCN005', 0, 0, 0, 0, N'e291fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[DANGKY] ([MALTC], [MASV], [DIEM_CC], [DIEM_GK], [DIEM_CK], [HUYDANGKY], [rowguid]) VALUES (2009, N'N20DCCN163', 0, 0, 0, 1, N'61cab553-90f5-ed11-ac7b-38d57a17f6cc')
INSERT [dbo].[DANGKY] ([MALTC], [MASV], [DIEM_CC], [DIEM_GK], [DIEM_CK], [HUYDANGKY], [rowguid]) VALUES (2010, N'N20DCCN126', 0, 0, 0, 1, N'a0474f42-8ff5-ed11-ac7b-38d57a17f6cc')
INSERT [dbo].[DANGKY] ([MALTC], [MASV], [DIEM_CC], [DIEM_GK], [DIEM_CK], [HUYDANGKY], [rowguid]) VALUES (2011, N'N20DCCN126', NULL, NULL, NULL, 0, N'7d638472-a407-ee11-ac80-38d57a17f6cc')
INSERT [dbo].[DANGKY] ([MALTC], [MASV], [DIEM_CC], [DIEM_GK], [DIEM_CK], [HUYDANGKY], [rowguid]) VALUES (2013, N'N20DCCN125', NULL, NULL, NULL, 0, N'6ca54a59-d1fb-ed11-ac7e-38d57a17f6cc')
INSERT [dbo].[DANGKY] ([MALTC], [MASV], [DIEM_CC], [DIEM_GK], [DIEM_CK], [HUYDANGKY], [rowguid]) VALUES (2013, N'N20DCCN126', NULL, NULL, NULL, 0, N'042a8e38-d2fb-ed11-ac7e-38d57a17f6cc')
INSERT [dbo].[DANGKY] ([MALTC], [MASV], [DIEM_CC], [DIEM_GK], [DIEM_CK], [HUYDANGKY], [rowguid]) VALUES (2017, N'N20DCCN126', NULL, NULL, NULL, 0, N'72264c25-fd07-ee11-ac80-38d57a17f6cc')
INSERT [dbo].[DANGKY] ([MALTC], [MASV], [DIEM_CC], [DIEM_GK], [DIEM_CK], [HUYDANGKY], [rowguid]) VALUES (2018, N'N20DCCN125', 10, 5, 5, 0, N'dc98d4be-fd07-ee11-ac80-38d57a17f6cc')
INSERT [dbo].[DANGKY] ([MALTC], [MASV], [DIEM_CC], [DIEM_GK], [DIEM_CK], [HUYDANGKY], [rowguid]) VALUES (2018, N'N20DCCN126', 10, 1, 0, 0, N'afb0ef2d-fd07-ee11-ac80-38d57a17f6cc')
INSERT [dbo].[DANGKY] ([MALTC], [MASV], [DIEM_CC], [DIEM_GK], [DIEM_CK], [HUYDANGKY], [rowguid]) VALUES (2018, N'N20DCCN161', 10, 10, 10, 0, N'213e355a-fd07-ee11-ac80-38d57a17f6cc')
GO
INSERT [dbo].[GIANGVIEN] ([MAGV], [MAKHOA], [HO], [TEN], [HOCVI], [HOCHAM], [CHUYENMON], [rowguid]) VALUES (N'GV01      ', N'CNTT      ', N'Lưu Nguyễn Kỳ', N'Thư', N'Thạc sĩ', N'', N'Phần mềm', N'b791fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[GIANGVIEN] ([MAGV], [MAKHOA], [HO], [TEN], [HOCVI], [HOCHAM], [CHUYENMON], [rowguid]) VALUES (N'GV02      ', N'CNTT      ', N'Lê Thành', N'Trì', N'Thạc sĩ', N'', N'Mạng máy tính', N'b891fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[GIANGVIEN] ([MAGV], [MAKHOA], [HO], [TEN], [HOCVI], [HOCHAM], [CHUYENMON], [rowguid]) VALUES (N'GV03      ', N'CNTT      ', N'Huỳnh Trung', N'Trụ', N'Thạc sĩ', N'', N'Web, Phần mềm', N'b991fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[GIANGVIEN] ([MAGV], [MAKHOA], [HO], [TEN], [HOCVI], [HOCHAM], [CHUYENMON], [rowguid]) VALUES (N'GV04      ', N'VT        ', N'Nguyễn Quốc', N'Minh', N'Tiến sĩ', N'', N'Truyền thông', N'ba91fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[GIANGVIEN] ([MAGV], [MAKHOA], [HO], [TEN], [HOCVI], [HOCHAM], [CHUYENMON], [rowguid]) VALUES (N'GV05      ', N'CNTT      ', N'Châu Minh', N'Lâm', N'Tiến sĩ', NULL, N'Xử lý ảnh', N'bb91fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[GIANGVIEN] ([MAGV], [MAKHOA], [HO], [TEN], [HOCVI], [HOCHAM], [CHUYENMON], [rowguid]) VALUES (N'GV06      ', N'CNTT      ', N'Nguyễn Văn', N'Sáu', N'Thạc Sĩ', NULL, N'Phần mềm', N'bc91fc93-5adf-ed11-ac60-38d57a17f6cc')
GO
INSERT [dbo].[HOCPHI] ([MASV], [NIENKHOA], [HOCKY], [HOCPHI], [rowguid]) VALUES (N'N15DCCN001', N'2022-2023', 2, 120000, N'a236bbc7-d0fb-ed11-ac7e-38d57a17f6cc')
INSERT [dbo].[HOCPHI] ([MASV], [NIENKHOA], [HOCKY], [HOCPHI], [rowguid]) VALUES (N'N20DCCN125', N'2022-2023', 2, 120000, N'b7e24f59-d1fb-ed11-ac7e-38d57a17f6cc')
INSERT [dbo].[HOCPHI] ([MASV], [NIENKHOA], [HOCKY], [HOCPHI], [rowguid]) VALUES (N'N20DCCN125', N'2022-2023', 3, 120000, N'40cadcbe-fd07-ee11-ac80-38d57a17f6cc')
INSERT [dbo].[HOCPHI] ([MASV], [NIENKHOA], [HOCKY], [HOCPHI], [rowguid]) VALUES (N'N20DCCN126', N'2022-2023', 1, 12960000, N'645a964f-dbfb-ed11-ac7e-38d57a17f6cc')
INSERT [dbo].[HOCPHI] ([MASV], [NIENKHOA], [HOCKY], [HOCPHI], [rowguid]) VALUES (N'N20DCCN126', N'2022-2023', 2, 12960000, N'e9803a1b-8ff5-ed11-ac7b-38d57a17f6cc')
INSERT [dbo].[HOCPHI] ([MASV], [NIENKHOA], [HOCKY], [HOCPHI], [rowguid]) VALUES (N'N20DCCN126', N'2022-2023', 3, 360000, N'20e72673-a407-ee11-ac80-38d57a17f6cc')
INSERT [dbo].[HOCPHI] ([MASV], [NIENKHOA], [HOCKY], [HOCPHI], [rowguid]) VALUES (N'N20DCCN126', N'2023-2024', 1, 12960000, N'5e4ae364-dbfb-ed11-ac7e-38d57a17f6cc')
INSERT [dbo].[HOCPHI] ([MASV], [NIENKHOA], [HOCKY], [HOCPHI], [rowguid]) VALUES (N'N20DCCN161', N'2022-2023', 3, 120000, N'97133c5a-fd07-ee11-ac80-38d57a17f6cc')
INSERT [dbo].[HOCPHI] ([MASV], [NIENKHOA], [HOCKY], [HOCPHI], [rowguid]) VALUES (N'N20DCCN163', N'2022-2023', 1, 11280000, N'f388ba7d-90f5-ed11-ac7b-38d57a17f6cc')
GO
INSERT [dbo].[KHOA] ([MAKHOA], [TENKHOA], [rowguid]) VALUES (N'CNTT      ', N'Công nghệ thông tin', N'ae91fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[KHOA] ([MAKHOA], [TENKHOA], [rowguid]) VALUES (N'VT        ', N'Viễn Thông', N'af91fc93-5adf-ed11-ac60-38d57a17f6cc')
GO
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [KHOAHOC], [MAKHOA], [rowguid]) VALUES (N'D15CQCP01 ', N'Công nghệ phần mềm 2015', N'2015-2019', N'CNTT      ', N'bd91fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [KHOAHOC], [MAKHOA], [rowguid]) VALUES (N'D15CQIS01 ', N'Hệ thống thông tin 2015', N'2015-2019', N'CNTT      ', N'be91fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [KHOAHOC], [MAKHOA], [rowguid]) VALUES (N'D15CQMT01 ', N'Mạng máy tính 2015', N'2015-2019', N'CNTT      ', N'bf91fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [KHOAHOC], [MAKHOA], [rowguid]) VALUES (N'D15CQVT01 ', N'Thông tin truyền thông 2015', N'2015-2019', N'VT        ', N'c091fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [KHOAHOC], [MAKHOA], [rowguid]) VALUES (N'D16CQCP01 ', N'Công nghệ phần mềm 2016', N'2016-2020', N'CNTT      ', N'c191fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [KHOAHOC], [MAKHOA], [rowguid]) VALUES (N'D16CQIS01 ', N'Hệ thống thông tin 2016', N'2016-2020', N'CNTT      ', N'c291fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [KHOAHOC], [MAKHOA], [rowguid]) VALUES (N'D16CQMT01 ', N'Mạng máy tính 2016', N'2016-2020', N'CNTT      ', N'c391fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [KHOAHOC], [MAKHOA], [rowguid]) VALUES (N'D16CQVT01 ', N'Thông tin truyền thông 2016', N'2016-2020', N'VT        ', N'c491fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [KHOAHOC], [MAKHOA], [rowguid]) VALUES (N'D20CQCN01 ', N'Công nghệ thông tin 2020', N'2020-2025', N'CNTT      ', N'7602bd75-cbf6-ed11-ac7b-38d57a17f6cc')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [KHOAHOC], [MAKHOA], [rowguid]) VALUES (N'D20CQCN02 ', N'Công nghệ thông tin 2020', N'2020-2025', N'CNTT      ', N'20928fc1-b4e9-ed11-ac78-38d57a17f6cc')
INSERT [dbo].[LOP] ([MALOP], [TENLOP], [KHOAHOC], [MAKHOA], [rowguid]) VALUES (N'D20CQVT01 ', N'Thông tin truyền thông 2020', N'2020-2025', N'VT        ', N'821b0e87-cbf6-ed11-ac7b-38d57a17f6cc')
GO
SET IDENTITY_INSERT [dbo].[LOPTINCHI] ON 

INSERT [dbo].[LOPTINCHI] ([MALTC], [NIENKHOA], [HOCKY], [MAMH], [NHOM], [MAGV], [MAKHOA], [SOSVTOITHIEU], [HUYLOP], [rowguid]) VALUES (1, N'2021-2022', 1, N'CTDL      ', 1, N'GV01      ', N'CNTT      ', 10, 0, N'd291fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[LOPTINCHI] ([MALTC], [NIENKHOA], [HOCKY], [MAMH], [NHOM], [MAGV], [MAKHOA], [SOSVTOITHIEU], [HUYLOP], [rowguid]) VALUES (2, N'2021-2022', 1, N'CTDL      ', 2, N'GV01      ', N'CNTT      ', 10, 0, N'd391fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[LOPTINCHI] ([MALTC], [NIENKHOA], [HOCKY], [MAMH], [NHOM], [MAGV], [MAKHOA], [SOSVTOITHIEU], [HUYLOP], [rowguid]) VALUES (3, N'2021-2022', 1, N'XLA       ', 1, N'GV03      ', N'CNTT      ', 10, 0, N'd591fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[LOPTINCHI] ([MALTC], [NIENKHOA], [HOCKY], [MAMH], [NHOM], [MAGV], [MAKHOA], [SOSVTOITHIEU], [HUYLOP], [rowguid]) VALUES (4, N'2021-2022', 1, N'CTDL      ', 3, N'GV04      ', N'VT        ', 10, 0, N'd491fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[LOPTINCHI] ([MALTC], [NIENKHOA], [HOCKY], [MAMH], [NHOM], [MAGV], [MAKHOA], [SOSVTOITHIEU], [HUYLOP], [rowguid]) VALUES (5, N'2021-2022', 2, N'LTW       ', 1, N'GV03      ', N'CNTT      ', 10, 0, N'd791fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[LOPTINCHI] ([MALTC], [NIENKHOA], [HOCKY], [MAMH], [NHOM], [MAGV], [MAKHOA], [SOSVTOITHIEU], [HUYLOP], [rowguid]) VALUES (6, N'2021-2022', 2, N'KTDH      ', 1, N'GV06      ', N'CNTT      ', 10, 0, N'd691fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[LOPTINCHI] ([MALTC], [NIENKHOA], [HOCKY], [MAMH], [NHOM], [MAGV], [MAKHOA], [SOSVTOITHIEU], [HUYLOP], [rowguid]) VALUES (8, N'2021-2022', 2, N'MMT       ', 1, N'GV02      ', N'CNTT      ', 10, 1, N'd891fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[LOPTINCHI] ([MALTC], [NIENKHOA], [HOCKY], [MAMH], [NHOM], [MAGV], [MAKHOA], [SOSVTOITHIEU], [HUYLOP], [rowguid]) VALUES (12, N'2022-2023', 1, N'MMT       ', 1, N'GV02      ', N'CNTT      ', 10, 1, N'275af14d-76f2-ed11-ac7a-38d57a17f6cc')
INSERT [dbo].[LOPTINCHI] ([MALTC], [NIENKHOA], [HOCKY], [MAMH], [NHOM], [MAGV], [MAKHOA], [SOSVTOITHIEU], [HUYLOP], [rowguid]) VALUES (2009, N'2022-2023', 1, N'CTDL      ', 2, N'GV01      ', N'CNTT      ', 10, 1, N'18598d2a-c5f4-ed11-ac7b-38d57a17f6cc')
INSERT [dbo].[LOPTINCHI] ([MALTC], [NIENKHOA], [HOCKY], [MAMH], [NHOM], [MAGV], [MAKHOA], [SOSVTOITHIEU], [HUYLOP], [rowguid]) VALUES (2010, N'2022-2023', 2, N'CTDL      ', 1, N'GV01      ', N'CNTT      ', 10, 1, N'd7e3b83f-c5f4-ed11-ac7b-38d57a17f6cc')
INSERT [dbo].[LOPTINCHI] ([MALTC], [NIENKHOA], [HOCKY], [MAMH], [NHOM], [MAGV], [MAKHOA], [SOSVTOITHIEU], [HUYLOP], [rowguid]) VALUES (2011, N'2022-2023', 3, N'CTDL      ', 1, N'GV01      ', N'CNTT      ', 10, 0, N'25464c14-81fb-ed11-ac7e-38d57a17f6cc')
INSERT [dbo].[LOPTINCHI] ([MALTC], [NIENKHOA], [HOCKY], [MAMH], [NHOM], [MAGV], [MAKHOA], [SOSVTOITHIEU], [HUYLOP], [rowguid]) VALUES (2012, N'2023-2024', 1, N'CTDL      ', 1, N'GV01      ', N'CNTT      ', 10, 0, N'bd0b292a-81fb-ed11-ac7e-38d57a17f6cc')
INSERT [dbo].[LOPTINCHI] ([MALTC], [NIENKHOA], [HOCKY], [MAMH], [NHOM], [MAGV], [MAKHOA], [SOSVTOITHIEU], [HUYLOP], [rowguid]) VALUES (2013, N'2022-2023', 2, N'HDH       ', 1, N'GV01      ', N'CNTT      ', 10, 0, N'610347b7-a1fb-ed11-ac7e-38d57a17f6cc')
INSERT [dbo].[LOPTINCHI] ([MALTC], [NIENKHOA], [HOCKY], [MAMH], [NHOM], [MAGV], [MAKHOA], [SOSVTOITHIEU], [HUYLOP], [rowguid]) VALUES (2014, N'2022-2023', 2, N'AV        ', 2, N'GV01      ', N'CNTT      ', 10, 0, N'ce3c1d09-d5fb-ed11-ac7e-38d57a17f6cc')
INSERT [dbo].[LOPTINCHI] ([MALTC], [NIENKHOA], [HOCKY], [MAMH], [NHOM], [MAGV], [MAKHOA], [SOSVTOITHIEU], [HUYLOP], [rowguid]) VALUES (2015, N'2022-2023', 2, N'HDH       ', 2, N'GV01      ', N'CNTT      ', 10, 0, N'75d02e2a-d5fb-ed11-ac7e-38d57a17f6cc')
INSERT [dbo].[LOPTINCHI] ([MALTC], [NIENKHOA], [HOCKY], [MAMH], [NHOM], [MAGV], [MAKHOA], [SOSVTOITHIEU], [HUYLOP], [rowguid]) VALUES (2017, N'2022-2023', 3, N'LTW       ', 1, N'GV01      ', N'CNTT      ', 10, 0, N'86a574ff-fc07-ee11-ac80-38d57a17f6cc')
INSERT [dbo].[LOPTINCHI] ([MALTC], [NIENKHOA], [HOCKY], [MAMH], [NHOM], [MAGV], [MAKHOA], [SOSVTOITHIEU], [HUYLOP], [rowguid]) VALUES (2018, N'2022-2023', 3, N'HDH       ', 1, N'GV01      ', N'CNTT      ', 10, 0, N'7f912610-fd07-ee11-ac80-38d57a17f6cc')
SET IDENTITY_INSERT [dbo].[LOPTINCHI] OFF
GO
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [SOTIET_LT], [SOTIET_TH], [rowguid]) VALUES (N'AV        ', N'Anh văn', 45, 0, N'b091fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [SOTIET_LT], [SOTIET_TH], [rowguid]) VALUES (N'CTDL      ', N'Cấu trúc dữ liệu & Giải thuật', 40, 5, N'b191fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [SOTIET_LT], [SOTIET_TH], [rowguid]) VALUES (N'HDH       ', N'Hệ điều hành', 45, 0, N'b291fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [SOTIET_LT], [SOTIET_TH], [rowguid]) VALUES (N'KTDH      ', N'Kỹ thuật đồ họa', 45, 1, N'b391fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [SOTIET_LT], [SOTIET_TH], [rowguid]) VALUES (N'LTW       ', N'Lập trình Web', 40, 5, N'b491fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [SOTIET_LT], [SOTIET_TH], [rowguid]) VALUES (N'MMT       ', N'Mạng máy tính', 30, 15, N'b591fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [SOTIET_LT], [SOTIET_TH], [rowguid]) VALUES (N'NMTTNT    ', N'Nhập môn trí tuệ nhân tạo', 45, 0, N'651d48ae-c5f3-ed11-ac7b-38d57a17f6cc')
INSERT [dbo].[MONHOC] ([MAMH], [TENMH], [SOTIET_LT], [SOTIET_TH], [rowguid]) VALUES (N'XLA       ', N'Xử lý ảnh', 30, 0, N'b691fc93-5adf-ed11-ac60-38d57a17f6cc')
GO
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N15DCCN001', N'Võ Văn', N'Đức', 0, N'Quận 9', CAST(N'1997-02-08' AS Date), N'D15CQCP01 ', 0, N'123', N'c591fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N15DCCN002', N'Lê Hữu', N'Tài', 0, N'Thủ Đức', CAST(N'1997-03-07' AS Date), N'D15CQCP01 ', 0, N'', N'c691fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N15DCCN003', N'Hoàng Thanh', N'Bùi', 0, N'Quận 9', CAST(N'1997-08-07' AS Date), N'D15CQCP01 ', 0, N'', N'c791fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N15DCCN004', N'Phạm', N'Tuấn', 0, N'Quận 9', CAST(N'1997-10-11' AS Date), N'D15CQCP01 ', 0, N'', N'c891fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N15DCCN005', N'Lê Thanh', N'Hà', 1, N'Quận 4', CAST(N'1997-08-29' AS Date), N'D15CQIS01 ', 0, N'', N'ca91fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N15DCCN006', N'Tiền Hà', N'Nam', 0, N'Thủ Đức', CAST(N'1997-10-09' AS Date), N'D15CQIS01 ', 0, N'', N'cb91fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N15DCCN007', N'Bùi Thị', N'Thanh', 1, N'Q.9', CAST(N'1997-07-07' AS Date), N'D15CQIS01 ', 0, N'', N'cc91fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N15DCCN008', N'Lê Thanh', N'Bình', 0, N'Thủ Đức', CAST(N'2096-07-07' AS Date), N'D15CQIS01 ', 0, N'', N'cd91fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N15DCVT001', N'Huỳnh Văn', N'Nghĩa', 0, N'Quận 9', CAST(N'1996-07-29' AS Date), N'D15CQVT01 ', 0, N'', N'ce91fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N15DCVT002', N'Nguyễn Anh', N'Tài', 0, N'Thủ Đức', CAST(N'1997-07-29' AS Date), N'D15CQVT01 ', 0, N'', N'cf91fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N15DCVT003', N'Phan', N'Tuấn', 0, N'Thủ Đức', CAST(N'1997-08-28' AS Date), N'D15CQVT01 ', 0, N'', N'd091fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N16DCCN001', N'Nguyễn Văn', N'A', 0, N'Quận 9', CAST(N'2002-05-10' AS Date), N'D16CQMT01 ', 0, N'123', N'354614a2-4bee-ed11-ac78-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N16DCCN124', N'Nguyễn Dương', N'Phi', 0, N'Quận 9', CAST(N'1994-01-01' AS Date), N'D16CQVT01 ', 1, N'123', N'2c99e132-45ee-ed11-ac78-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N16DCVT001', N'Trần Thanh', N'Phan', 1, N'Thủ Đức', CAST(N'1998-07-12' AS Date), N'D16CQVT01 ', 0, N'', N'd191fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N16DCVT002', N'Nguyễn Thanh', N'Hoàng', 0, N'Thủ Đức', CAST(N'1998-02-03' AS Date), N'D15CQCP01 ', 0, N'', N'c991fc93-5adf-ed11-ac60-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N16DCVT003', N'Trần Thanh', N'Hoàng', 1, N'Thủ Đức', CAST(N'1998-07-12' AS Date), N'D16CQVT01 ', 0, N'123', N'3938a4f4-49ee-ed11-ac78-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N16DCVT004', N'Trang Tuấn', N'Minh', 0, N'Tân Phú', CAST(N'1998-07-02' AS Date), N'D16CQVT01 ', 0, N'123', N'ad35f2b8-4aee-ed11-ac78-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N16DCVT005', N'Nguyễn Gia', N'Vinh', 0, N'Bình Tân', CAST(N'1998-07-02' AS Date), N'D16CQVT01 ', 0, N'123', N'e4d95717-4bee-ed11-ac78-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N16DCVT006', N'Nguyễn Quốc Khả', N'Phi', 1, N'Thủ Đức', CAST(N'2002-04-23' AS Date), N'D16CQVT01 ', 0, N'123', N'13c82a6d-4bee-ed11-ac78-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N20DCCN118', N'Trang Tuấn', N'Minh', 0, N'Tân Phú', CAST(N'2002-07-16' AS Date), N'D20CQCN02 ', 0, NULL, N'0322e7e1-bae9-ed11-ac78-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N20DCCN124', N'Nguyễn Dương', N'Phi', 1, N'Quận 9', CAST(N'2002-05-08' AS Date), N'D20CQCN02 ', 1, N'123', N'f49c30d2-47ee-ed11-ac78-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N20DCCN125', N'Nguyễn Quốc', N'Phi', 1, N'Quận 9', CAST(N'2002-05-09' AS Date), N'D20CQCN02 ', 0, N'123', N'7e7cd074-48ee-ed11-ac78-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N20DCCN126', N'Nguyễn Quốc Khả', N'Phi', 0, N'Thủ Đức', CAST(N'2002-04-23' AS Date), N'D20CQCN02 ', 0, N'123', N'c8ca76ce-b4e9-ed11-ac78-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N20DCCN161', N'Nguyễn Văn', N'Trường', 0, N'Bình Tân', CAST(N'2002-01-01' AS Date), N'D20CQCN02 ', 0, N'123', N'6b2245a2-59ed-ed11-ac78-38d57a17f6cc')
INSERT [dbo].[SINHVIEN] ([MASV], [HO], [TEN], [PHAI], [DIACHI], [NGAYSINH], [MALOP], [DANGHIHOC], [PASSWORD], [rowguid]) VALUES (N'N20DCCN163', N'Nguyễn Gia', N'Vinh', 0, N'Bình Tân', CAST(N'2002-06-27' AS Date), N'D20CQCN02 ', 0, N'123', N'f07db438-bae9-ed11-ac78-38d57a17f6cc')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_DANGKY]    Script Date: 27/12/2024 10:33:15 CH ******/
ALTER TABLE [dbo].[DANGKY] ADD  CONSTRAINT [UK_DANGKY] UNIQUE NONCLUSTERED 
(
	[MALTC] ASC,
	[MASV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_LOPTINCHI]    Script Date: 27/12/2024 10:33:15 CH ******/
ALTER TABLE [dbo].[LOPTINCHI] ADD  CONSTRAINT [UK_LOPTINCHI] UNIQUE NONCLUSTERED 
(
	[NIENKHOA] ASC,
	[HOCKY] ASC,
	[MAMH] ASC,
	[NHOM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CT_DONGHOCPHI] ADD  CONSTRAINT [DF_CT_DONGHOCPHI_NGAYDONG]  DEFAULT (getdate()) FOR [NGAYDONG]
GO
ALTER TABLE [dbo].[CT_DONGHOCPHI] ADD  CONSTRAINT [MSmerge_df_rowguid_3C535EA506804F81A6F0DCD00898B96E]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[DANGKY] ADD  CONSTRAINT [MSmerge_df_rowguid_3E3927BE624F48BC80081AC7147C4E9A]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[GIANGVIEN] ADD  CONSTRAINT [MSmerge_df_rowguid_D51AD62C5B794EE4A02BDCECAB4FE50F]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[HOCPHI] ADD  CONSTRAINT [DF_HOCPHI_HOCKY]  DEFAULT ((1)) FOR [HOCKY]
GO
ALTER TABLE [dbo].[HOCPHI] ADD  CONSTRAINT [DF_HOCPHI_HOCPHI]  DEFAULT ((6000000)) FOR [HOCPHI]
GO
ALTER TABLE [dbo].[HOCPHI] ADD  CONSTRAINT [MSmerge_df_rowguid_A583A3B94C164E619C7858A001189A12]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[KHOA] ADD  CONSTRAINT [MSmerge_df_rowguid_219D93E13B8944C68949441ED3261C29]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[LOP] ADD  CONSTRAINT [MSmerge_df_rowguid_F950E0F6701643279A176B662D7131E5]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[LOPTINCHI] ADD  CONSTRAINT [DF_LOPTINCHI_HUYLOP]  DEFAULT ('false') FOR [HUYLOP]
GO
ALTER TABLE [dbo].[LOPTINCHI] ADD  CONSTRAINT [MSmerge_df_rowguid_DC68BCAD7793468AAB3F8AC93FA49499]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[MONHOC] ADD  CONSTRAINT [MSmerge_df_rowguid_E56952ECDF7E48358BBEC58A64896E31]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[SINHVIEN] ADD  CONSTRAINT [DF_SINHVIEN_PHAI]  DEFAULT ('false') FOR [PHAI]
GO
ALTER TABLE [dbo].[SINHVIEN] ADD  CONSTRAINT [DF_SINHVIEN_DANGHIHOC]  DEFAULT ('false') FOR [DANGHIHOC]
GO
ALTER TABLE [dbo].[SINHVIEN] ADD  CONSTRAINT [DF_SINHVIEN_PASSWORD]  DEFAULT ('') FOR [PASSWORD]
GO
ALTER TABLE [dbo].[SINHVIEN] ADD  CONSTRAINT [MSmerge_df_rowguid_2F78E97E40BB407D8C7BC5B023DF01F8]  DEFAULT (newsequentialid()) FOR [rowguid]
GO
ALTER TABLE [dbo].[CT_DONGHOCPHI]  WITH CHECK ADD  CONSTRAINT [FK_CT_DONGHOCPHI_HOCPHI] FOREIGN KEY([MASV], [NIENKHOA], [HOCKY])
REFERENCES [dbo].[HOCPHI] ([MASV], [NIENKHOA], [HOCKY])
GO
ALTER TABLE [dbo].[CT_DONGHOCPHI] CHECK CONSTRAINT [FK_CT_DONGHOCPHI_HOCPHI]
GO
ALTER TABLE [dbo].[DANGKY]  WITH CHECK ADD  CONSTRAINT [FK_CTLTC_SINHVIEN] FOREIGN KEY([MASV])
REFERENCES [dbo].[SINHVIEN] ([MASV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DANGKY] CHECK CONSTRAINT [FK_CTLTC_SINHVIEN]
GO
ALTER TABLE [dbo].[DANGKY]  WITH CHECK ADD  CONSTRAINT [FK_DANGKY_LOPTINCHI] FOREIGN KEY([MALTC])
REFERENCES [dbo].[LOPTINCHI] ([MALTC])
GO
ALTER TABLE [dbo].[DANGKY] CHECK CONSTRAINT [FK_DANGKY_LOPTINCHI]
GO
ALTER TABLE [dbo].[GIANGVIEN]  WITH CHECK ADD  CONSTRAINT [FK_GIANGVIEN_KHOA] FOREIGN KEY([MAKHOA])
REFERENCES [dbo].[KHOA] ([MAKHOA])
GO
ALTER TABLE [dbo].[GIANGVIEN] CHECK CONSTRAINT [FK_GIANGVIEN_KHOA]
GO
ALTER TABLE [dbo].[HOCPHI]  WITH CHECK ADD  CONSTRAINT [FK_HOCPHI_SINHVIEN] FOREIGN KEY([MASV])
REFERENCES [dbo].[SINHVIEN] ([MASV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HOCPHI] CHECK CONSTRAINT [FK_HOCPHI_SINHVIEN]
GO
ALTER TABLE [dbo].[LOP]  WITH CHECK ADD  CONSTRAINT [FK_LOP_KHOA] FOREIGN KEY([MAKHOA])
REFERENCES [dbo].[KHOA] ([MAKHOA])
GO
ALTER TABLE [dbo].[LOP] CHECK CONSTRAINT [FK_LOP_KHOA]
GO
ALTER TABLE [dbo].[LOPTINCHI]  WITH CHECK ADD  CONSTRAINT [FK_LOPTINCHI_GIANGVIEN] FOREIGN KEY([MAGV])
REFERENCES [dbo].[GIANGVIEN] ([MAGV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LOPTINCHI] CHECK CONSTRAINT [FK_LOPTINCHI_GIANGVIEN]
GO
ALTER TABLE [dbo].[LOPTINCHI]  WITH CHECK ADD  CONSTRAINT [FK_LOPTINCHI_KHOA] FOREIGN KEY([MAKHOA])
REFERENCES [dbo].[KHOA] ([MAKHOA])
GO
ALTER TABLE [dbo].[LOPTINCHI] CHECK CONSTRAINT [FK_LOPTINCHI_KHOA]
GO
ALTER TABLE [dbo].[LOPTINCHI]  WITH CHECK ADD  CONSTRAINT [FK_LOPTINCHI_MONHOC] FOREIGN KEY([MAMH])
REFERENCES [dbo].[MONHOC] ([MAMH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[LOPTINCHI] CHECK CONSTRAINT [FK_LOPTINCHI_MONHOC]
GO
ALTER TABLE [dbo].[SINHVIEN]  WITH CHECK ADD  CONSTRAINT [FK_SINHVIEN_LOP] FOREIGN KEY([MALOP])
REFERENCES [dbo].[LOP] ([MALOP])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SINHVIEN] CHECK CONSTRAINT [FK_SINHVIEN_LOP]
GO
ALTER TABLE [dbo].[CT_DONGHOCPHI]  WITH CHECK ADD  CONSTRAINT [CK_SOTIENDONG] CHECK  (([SOTIENDONG]>(0)))
GO
ALTER TABLE [dbo].[CT_DONGHOCPHI] CHECK CONSTRAINT [CK_SOTIENDONG]
GO
ALTER TABLE [dbo].[HOCPHI]  WITH CHECK ADD  CONSTRAINT [CK_HOCKY] CHECK  (([HOCKY]>=(1) AND [HOCKY]<=(4)))
GO
ALTER TABLE [dbo].[HOCPHI] CHECK CONSTRAINT [CK_HOCKY]
GO
ALTER TABLE [dbo].[HOCPHI]  WITH CHECK ADD  CONSTRAINT [CK_HOCPHI] CHECK  (([HOCPHI]>(0)))
GO
ALTER TABLE [dbo].[HOCPHI] CHECK CONSTRAINT [CK_HOCPHI]
GO
ALTER TABLE [dbo].[LOPTINCHI]  WITH CHECK ADD  CONSTRAINT [CK_SOSVTOITHIEU] CHECK  (([SOSVTOITHIEU]>(0)))
GO
ALTER TABLE [dbo].[LOPTINCHI] CHECK CONSTRAINT [CK_SOSVTOITHIEU]
GO
ALTER TABLE [dbo].[LOPTINCHI]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_6B63960F_30E7_4EF7_B40B_AF2313E33DF7] CHECK NOT FOR REPLICATION (([MALTC]>(8) AND [MALTC]<=(1008) OR [MALTC]>(1008) AND [MALTC]<=(2008)))
GO
ALTER TABLE [dbo].[LOPTINCHI] CHECK CONSTRAINT [repl_identity_range_6B63960F_30E7_4EF7_B40B_AF2313E33DF7]
GO
/****** Object:  StoredProcedure [dbo].[sp_addlogin_custom]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_addlogin_custom]
    @loginame		sysname
   ,@passwd         sysname = Null
   ,@defdb          sysname = 'master'      -- UNDONE: DEFAULT CONFIGURABLE???
   ,@deflanguage    sysname = Null
   ,@sid			varbinary(16) = Null
   ,@encryptopt		varchar(20) = Null
AS
    -- SETUP RUNTIME OPTIONS / DECLARE VARIABLES --
	set nocount on
	declare @exec_stmt nvarchar(4000)
	declare @hextext varchar(256)
	declare @ret int

    -- DISALLOW USER TRANSACTION --
	set implicit_transactions off
	IF (@@trancount > 0)
	begin
		raiserror(15002,-1,-1,'sys.sp_addlogin')
		return (1)
	end

    -- VALIDATE LOGIN NAME:
	execute @ret = sys.sp_validname @loginame
	if (@ret <> 0)
        return (1)

	set @exec_stmt = 'create login ' + quotename(@loginame)

    if @passwd is null
        select @passwd = ''

	if (@encryptopt is null)
		set @exec_stmt = @exec_stmt + ' with password = ' + quotename(@passwd, '''')
	else
	begin
		declare @passwdbin varbinary(256)
		set @passwdbin = convert(varbinary(256), @passwd)
		execute sys.sp_hexadecimal @passwdbin, @hextext OUT
		set @exec_stmt = @exec_stmt + ' with password = ' + @hextext

		if (@encryptopt = 'skip_encryption_old')
			set @exec_stmt = @exec_stmt + ' hashed '
		else if (@encryptopt = 'skip_encryption')
			set @exec_stmt = @exec_stmt + ' hashed '
		else
		begin
			raiserror(15600,-1,-1,'sys.sp_addlogin')
			return 1
		end
	end
	
    if (@defdb is not null)
		set @exec_stmt = @exec_stmt + ', default_database = ' + quotename(@defdb)

	if (@deflanguage is not null)
		set @exec_stmt = @exec_stmt + ', default_language = ' + quotename(@deflanguage)

	if (@sid is not null)
	begin
		execute sys.sp_hexadecimal @sid, @hextext OUT
		set @exec_stmt = @exec_stmt + ', sid = ' + @hextext
	end

	set @exec_stmt = @exec_stmt + ', CHECK_EXPIRATION = OFF;'

	exec (@exec_stmt)
	
	DECLARE @SQL NVARCHAR(MAX);

	SET @SQL = N'ALTER LOGIN ' + QUOTENAME(@loginame) + N' WITH PASSWORD = ' + QUOTENAME(@passwd, '''') + N';';

	EXEC (@SQL);

	if @@error <> 0
		return (1)

    -- RETURN SUCCESS --
	return  (0)	-- sp_addlogin
GO
/****** Object:  StoredProcedure [dbo].[sp_addSinhVien]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_addSinhVien] (@MASV NCHAR(10), @HO NVARCHAR(50), @TEN NVARCHAR(10), @PHAI BIT, @DIACHI NVARCHAR(100), @NGAYSINH CHAR(12), @MALOP NCHAR(10), @DANGHIHOC BIT, @PASSWORD NVARCHAR(40))
AS
	INSERT INTO QLDSV_TC.DBO.SINHVIEN (MASV, HO, TEN, PHAI, DIACHI, NGAYSINH, MALOP, DANGHIHOC, PASSWORD)
	VALUES (@MASV, @HO, @TEN, @PHAI, @DIACHI, @NGAYSINH, @MALOP, @DANGHIHOC, @PASSWORD);
GO
/****** Object:  StoredProcedure [dbo].[SP_BDSV_NK_HK]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_BDSV_NK_HK]
@MASV NCHAR(10),
@NIENKHOA NCHAR(9),
@HOCKY INT
AS
BEGIN
	SELECT MH.TENMH, ISNULL(DK.DIEM_CC, 0) AS DIEM_CC, ISNULL(DK.DIEM_GK, 0) AS DIEM_GK, ISNULL(DK.DIEM_CK, 0) AS DIEM_CK, DIEM = ISNULL(MAX(0.1 * DK.DIEM_CC + 0.3 * DIEM_GK + 0.6 * DIEM_CK), 0)
    FROM (SELECT MALTC, MASV, DIEM_CC, DIEM_GK, DIEM_CK FROM DANGKY WHERE MASV = @MASV) DK
    INNER JOIN (SELECT MALTC, MAMH, NIENKHOA, HOCKY FROM LOPTINCHI) LTC 
	ON LTC.MALTC = DK.MALTC AND LTC.NIENKHOA = @NIENKHOA AND LTC.HOCKY = @HOCKY
    INNER JOIN (SELECT MAMH, TENMH FROM MONHOC) MH ON MH.MAMH = LTC.MAMH
    GROUP BY MH.TENMH, DK.DIEM_CC, DK.DIEM_GK, DK.DIEM_CK
    ORDER BY MH.TENMH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CHECKLOPTINCHI]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[SP_CHECKLOPTINCHI] @MALTC INT
AS 
	IF EXISTS(SELECT MALTC FROM LOPTINCHI WHERE MALTC = @MALTC)
	RETURN 1
	ELSE
	RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[SP_CHECKMA]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CHECKMA] @MA NCHAR(10) , @LOAI NCHAR(10)
AS 
BEGIN
	IF(@LOAI = 'SINHVIEN')
	BEGIN
		IF EXISTS(SELECT 1 FROM QLDSV_TC.DBO.SINHVIEN WHERE MASV = @MA)
			RETURN 1
		ELSE
			RETURN 0
	END
	IF(@LOAI ='LOP')
	BEGIN
		IF(EXISTS(SELECT 1 FROM QLDSV_TC.DBO.LOP WHERE MALOP = @MA))
			RETURN 1
		ELSE
			RETURN 0
	END
	IF(@LOAI ='MONHOC')
	BEGIN
		IF(EXISTS(SELECT 1 FROM QLDSV_TC.DBO.MONHOC WHERE MAMH = @MA))
			RETURN 1
		ELSE
			RETURN 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CHECKTEN]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_CHECKTEN] 
@MA NCHAR(10),
@LOAI NCHAR(10),
@TEN NVARCHAR(50)
AS
BEGIN
	IF(@LOAI = 'LOP')
	BEGIN
		IF EXISTS (SELECT 1 FROM QLDSV_TC.DBO.LOP WHERE MALOP != @MA AND UPPER(TENLOP) = UPPER(@TEN))
			RETURN 1
		RETURN 0
	END
	IF(@LOAI = 'MONHOC')
	BEGIN
		IF EXISTS (SELECT 1 FROM QLDSV_TC.DBO.MONHOC WHERE MAMH != @MA AND UPPER(TENMH) = UPPER(@TEN))
			RETURN 1
		RETURN 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CHINHSUALTC]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CHINHSUALTC]
@MALTC INT,
@NIENKHOA NCHAR(9),
@HOCKY INT,
@MAMH NCHAR(10),
@NHOM INT,
@SOSVTOITHIEU INT,
@HUYLOP BIT,
@CHIPHI INT
AS
BEGIN
	SET XACT_ABORT ON 
    BEGIN DISTRIBUTED TRANSACTION;
	IF EXISTS (SELECT MALTC FROM LOPTINCHI WHERE MALTC = @MALTC)
		BEGIN
			UPDATE LOPTINCHI 
			SET NIENKHOA = @NIENKHOA,
			HOCKY = @HOCKY,
			MAMH = @MAMH,
			NHOM = @NHOM,
			SOSVTOITHIEU = @SOSVTOITHIEU,
			HUYLOP = @HUYLOP
			WHERE MALTC = @MALTC
			IF @HUYLOP = 1 
				BEGIN
					DECLARE @TONGTIET INT
					SELECT @TONGTIET = MH.SOTIET_LT + MH.SOTIET_TH
					FROM (SELECT MAMH FROM LOPTINCHI WHERE MALTC = @MALTC) LTC, MONHOC MH 
					WHERE LTC.MAMH = MH.MAMH


					SELECT NIENKHOA, HOCKY, MASV 
					INTO #BANG_CTDK
					FROM (SELECT MALTC, NIENKHOA, HOCKY FROM LOPTINCHI) AS LTC, 
					(SELECT MALTC, MASV FROM DANGKY) AS DK 
					WHERE LTC.MALTC = @MALTC AND LTC.MALTC = DK.MALTC

					UPDATE DANGKY SET HUYDANGKY = 1 WHERE MALTC = @MALTC
					
					UPDATE HOCPHI SET HOCPHI.HOCPHI  = IIF(HOCPHI.HOCPHI - ((@TONGTIET/15) * @CHIPHI) <= 1, 1, HOCPHI.HOCPHI - (@TONGTIET/15) * @CHIPHI)
					FROM HOCPHI , #BANG_CTDK
					WHERE HOCPHI.MASV = #BANG_CTDK.MASV AND HOCPHI.NIENKHOA = #BANG_CTDK.NIENKHOA AND HOCPHI.HOCKY = #BANG_CTDK.HOCKY
				END
		END
	ELSE
		RAISERROR ('Không tìm thấy lớp tín chỉ', 16, 1)
	COMMIT TRANSACTION;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CHINHSUAMH]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CHINHSUAMH]
@MAMH NCHAR(10),
@TENMH NVARCHAR(50),
@SOTIET_LT INT,
@SOTIET_TH INT
AS
BEGIN
        IF EXISTS(SELECT MAMH FROM MONHOC WHERE MAMH = @MAMH)
            UPDATE MONHOC 
            SET 
            TENMH = @TENMH,
            SOTIET_LT = @SOTIET_LT,
            SOTIET_TH = @SOTIET_TH
            WHERE MAMH = @MAMH
    ELSE 
        RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CHINHSUASV]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CHINHSUASV]
@MASV NCHAR(10),
@HO NVARCHAR(50),
@TEN NVARCHAR(10),
@PHAI BIT,
@DIACHI NVARCHAR(100),
@NGAYSINH DATE,
@PASSWORD NVARCHAR(40)
AS
BEGIN
    IF EXISTS(SELECT MASV FROM SINHVIEN WHERE MASV = @MASV AND DANGHIHOC = 0) 
        UPDATE SINHVIEN 
        SET 
        HO = @HO, 
        TEN = @TEN, 
        PHAI = @PHAI, 
        DIACHI = @DIACHI, 
        NGAYSINH = @NGAYSINH,
        PASSWORD = @PASSWORD
        WHERE MASV = @MASV 
    ELSE 
        BEGIN
            RAISERROR ('Không tìm thấy sinh viên', 16, 1)
        END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_dbRolesUsersMap]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_dbRolesUsersMap] (@dbRole SYSNAME = '%', @username1 nvarchar(10))
AS
SELECT 
    DB_NAME() as DB_Name,
    User_Type = 
    CASE mmbrp.[type] 
    WHEN 'G' THEN 'Windows Group' 
    WHEN 'S' THEN 'SQL User' 
    WHEN 'U' THEN 'Windows User' 
    END,
    Database_User_Name = mmbrp.[name],
    Login_Name = ul.[name],
    DB_Role = rolp.[name]
FROM 
    sys.database_role_members mmbr, -- The Role OR members associations table
    sys.database_principals rolp,     -- The DB Roles names table
    sys.database_principals mmbrp,    -- The Role members table (database users)
    sys.server_principals ul          -- The Login accounts table
WHERE 
    Upper(mmbrp.[type]) IN ( 'S', 'U', 'G' )
    -- No need for these system account types
    AND Upper (mmbrp.[name]) NOT IN ('SYS','INFORMATION_SCHEMA')
    AND rolp.[principal_id] = mmbr.[role_principal_id]
    AND mmbrp.[principal_id] = mmbr.[member_principal_id]
    AND ul.[sid] = mmbrp.[sid]
    AND rolp.[name] LIKE '%' + @dbRole + '%'
	AND ul.[name] = @username1
GO
/****** Object:  StoredProcedure [dbo].[SP_DKY_LOPTINCHI]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DKY_LOPTINCHI]
	@MALTC INT,
	@NIENKHOA NCHAR(9),
	@HOCKY INT,
	@MAMH NCHAR(10),
	@MASV NCHAR(10), 
	@CHIPHI INT
AS
BEGIN
	IF EXISTS(SELECT 1 FROM (SELECT MALTC FROM DANGKY WHERE MASV=@MASV) DK, 
							(SELECT MALTC FROM LOPTINCHI WHERE MAMH=@MAMH AND NIENKHOA=@NIENKHOA AND HOCKY=@HOCKY) LTC
							 WHERE  DK.MALTC = LTC.MALTC)
	BEGIN
		RAISERROR('Bạn đã đăng ký lớp này',16,1)
		RETURN
	END

	ELSE IF EXISTS(SELECT 1 FROM LINK2.QLDSV_TC.DBO.CT_DONGHOCPHI WHERE MASV = @MASV AND NIENKHOA = @NIENKHOA AND HOCKY = @HOCKY)
	BEGIN
		RAISERROR('Bạn đã hết thời hạn đăng ký',16,1)
		RETURN
	END
	
	SET XACT_ABORT ON 
	BEGIN DISTRIBUTED TRANSACTION;
	-------------------------------- UPDATE DANGKY ------------------------------------------------.
	IF EXISTS(SELECT 1 FROM DANGKY DK WHERE DK.MASV=@MASV AND DK.MALTC=@MALTC AND DK.HUYDANGKY=0)
	BEGIN
		UPDATE DANGKY SET HUYDANGKY=0 WHERE MASV=@MASV AND MALTC=@MALTC 
	END
	ELSE
	BEGIN
		IF EXISTS(SELECT MALTC FROM LOPTINCHI WHERE HUYLOP = 0 AND MALTC = @MALTC)
			INSERT INTO DANGKY(MALTC, MASV, HUYDANGKY) VALUES (@MALTC, @MASV, 0)
		ELSE
			RAISERROR('Lớp tín chỉ đã bị hủy',16,1)
	END

	-------------------- Cập nhật học phí khi đã đăng ký thành công --------------------------------
	DECLARE @TONGTIET INT

	SELECT @TONGTIET = MH.SOTIET_LT + MH.SOTIET_TH
	FROM (SELECT MAMH FROM LOPTINCHI WHERE MALTC=@MALTC) LTC, 
		MONHOC MH 
		WHERE LTC.MAMH = MH.MAMH 

	-------------------- Cộng vào học phí nếu trước đó đã đăng ký môn nào đó.--------------------------------
	IF EXISTS(SELECT 1 FROM LINK2.QLDSV_TC.DBO.HOCPHI HP WHERE HP.MASV = @MASV AND HP.NIENKHOA = @NIENKHOA AND HP.HOCKY = @HOCKY)
	BEGIN
		UPDATE LINK2.QLDSV_TC.DBO.HOCPHI 
		SET HOCPHI += (@TONGTIET/15) * @CHIPHI 
		WHERE MASV = @MASV AND NIENKHOA = @NIENKHOA AND HOCKY = @HOCKY
	END

	-------------------- Ngược lại sẽ thêm mới học phí nếu trước đó chưa từng đăng ký --------------------------------
	ELSE
	BEGIN
		INSERT INTO LINK2.QLDSV_TC.DBO.HOCPHI(MASV,NIENKHOA,HOCKY,HOCPHI) 
		VALUES (@MASV, @NIENKHOA, @HOCKY, (@TONGTIET/15) * @CHIPHI)
	END
	COMMIT TRANSACTION;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DSLTC_MASV_NK_HK]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_DSLTC_MASV_NK_HK]
	@MASV NCHAR(10),
	@NIENKHOA NCHAR(9),
	@HOCKY INT
AS
BEGIN
	SELECT DK.MALTC, LTC.MAMH, LTC.NHOM, LTC.MAGV, DK.HUYDANGKY FROM QLDSV_TC.DBO.DANGKY AS DK
	JOIN QLDSV_TC.DBO.LOPTINCHI AS LTC ON LTC.MALTC = DK.MALTC
	WHERE DK.MASV = @MASV AND LTC.NIENKHOA = @NIENKHOA AND LTC.HOCKY = @HOCKY
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DSSV_DANGKY]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_DSSV_DANGKY]
@MASV NCHAR(10)
AS
BEGIN
    DECLARE @HOTEN NVARCHAR(50) 
    SELECT @HOTEN = HO + ' ' + TEN FROM QLDSV_TC.DBO.SINHVIEN WHERE MASV = @MASV

    SELECT MASV, @HOTEN, TENMH
    FROM (SELECT MASV, MALTC FROM QLDSV_TC.DBO.DANGKY WHERE MASV = @MASV) AS DK,
    (SELECT MALTC, MAMH FROM QLDSV_TC.DBO.LOPTINCHI) AS LTC, 
    (SELECT MAMH, TENMH FROM QLDSV_TC.DBO.MONHOC) AS L
    WHERE DK.MALTC = LTC.MALTC AND LTC.MAMH = L.MAMH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_findGiangVienByMaGV]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_findGiangVienByMaGV] (@MAGV NCHAR(10))
AS
	SELECT * FROM QLDSV_TC.DBO.GIANGVIEN WHERE MAGV = @MAGV
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllDangKy]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_getAllDangKy]
AS
	Select * from QLDSV_TC.DBO.DANGKY
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllGiangVien]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getAllGiangVien]
AS
	SELECT * FROM QLDSV_TC.DBO.GIANGVIEN
GO;
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllLop]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getAllLop]
AS
	select MALOP, TENLOP, KHOAHOC, MAKHOA from QLDSV_TC.DBO.LOP
GO;
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllLopTinChi]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getAllLopTinChi]
AS
	select * from QLDSV_TC.DBO.LOPTINCHI
GO;
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllMonHoc]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getAllMonHoc]
AS
	select * from QLDSV_TC.DBO.MONHOC
GO;
GO
/****** Object:  StoredProcedure [dbo].[sp_getAllSinhVien]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_getAllSinhVien]
AS
	SELECT * FROM QLDSV_TC.DBO.SINHVIEN
GO
/****** Object:  StoredProcedure [dbo].[SP_GETCTHP]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GETCTHP]
@MASV NCHAR(10),
@NK NCHAR(9),
@HK INT
AS
BEGIN
    SELECT *
    FROM QLDSV_TC.DBO.CT_DONGHOCPHI WHERE MASV = @MASV AND NIENKHOA = @NK AND HOCKY = @HK
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GETDSLTC_NK_HK]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GETDSLTC_NK_HK]
@NK NCHAR(9),
@HK INT
AS
BEGIN
    SELECT MALTC, NIENKHOA, HOCKY, MAMH, NHOM, MAGV, MAKHOA, SOSVTOITHIEU, HUYLOP
    FROM QLDSV_TC.DBO.LOPTINCHI WHERE NIENKHOA = @NK AND HOCKY = @HK
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GETHK]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GETHK]
@NIENKHOA NCHAR(9)
AS
BEGIN
    SELECT HOCKY FROM LOPTINCHI WHERE NIENKHOA = @NIENKHOA
    GROUP BY HOCKY
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GETHK_HP_NK]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_GETHK_HP_NK]
@NIENKHOA nchar(9)
AS
BEGIN
	SELECT HOCKY FROM HOCPHI WHERE NIENKHOA = @NIENKHOA
	GROUP BY HOCKY
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GETHOCPHI_SV]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_GETHOCPHI_SV]
@MASV NCHAR(10),
@NK NCHAR(9),
@HK INT
AS
BEGIN
    SELECT *
    FROM (SELECT MASV, HOTEN = HO + ' ' + TEN FROM QLDSV_TC.DBO.SINHVIEN WHERE MASV = @MASV) AS SV , 
    (SELECT MASV, NIENKHOA, HOCKY FROM QLDSV_TC.DBO.HOCPHI WHERE MASV = @MASV AND NIENKHOA = @NK AND HOCKY = @HK) AS HP
    WHERE SV.MASV = HP.MASV
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GETKHOAHOC_MASV]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GETKHOAHOC_MASV]
@MASV NCHAR(10)
AS 
BEGIN
    SELECT NIENKHOA, COUNT(NIENKHOA) 
    FROM (SELECT MASV, MALTC FROM DANGKY WHERE MASV = @MASV AND HUYDANGKY = 0) AS SV, 
    (SELECT MALTC, NIENKHOA FROM LOPTINCHI) AS LTC
    WHERE SV.MALTC = LTC.MALTC
    GROUP BY NIENKHOA
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GETKHOAHOC_SV]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_GETKHOAHOC_SV]
@MASV NCHAR(10)
AS
BEGIN
    SELECT MASV, HOTEN, KHOAHOC
    FROM (SELECT MASV, MALOP, HOTEN = HO + ' ' + TEN FROM QLDSV_TC.DBO.SINHVIEN WHERE MASV = @MASV) AS SV , 
    (SELECT MALOP, KHOAHOC FROM QLDSV_TC.DBO.LOP) AS L
    WHERE SV.MALOP = L.MALOP
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GETLTC_NK_HK]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GETLTC_NK_HK]
@NIENKHOA NCHAR(9),
@HOCKY INT
AS
BEGIN
	SELECT MALTC, NIENKHOA, HOCKY, MAMH, NHOM, MAGV, MAKHOA, SOSVTOITHIEU, HUYLOP FROM QLDSV_TC.dbo.LOPTINCHI
	WHERE NIENKHOA = @NIENKHOA AND HOCKY = @HOCKY
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GETMALTC_NK_HK_MAMH_NHOM]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GETMALTC_NK_HK_MAMH_NHOM]
@NIENKHOA NCHAR(9),
@HOCKY INT,
@MAMH NCHAR(10),
@NHOM INT
AS
BEGIN
    SELECT LTC.MALTC, MASV, DIEM_CC, DIEM_GK, DIEM_CK, HUYDANGKY  FROM 
    (SELECT MALTC FROM LOPTINCHI
    WHERE NIENKHOA = @NIENKHOA AND HOCKY = @HOCKY AND MAMH = @MAMH AND NHOM = @NHOM) AS LTC,
    (SELECT MALTC, MASV, DIEM_CC, DIEM_GK, DIEM_CK, HUYDANGKY FROM DANGKY) AS DK
    WHERE LTC.MALTC = DK.MALTC
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GETMAMH]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GETMAMH]
@NIENKHOA NCHAR(9),
@HOCKY INT
AS
BEGIN
    SELECT MAMH FROM LOPTINCHI WHERE NIENKHOA = @NIENKHOA AND HOCKY = @HOCKY
    GROUP BY MAMH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GETMONHOC_NK_HK]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_GETMONHOC_NK_HK]
@MAMH NCHAR(10),
@NK NCHAR(9),
@HK INT
AS
BEGIN
	SELECT MH.TENMH , LTC.NIENKHOA, LTC.HOCKY
	FROM (SELECT MAMH , TENMH  FROM QLDSV_TC.DBO.MONHOC WHERE MAMH = @MAMH) AS MH , 
	(SELECT MAMH, NIENKHOA, HOCKY FROM QLDSV_TC.DBO.LOPTINCHI WHERE  MAMH = @MAMH AND NIENKHOA = @NK AND HOCKY = @HK) AS LTC
	WHERE MH.MAMH = LTC.MAMH 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GETNGAYDONG_SOTIENDONG_NK_HK]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GETNGAYDONG_SOTIENDONG_NK_HK]
@MASV NCHAR(10),
@NIENKHOA NCHAR(9),
@HOCKY INT
AS
BEGIN
    SELECT NGAYDONG, SOTIENDONG FROM
    (SELECT * FROM CT_DONGHOCPHI WHERE MASV = @MASV AND NIENKHOA = @NIENKHOA AND HOCKY = @HOCKY) AS CTHP
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GETNHOM]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GETNHOM]
@NIENKHOA NCHAR(9),
@HOCKY INT,
@MAMH NCHAR(10)
AS
BEGIN
    SELECT NHOM FROM LOPTINCHI WHERE NIENKHOA = @NIENKHOA AND HOCKY = @HOCKY AND MAMH = @MAMH
    GROUP BY NHOM
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GETNK]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_GETNK]
AS
BEGIN
    SELECT NIENKHOA FROM LOPTINCHI GROUP BY NIENKHOA
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GETNK_HP]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_GETNK_HP]
AS
BEGIN
	SELECT NIENKHOA FROM HOCPHI
	GROUP BY NIENKHOA
END
GO
/****** Object:  StoredProcedure [dbo].[sp_getSubcriberServer]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_getSubcriberServer]
AS
	SELECT PUBS.description AS TENKHOA, SUBS.subscriber_server AS TENSERVER
	FROM
	dbo.sysmergepublications AS PUBS
	INNER JOIN
	dbo.sysmergesubscriptions AS SUBS ON PUBS.pubid = SUBS.pubid AND PUBS.publisher <> SUBS.subscriber_server
GO
/****** Object:  StoredProcedure [dbo].[SP_GETTHONGTINSINHVIEN]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_GETTHONGTINSINHVIEN]
@MASV NCHAR(10)
AS
BEGIN
	SELECT * FROM QLDSV_TC.DBO.SINHVIEN WHERE MASV = @MASV
END
GO
/****** Object:  StoredProcedure [dbo].[SP_IN_PD]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_IN_PD]
@MASV NCHAR(10),
@LOAI NCHAR(10)
AS
BEGIN
    IF @LOAI = 'KHOA'
        IF EXISTS(SELECT MASV FROM SINHVIEN WHERE MASV = @MASV)
            BEGIN
                SELECT MH.TENMH, DIEM = ISNULL(MAX(0.1 * DK.DIEM_CC + 0.3 * DIEM_GK + 0.6 * DIEM_CK), '')
                FROM (SELECT MALTC, MASV, DIEM_CC, DIEM_GK, DIEM_CK FROM DANGKY WHERE MASV = @MASV) DK
                INNER JOIN (SELECT MALTC, MAMH FROM LOPTINCHI) LTC ON LTC.MALTC = DK.MALTC
                INNER JOIN (SELECT MAMH, TENMH FROM MONHOC) MH ON MH.MAMH = LTC.MAMH
                GROUP BY MH.TENMH
                ORDER BY MH.TENMH
            END
        ELSE 
            RAISERROR('Không tìm thấy sinh viên trong khoa', 16, 1)
    ELSE IF EXISTS(SELECT MASV FROM Link0.QLDSV_TC.dbo.SINHVIEN WHERE MASV = @MASV)
            BEGIN
                SELECT MH.TENMH, DIEM = ISNULL(MAX(0.1 * DK.DIEM_CC + 0.3 * DIEM_GK + 0.6 * DIEM_CK), '')
                FROM (SELECT MALTC, MASV, DIEM_CC, DIEM_GK, DIEM_CK FROM DANGKY WHERE MASV = @MASV) DK
                INNER JOIN (SELECT MALTC, MAMH FROM LOPTINCHI) LTC ON LTC.MALTC = DK.MALTC
                INNER JOIN (SELECT MAMH, TENMH FROM MONHOC) MH ON MH.MAMH = LTC.MAMH
                GROUP BY MH.TENMH
                ORDER BY MH.TENMH
            END
        ELSE 
            RAISERROR('Không tìm thấy sinh viên', 16, 1)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INBD_TONGKET]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_INBD_TONGKET]
    @MALOP NCHAR(10)
AS
BEGIN
    DECLARE 
    @cols NVARCHAR(MAX) = '',
    @query NVARCHAR(MAX);


    SELECT @cols += QUOTENAME(TENMH) + ','
    FROM MONHOC
    SET @cols = LEFT(@cols, LEN(@cols) - 1);

    SET @query = '
        SELECT *
        FROM (SELECT SV.MASV, SV.HO, SV.TEN, DK.DIEM, TENMH
        FROM ((SELECT MASV, HO, TEN FROM SINHVIEN WHERE MALOP = '''+ @MALOP + ''' AND DANGHIHOC = 0) SV 
        LEFT JOIN (SELECT MALTC, MASV, DIEM = MAX(DIEM_CC * 0.1 + DIEM_GK * 0.3 + DIEM_CK * 0.6) FROM DANGKY WHERE HUYDANGKY = 0 GROUP BY MALTC, MASV) DK ON SV.MASV = DK.MASV
        LEFT JOIN (SELECT MALTC, MAMH FROM LOPTINCHI WHERE HUYLOP = 0) LTC ON LTC.MALTC = DK.MALTC
        LEFT JOIN (SELECT MAMH, TENMH FROM MONHOC) MH ON MH.MAMH = LTC.MAMH)) SourceTable
        PIVOT
        ( 
            MAX(DIEM)
            FOR TENMH IN (' + @cols + ')
        ) AS PivotTable'
    EXEC (@query)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_INDSHP_OF_LOP]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_INDSHP_OF_LOP]
@MALOP NCHAR(10),
@NIENKHOA NCHAR(9),
@HOCKY INT
AS
BEGIN
    SELECT SV.MASV, HOTENSV = HO + ' ' + TEN, HOCPHI, SOTIENDONG = ISNULL(SUM(SOTIENDONG), 0) FROM 
    (SELECT MASV, MALOP, HO, TEN FROM SINHVIEN WHERE MALOP = @MALOP) AS SV,
    (SELECT MASV, HOCPHI FROM HOCPHI WHERE NIENKHOA = @NIENKHOA AND HOCKY = @HOCKY AND HOCPHI > 1) AS HP LEFT JOIN
    (SELECT MASV, SOTIENDONG FROM CT_DONGHOCPHI WHERE NIENKHOA = @NIENKHOA AND HOCKY = @HOCKY) AS CTHP
    ON HP.MASV = CTHP.MASV
    WHERE SV.MASV = HP.MASV
    GROUP BY SV.MASV, HO, TEN, HOCPHI
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SHOW_DATA_TABLE]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_SHOW_DATA_TABLE]
	@DIEMTHI DATA_TABLE_NHAP_DIEM READONLY
AS
	SELECT MALTC, MASV, DIEM_CC, DIEM_GK, DIEM_CK from @DIEMTHI
GO
/****** Object:  StoredProcedure [dbo].[SP_TAOLOGIN]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_TAOLOGIN]
  @LGNAME VARCHAR(50),
  @PASS VARCHAR(50),
  @USERNAME VARCHAR(50),
  @ROLE VARCHAR(50)
AS
  DECLARE @RET INT
  EXEC @RET= sp_addlogin @LGNAME, @PASS, 'QLDSV_TC'
  IF (@RET =1)  -- LOGIN NAME BI TRUNG
     RETURN 1
 
  EXEC @RET= SP_GRANTDBACCESS @LGNAME, @USERNAME
  IF (@RET =1)  -- USER  NAME BI TRUNG
  BEGIN
       EXEC SP_DROPLOGIN @LGNAME
       RETURN 2
  END
  EXEC sp_addrolemember @ROLE, @USERNAME
  IF @ROLE= 'PGV' OR @ROLE= 'KHOA' OR @ROLE = 'PKT'
  BEGIN 
    EXEC sp_addsrvrolemember @LGNAME, 'SecurityAdmin'
    --EXEC sp_addsrvrolemember @LGNAME, 'ProcessAdmin'
  END
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_CTDONGHOCPHI]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEM_CTDONGHOCPHI]
@MASV NCHAR(10),
@NIENKHOA NCHAR(9),
@HOCKY INT,
@NGAYDONG NVARCHAR(12),
@SOTIENDONG INT
AS
BEGIN
    IF EXISTS (SELECT MASV FROM CT_DONGHOCPHI 
    WHERE MASV = @MASV AND NIENKHOA = @NIENKHOA AND HOCKY = @HOCKY AND NGAYDONG = @NGAYDONG)
        BEGIN
            UPDATE CT_DONGHOCPHI SET SOTIENDONG += @SOTIENDONG 
            WHERE MASV = @MASV AND NIENKHOA = @NIENKHOA AND HOCKY = @HOCKY AND NGAYDONG = @NGAYDONG
        END
    ELSE 
        BEGIN
            IF EXISTS (SELECT MASV FROM HOCPHI WHERE MASV = @MASV AND NIENKHOA = @NIENKHOA AND HOCKY = @HOCKY)
                INSERT INTO CT_DONGHOCPHI(MASV, NIENKHOA, HOCKY, NGAYDONG, SOTIENDONG) 
                VALUES (@MASV, @NIENKHOA, @HOCKY, @NGAYDONG, @SOTIENDONG)
            ELSE 
                RAISERROR ('Bạn không có học phí cần đóng', 16, 1)
        END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_THEMLOPHOC]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEMLOPHOC]
@MALOP NCHAR(10),
@TENLOP NVARCHAR(50),
@KHOAHOC NCHAR(9),
@MAKHOA NCHAR(10)
AS
BEGIN
	INSERT INTO LOP (MALOP, TENLOP, KHOAHOC, MAKHOA)
	VALUES (@MALOP, @TENLOP, @KHOAHOC, @MAKHOA)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_THEMLTC]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEMLTC]
@MAKHOA NCHAR(10),
@NIENKHOA NCHAR(9),
@HOCKY INT,
@MAMH NCHAR(9),
@NHOM INT,
@MAGV NCHAR(9),
@SOSVTOITHIEU INT
AS 
BEGIN
    IF EXISTS (SELECT MAGV FROM GIANGVIEN WHERE MAGV = @MAGV AND MAKHOA = @MAKHOA)
        INSERT INTO LOPTINCHI (NIENKHOA, HOCKY, MAMH, NHOM, MAGV, MAKHOA, SOSVTOITHIEU)
        VALUES (@NIENKHOA, @HOCKY, @MAMH, @NHOM, @MAGV, @MAKHOA, @SOSVTOITHIEU)
    ELSE
        RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_THEMMH]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_THEMMH]
@MAMH NCHAR(10),
@TENMH NVARCHAR(50),
@SOTIET_LT INT,
@SOTIET_TH INT
AS
BEGIN
        INSERT INTO MONHOC(MAMH, TENMH, SOTIET_LT, SOTIET_TH)
        VALUES (@MAMH, @TENMH, @SOTIET_LT, @SOTIET_TH)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_THEMSV]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_THEMSV]
@MALOP NCHAR(10),
@MASV NCHAR(10),
@HO NVARCHAR(50),
@TEN NVARCHAR(10),
@PHAI BIT,
@DIACHI NVARCHAR(100),
@NGAYSINH NVARCHAR(12),
@DANGHIHOC BIT,
@PASSWORD NVARCHAR(40)
AS
BEGIN
    IF EXISTS(SELECT MALOP FROM QLDSV_TC.DBO.LOP WHERE MALOP = @MALOP)
        INSERT INTO QLDSV_TC.DBO.SINHVIEN(MASV, HO, TEN, PHAI, DIACHI, NGAYSINH, MALOP, DANGHIHOC, PASSWORD)
        VALUES (@MASV, @HO, @TEN, @PHAI, @DIACHI, @NGAYSINH, @MALOP, @DANGHIHOC, @PASSWORD)
    ELSE 
        BEGIN
			RAISERROR(N'Lớp không tồn tại', 16, 1)
		END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TIMGIANGVIEN]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TIMGIANGVIEN] 
@MAGV NCHAR(10)
AS
BEGIN
	SELECT MAGV, HO, TEN, HOCVI, HOCHAM, CHUYENMON, MAKHOA FROM GIANGVIEN
	WHERE MAGV = @MAGV
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TIMLOPTHEOMALOP]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TIMLOPTHEOMALOP]
@MALOP NCHAR(10)
AS
BEGIN
	IF EXISTS (SELECT MALOP FROM QLDSV_TC.dbo.LOP WHERE MALOP = @MALOP)
		BEGIN
			SELECT MALOP, TENLOP, KHOAHOC, MAKHOA FROM QLDSV_TC.dbo.LOP
			WHERE MALOP = @MALOP
		END
	ELSE IF EXISTS (SELECT MALOP FROM LINK0.QLDSV_TC.dbo.LOP WHERE MALOP = @MALOP)
		BEGIN
			SELECT MALOP, TENLOP, KHOAHOC, MAKHOA FROM LINK0.QLDSV_TC.dbo.LOP
			WHERE MALOP = @MALOP
		END
	ELSE
		RAISERROR ('Lớp không tồn tại', 16, 1)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TIMLTCTHEOMALTC]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TIMLTCTHEOMALTC]
@MALTC INT
AS
BEGIN
	IF EXISTS (SELECT MALTC FROM QLDSV_TC.dbo.LOPTINCHI WHERE MALTC = @MALTC)
		BEGIN
			SELECT MALTC, NIENKHOA, HOCKY, MAMH, NHOM, MAGV, MAKHOA, SOSVTOITHIEU, HUYLOP FROM QLDSV_TC.dbo.LOPTINCHI
			WHERE MALTC = @MALTC
		END
	ELSE IF EXISTS (SELECT MALTC FROM LINK0.QLDSV_TC.dbo.LOPTINCHI WHERE MALTC = @MALTC)
		BEGIN
			SELECT MALTC, NIENKHOA, HOCKY, MAMH, NHOM, MAGV, MAKHOA, SOSVTOITHIEU, HUYLOP FROM LINK0.QLDSV_TC.dbo.LOPTINCHI
			WHERE MALTC = @MALTC
		END
	ELSE
		RAISERROR ('Lớp tín chỉ không tồn tại', 16, 1)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TIMMONHOC]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TIMMONHOC]
	@MAMH NCHAR(10)
AS
BEGIN
	SELECT MAMH, TENMH, SOTIET_LT, SOTIET_TH FROM QLDSV_TC.dbo.MONHOC
	WHERE MAMH = @MAMH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TimSV]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_TimSV]
  @MSSV NCHAR(10)
AS

DECLARE @MALOP NCHAR(10),@MAKHOA NCHAR(10), @HO nvarchar(50), @TEN nvarchar(10)
IF  exists(select MASV from  QLDSV_TC.dbo.SINHVIEN  where MASV = @MSSV AND DANGHIHOC = 0)
BEGIN
    SELECT K.MAKHOA, L.MALOP, SV.MASV, SV.HO, SV.TEN, SV.PHAI, SV.DIACHI, SV.NGAYSINH, SV.DANGHIHOC, SV.PASSWORD
		FROM (SELECT MASV, HO, TEN, PHAI, DIACHI, NGAYSINH, MALOP, DANGHIHOC, PASSWORD FROM QLDSV_TC.dbo.SINHVIEN) AS SV , 
			 (SELECT MALOP, MAKHOA FROM QLDSV_TC.dbo.LOP ) AS L, 
			 (SELECT TENKHOA, MAKHOA FROM QLDSV_TC.dbo.KHOA) AS K
	WHERE MASV = @MSSV AND SV.MALOP = L.MALOP AND L.MAKHOA = K.MAKHOA
END
ELSE
	IF  exists(select MASV from  LINK0.QLDSV_TC.dbo.SINHVIEN  where MASV =@MSSV  AND DANGHIHOC = 0)
	BEGIN
		SELECT K.MAKHOA, L.MALOP, SV.MASV, SV.HO, SV.TEN, SV.PHAI, SV.DIACHI, SV.NGAYSINH, SV.DANGHIHOC, SV.PASSWORD
		FROM (SELECT MASV, HO, TEN, PHAI, DIACHI, NGAYSINH, MALOP, DANGHIHOC, PASSWORD FROM LINK0.QLDSV_TC.dbo.SINHVIEN) AS SV , 
			 (SELECT MALOP, MAKHOA FROM LINK0.QLDSV_TC.dbo.LOP ) AS L, 
			 (SELECT TENKHOA, MAKHOA FROM LINK0.QLDSV_TC.dbo.KHOA) AS K
		WHERE MASV = @MSSV AND SV.MALOP = L.MALOP AND L.MAKHOA = K.MAKHOA         
	END
	ELSE  -- không có nv
     raiserror ( 'Sinh viên không tồn tại', 16, 1)
GO
/****** Object:  StoredProcedure [dbo].[SP_TIMSVTHEOMALOP]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TIMSVTHEOMALOP]
@MALOP NCHAR(10)
AS 
BEGIN
    SELECT MASV, HO, TEN, PHAI, DIACHI, NGAYSINH, MALOP, DANGHIHOC, PASSWORD FROM QLDSV_TC.DBO.SINHVIEN AS SV
	WHERE SV.MALOP = @MALOP
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UPDATE_DIEM]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_UPDATE_DIEM]
	@DIEMTHI DATA_TABLE_NHAP_DIEM READONLY
AS
BEGIN
	MERGE INTO DANGKY AS TARGET
	USING (SELECT MALTC, MASV, DIEM_CC, DIEM_GK, DIEM_CK FROM @DIEMTHI) AS SOURCE
	ON TARGET.MALTC = SOURCE.MALTC AND TARGET.MASV = SOURCE.MASV
	WHEN MATCHED THEN 
		UPDATE SET TARGET.DIEM_CC = SOURCE.DIEM_CC, TARGET.DIEM_GK = SOURCE.DIEM_GK,
		TARGET.DIEM_CK = SOURCE.DIEM_CK
	WHEN NOT MATCHED THEN
	INSERT (MALTC, MASV, DIEM_CC, DIEM_GK, DIEM_CK)
	VALUES (SOURCE.MALTC, SOURCE.MASV, SOURCE.DIEM_CC, SOURCE.DIEM_GK, SOURCE.DIEM_CK);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_XOALOGIN]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SP_XOALOGIN]
  @LGNAME VARCHAR(50),
  @USRNAME VARCHAR(50)
  
AS
  EXEC SP_DROPUSER @USRNAME
  EXEC SP_DROPLOGIN @LGNAME
GO
/****** Object:  StoredProcedure [dbo].[SP_XOALOPHOC]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XOALOPHOC]
@MALOP NCHAR(10)
AS
BEGIN
    IF NOT EXISTS (SELECT MALOP FROM SINHVIEN WHERE MALOP = @MALOP)
        DELETE FROM LOP WHERE MALOP = @MALOP
    ELSE 
        RAISERROR ('Không thể xóa lớp', 16, 1)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_XOAMONHOC]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XOAMONHOC]
@MAMH NCHAR(10)
AS 
BEGIN
    IF NOT EXISTS(SELECT MH.MAMH FROM MONHOC AS MH, (SELECT MALTC, MAMH FROM LOPTINCHI) AS LTC,
    (SELECT MALTC FROM DANGKY) AS DK
    WHERE MH.MAMH = @MAMH AND MH.MAMH = LTC.MAMH AND LTC.MALTC = DK.MALTC)
        DELETE MONHOC WHERE MAMH = @MAMH
    ELSE
        RAISERROR('Không thể xóa môn học', 16, 1)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_XOASINHVIEN]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XOASINHVIEN]
@MASV NCHAR(10)
AS
BEGIN
    IF EXISTS (SELECT MASV FROM QLDSV_TC.DBO.SINHVIEN WHERE MASV = @MASV AND DANGHIHOC = 0)
        BEGIN
			UPDATE QLDSV_TC.DBO.SINHVIEN
			SET DANGHIHOC = 1
			WHERE MASV = @MASV
		END
    ELSE
        RAISERROR ('Không tìm thấy sinh viên', 16, 1)
END
GO
/****** Object:  StoredProcedure [dbo].[SPGETHOCPHI_MASV]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SPGETHOCPHI_MASV]
@MASV NCHAR(10)
AS
BEGIN
    SELECT MALOP, HO, TEN, HP.NIENKHOA, HP.HOCKY, HOCPHI, SOTIENDADONG = ISNULL(SOTIENDADONG, 0), SOTIENCONLAI = HOCPHI - ISNULL(SOTIENDADONG, 0)
    FROM (SELECT MASV, MALOP, HO, TEN FROM SINHVIEN WHERE MASV = @MASV) AS SV, 
    (SELECT * FROM HOCPHI WHERE MASV = @MASV) AS HP LEFT JOIN
    (SELECT MASV, NIENKHOA, HOCKY, SOTIENDADONG = SUM(SOTIENDONG) FROM CT_DONGHOCPHI 
    WHERE MASV = @MASV
    GROUP BY MASV, NIENKHOA, HOCKY) AS CTHP
    ON HP.NIENKHOA = CTHP.NIENKHOA AND HP.HOCKY = CTHP.HOCKY
    WHERE SV.MASV = HP.MASV 
    ORDER BY NIENKHOA, HOCKY
END
GO
/****** Object:  StoredProcedure [dbo].[SPGETHOCPHI_SV]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SPGETHOCPHI_SV]
@MASV NCHAR(10),
@NK NCHAR(9),
@HK INT
AS
BEGIN
    SELECT *
    FROM (SELECT MASV, HO, TEN FROM SINHVIEN WHERE MASV = @MASV) AS SV , 
    (SELECT MASV, NIENKHOA, HOCKY FROM HOCPHI WHERE MASV = @MASV AND NIENKHOA = @NK AND HOCKY = @HK) AS HP
    WHERE SV.MASV = HP.MASV
END
GO
/****** Object:  StoredProcedure [dbo].[TEST]    Script Date: 27/12/2024 10:33:15 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[TEST] 
AS
BEGIN
	EXEC sp_TimSV 'N20DCCN126'
END
GO
