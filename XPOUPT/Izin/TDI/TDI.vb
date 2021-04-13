Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class TDI
		Inherits XPLiteObject
		Dim fTDIID As Guid
		<Key(true)> _
		Public Property TDIID() As Guid
			Get
				Return fTDIID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("TDIID", fTDIID, value)
			End Set
		End Property
		Dim fNoIzin As String
		<Size(45)> _
		Public Property NoIzin() As String
			Get
				Return fNoIzin
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NoIzin", fNoIzin, value)
			End Set
		End Property
        Dim fPermohonanID As Permohonan
        Public Property PermohonanID() As Permohonan
            Get
                Return fPermohonanID
            End Get
            Set(ByVal value As Permohonan)
                SetPropertyValue(Of Permohonan)("PermohonanID", fPermohonanID, value)
            End Set
        End Property
		Dim fPerusahaanNama As String
		<Size(30)> _
		Public Property PerusahaanNama() As String
			Get
				Return fPerusahaanNama
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PerusahaanNama", fPerusahaanNama, value)
			End Set
		End Property
		Dim fPerusahaanAlamat As String
		<Size(200)> _
		Public Property PerusahaanAlamat() As String
			Get
				Return fPerusahaanAlamat
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PerusahaanAlamat", fPerusahaanAlamat, value)
			End Set
		End Property
		Dim fPerusahaanTelpon As String
		<Size(20)> _
		Public Property PerusahaanTelpon() As String
			Get
				Return fPerusahaanTelpon
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PerusahaanTelpon", fPerusahaanTelpon, value)
			End Set
		End Property
		Dim fPerusahaanFax As String
		<Size(20)> _
		Public Property PerusahaanFax() As String
			Get
				Return fPerusahaanFax
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PerusahaanFax", fPerusahaanFax, value)
			End Set
		End Property
		Dim fPerusahaanNPWP As String
		<Size(30)> _
		Public Property PerusahaanNPWP() As String
			Get
				Return fPerusahaanNPWP
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PerusahaanNPWP", fPerusahaanNPWP, value)
			End Set
		End Property
		Dim fPerusahaanDirektur As String
		<Size(50)> _
		Public Property PerusahaanDirektur() As String
			Get
				Return fPerusahaanDirektur
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PerusahaanDirektur", fPerusahaanDirektur, value)
			End Set
		End Property
		Dim fPerusahaanDirekturAlamat As String
		<Size(150)> _
		Public Property PerusahaanDirekturAlamat() As String
			Get
				Return fPerusahaanDirekturAlamat
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PerusahaanDirekturAlamat", fPerusahaanDirekturAlamat, value)
			End Set
		End Property
		Dim fPemilikNoKTP As String
        <Size(50)> _
  Public Property PemilikNoKTP() As String
            Get
                Return fPemilikNoKTP
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemilikNoKTP", fPemilikNoKTP, value)
            End Set
        End Property
		Dim fPemilikNama As String
        <Size(50)> _
  Public Property PemilikNama() As String
            Get
                Return fPemilikNama
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemilikNama", fPemilikNama, value)
            End Set
        End Property
		Dim fPemilikAlamat As String
		<Size(150)> _
		Public Property PemilikAlamat() As String
			Get
				Return fPemilikAlamat
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PemilikAlamat", fPemilikAlamat, value)
			End Set
		End Property
		Dim fPemilikKodepos As String
        <Size(50)> _
  Public Property PemilikKodepos() As String
            Get
                Return fPemilikKodepos
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemilikKodepos", fPemilikKodepos, value)
            End Set
        End Property
		Dim fPemilikTelpon As String
        <Size(50)> _
  Public Property PemilikTelpon() As String
            Get
                Return fPemilikTelpon
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemilikTelpon", fPemilikTelpon, value)
            End Set
        End Property
		Dim fPemilikFax As String
        <Size(50)> _
        Public Property PemilikFax() As String
            Get
                Return fPemilikFax
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemilikFax", fPemilikFax, value)
            End Set
        End Property
        Dim fStatusBangunan As StatusBangunan
        Public Property StatusBangunan() As StatusBangunan
            Get
                Return fStatusBangunan
            End Get
            Set(ByVal value As StatusBangunan)
                SetPropertyValue(Of StatusBangunan)("StatusBangunan", fStatusBangunan, value)
            End Set
        End Property
		Dim fPabrikAlamat As String
		<Size(150)> _
		Public Property PabrikAlamat() As String
			Get
				Return fPabrikAlamat
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PabrikAlamat", fPabrikAlamat, value)
			End Set
		End Property
        Dim fPabrikKelurahanID As Kelurahan
        Public Property PabrikKelurahanID() As Kelurahan
            Get
                Return fPabrikKelurahanID
            End Get
            Set(ByVal value As Kelurahan)
                SetPropertyValue(Of Kelurahan)("PabrikKelurahanID", fPabrikKelurahanID, value)
            End Set
        End Property
		Dim fKepemilikan As String
		<Size(50)> _
		Public Property Kepemilikan() As String
			Get
				Return fKepemilikan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Kepemilikan", fKepemilikan, value)
			End Set
		End Property
		Dim fLuasTanah As Integer
		Public Property LuasTanah() As Integer
			Get
				Return fLuasTanah
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("LuasTanah", fLuasTanah, value)
			End Set
		End Property
		Dim fLuasPabrik As Integer
		Public Property LuasPabrik() As Integer
			Get
				Return fLuasPabrik
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("LuasPabrik", fLuasPabrik, value)
			End Set
		End Property
		Dim fTKIPria As Integer
		Public Property TKIPria() As Integer
			Get
				Return fTKIPria
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("TKIPria", fTKIPria, value)
			End Set
		End Property
		Dim fTKIWanita As Integer
		Public Property TKIWanita() As Integer
			Get
				Return fTKIWanita
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("TKIWanita", fTKIWanita, value)
			End Set
		End Property
		Dim fTKAsingPria As Integer
		Public Property TKAsingPria() As Integer
			Get
				Return fTKAsingPria
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("TKAsingPria", fTKAsingPria, value)
			End Set
		End Property
		Dim fTKAsingWanita As Integer
		Public Property TKAsingWanita() As Integer
			Get
				Return fTKAsingWanita
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("TKAsingWanita", fTKAsingWanita, value)
			End Set
		End Property
        Dim fKapasitasProduksi As String
        Public Property KapasitasProduksi() As String
            Get
                Return fKapasitasProduksi
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("KapasitasProduksi", fKapasitasProduksi, value)
            End Set
        End Property
        Dim fAsset As Decimal
        Public Property Asset() As Decimal
            Get
                Return fAsset
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("Asset", fAsset, value)
            End Set
        End Property
		Dim fInvestasi As Decimal
		Public Property Investasi() As Decimal
			Get
				Return fInvestasi
			End Get
			Set(ByVal value As Decimal)
				SetPropertyValue(Of Decimal)("Investasi", fInvestasi, value)
			End Set
		End Property
		Dim fInvestasiTerbilang As String
		<Size(200)> _
		Public Property InvestasiTerbilang() As String
			Get
				Return fInvestasiTerbilang
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("InvestasiTerbilang", fInvestasiTerbilang, value)
			End Set
		End Property
		Dim fMerk As String
		<Size(50)> _
		Public Property Merk() As String
			Get
				Return fMerk
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Merk", fMerk, value)
			End Set
		End Property
		Dim fTenagaPenggerak As String
		<Size(50)> _
		Public Property TenagaPenggerak() As String
			Get
				Return fTenagaPenggerak
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("TenagaPenggerak", fTenagaPenggerak, value)
			End Set
		End Property
		Dim fTglDikeluarkan As DateTime
		Public Property TglDikeluarkan() As DateTime
			Get
				Return fTglDikeluarkan
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("TglDikeluarkan", fTglDikeluarkan, value)
			End Set
		End Property
		Dim fTglBerahkir As DateTime
		Public Property TglBerahkir() As DateTime
			Get
				Return fTglBerahkir
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("TglBerahkir", fTglBerahkir, value)
			End Set
		End Property
		Dim fMasaBerlaku As String
		<Size(50)> _
		Public Property MasaBerlaku() As String
			Get
				Return fMasaBerlaku
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("MasaBerlaku", fMasaBerlaku, value)
			End Set
		End Property
		Dim fKomoditi As String
		Public Property Komoditi() As String
			Get
				Return fKomoditi
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Komoditi", fKomoditi, value)
			End Set
		End Property
		Dim fJenisIndustri As String
		Public Property JenisIndustri() As String
			Get
				Return fJenisIndustri
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("JenisIndustri", fJenisIndustri, value)
			End Set
		End Property
		Dim fPenerimaTDINama As String
		<Size(50)> _
		Public Property PenerimaTDINama() As String
			Get
				Return fPenerimaTDINama
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PenerimaTDINama", fPenerimaTDINama, value)
			End Set
		End Property
		Dim fPenerimaTDIAlamat As String
		<Size(150)> _
		Public Property PenerimaTDIAlamat() As String
			Get
				Return fPenerimaTDIAlamat
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PenerimaTDIAlamat", fPenerimaTDIAlamat, value)
			End Set
		End Property
		Dim fTglSerahTerima As DateTime
		Public Property TglSerahTerima() As DateTime
			Get
				Return fTglSerahTerima
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("TglSerahTerima", fTglSerahTerima, value)
			End Set
		End Property
		Dim fRetribusi As Decimal
		Public Property Retribusi() As Decimal
			Get
				Return fRetribusi
			End Get
			Set(ByVal value As Decimal)
				SetPropertyValue(Of Decimal)("Retribusi", fRetribusi, value)
			End Set
		End Property
		Dim fTglPembayaran As DateTime
		Public Property TglPembayaran() As DateTime
			Get
				Return fTglPembayaran
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("TglPembayaran", fTglPembayaran, value)
			End Set
		End Property
		Dim fRetribusiTerbilang As String
		Public Property RetribusiTerbilang() As String
			Get
				Return fRetribusiTerbilang
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("RetribusiTerbilang", fRetribusiTerbilang, value)
			End Set
		End Property
		Dim frek_id As Guid
		Public Property rek_id() As Guid
			Get
				Return frek_id
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("rek_id", frek_id, value)
			End Set
        End Property
        Dim fNIPIK As String
        <Association("NIPIK")> _
        Public Property NIPIK() As String
            Get
                Return fNIPIK
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("NIPIK", fNIPIK, value)
            End Set
        End Property
        Dim fKeterangan As String
        Public Property Keterangan() As String
            Get
                Return fKeterangan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Keterangan", fKeterangan, value)
            End Set
        End Property
        Dim fTglInput As Date
        Public Property TglInput() As Date
            Get
                Return fTglInput
            End Get
            Set(ByVal value As Date)
                SetPropertyValue(Of Date)("TglInput", fTglInput, value)
            End Set
        End Property
        <Association("TDI-TDIDetail")> _
        Public ReadOnly Property TDIDetail() As XPCollection(Of TDIDetail)
            Get
                Return GetCollection(Of TDIDetail)("TDIDetail")
            End Get
        End Property
		Public Sub New(ByVal session As Session)
			MyBase.New(session)
		End Sub
		Public Sub New()
			MyBase.New(Session.DefaultSession)
		End Sub
		Public Overrides Sub AfterConstruction()
			MyBase.AfterConstruction()
		End Sub
	End Class

End Namespace
