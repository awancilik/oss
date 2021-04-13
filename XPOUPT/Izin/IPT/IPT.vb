Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IPT
		Inherits XPLiteObject
		Dim fIPTID As Guid
		<Key(true)> _
		Public Property IPTID() As Guid
			Get
				Return fIPTID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IPTID", fIPTID, value)
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
		Dim fNamaPemilik As String
		<Size(50)> _
		Public Property NamaPemilik() As String
			Get
				Return fNamaPemilik
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NamaPemilik", fNamaPemilik, value)
			End Set
		End Property
        Dim fAlamatPemilik As String
        <Size(200)> _
        Public Property AlamatPemilik() As String
            Get
                Return fAlamatPemilik
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("AlamatPemilik", fAlamatPemilik, value)
            End Set
        End Property
        Dim fPemilikKecamatanID As Kecamatan
        Public Property PemilikKecamatanID() As Kecamatan
            Get
                Return fPemilikKecamatanID
            End Get
            Set(ByVal value As Kecamatan)
                SetPropertyValue(Of Kecamatan)("PemilikKecamatanID", fPemilikKecamatanID, value)
            End Set
        End Property
        Dim fPemilikKelurahanID As Kelurahan
        Public Property PemilikKelurahanID() As Kelurahan
            Get
                Return fPemilikKelurahanID
            End Get
            Set(ByVal value As Kelurahan)
                SetPropertyValue(Of Kelurahan)("PemilikKelurahanID", fPemilikKelurahanID, value)
            End Set
        End Property
        Dim fTglSerahTerima As Date
        Public Property TglSerahTerima() As Date
            Get
                Return fTglSerahTerima
            End Get
            Set(ByVal value As Date)
                SetPropertyValue(Of Date)("TglSerahTerima", fTglSerahTerima, value)
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
        Dim fTglDikeluarkan As Date
        Public Property TglDikeluarkan() As Date
            Get
                Return fTglDikeluarkan
            End Get
            Set(ByVal value As Date)
                SetPropertyValue(Of Date)("TglDikeluarkan", fTglDikeluarkan, value)
            End Set
        End Property
        Dim fLetakTanah As String
        <Size(50)> _
        Public Property LetakTanah() As String
            Get
                Return fLetakTanah
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("LetakTanah", fLetakTanah, value)
            End Set
        End Property
        Dim fPeruntukan As String
        Public Property Peruntukan() As String
            Get
                Return fPeruntukan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Peruntukan", fPeruntukan, value)
            End Set
        End Property
        Dim fPemilikTelpon As String
        <Size(20)> _
        Public Property PemilikTelpon() As String
            Get
                Return fPemilikTelpon
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemilikTelpon", fPemilikTelpon, value)
            End Set
        End Property
        Dim fPemilikRT As String
        Public Property PemilikRT() As String
            Get
                Return fPemilikRT
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemilikRT", fPemilikRT, value)
            End Set
        End Property
        Dim fPemilikRW As String
        Public Property PemilikRW() As String
            Get
                Return fPemilikRW
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemilikRW", fPemilikRW, value)
            End Set
        End Property

        Dim fSertifikat As String
		<Size(50)> _
		Public Property Sertifikat() As String
			Get
				Return fSertifikat
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Sertifikat", fSertifikat, value)
			End Set
		End Property
        Dim fLuasTanah As Decimal
        Public Property LuasTanah() As Decimal
            Get
                Return fLuasTanah
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("LuasTanah", fLuasTanah, value)
            End Set
        End Property
		Dim fNomorLeterC_D As String
		<Size(50)> _
		Public Property NomorLeterC_D() As String
			Get
				Return fNomorLeterC_D
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NomorLeterC_D", fNomorLeterC_D, value)
			End Set
		End Property
        Dim fPersilNomor As String
        Public Property PersilNomor() As String
            Get
                Return fPersilNomor
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PersilNomor", fPersilNomor, value)
            End Set
        End Property
		Dim fKelas As String
		<Size(50)> _
		Public Property Kelas() As String
			Get
				Return fKelas
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Kelas", fKelas, value)
			End Set
		End Property
		Dim fBatasUtara As String
		Public Property BatasUtara() As String
			Get
				Return fBatasUtara
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("BatasUtara", fBatasUtara, value)
			End Set
		End Property
		Dim fBatasTimur As String
		Public Property BatasTimur() As String
			Get
				Return fBatasTimur
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("BatasTimur", fBatasTimur, value)
			End Set
		End Property
		Dim fBatasBarat As String
		Public Property BatasBarat() As String
			Get
				Return fBatasBarat
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("BatasBarat", fBatasBarat, value)
			End Set
		End Property
		Dim fBatasSelatan As String
		Public Property BatasSelatan() As String
			Get
				Return fBatasSelatan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("BatasSelatan", fBatasSelatan, value)
			End Set
		End Property
		Dim fPenerimaIPTNama As String
		<Size(50)> _
		Public Property PenerimaIPTNama() As String
			Get
				Return fPenerimaIPTNama
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PenerimaIPTNama", fPenerimaIPTNama, value)
			End Set
		End Property
		Dim fPenerimaIPTAlamat As String
		<Size(250)> _
		Public Property PenerimaIPTAlamat() As String
			Get
				Return fPenerimaIPTAlamat
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PenerimaIPTAlamat", fPenerimaIPTAlamat, value)
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
        Dim fRetribusiTerbilang As String
        Public Property RetribusiTerbilang() As String
            Get
                Return fRetribusiTerbilang
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("RetribusiTerbilang", fRetribusiTerbilang, value)
            End Set
        End Property
        Dim fPerMeter As Decimal
        Public Property PerMeter() As Decimal
            Get
                Return (fPerMeter)
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("PerMeter", fPerMeter, value)
            End Set
        End Property
        Dim frek_id As Guid
        Public Property rek_id() As Guid
            Get
                Return (frek_id)
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("rek_id", frek_id, value)
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
