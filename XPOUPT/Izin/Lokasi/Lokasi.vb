Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class Lokasi
		Inherits XPLiteObject
		Dim fLokasiID As Guid
		<Key(true)> _
		Public Property LokasiID() As Guid
			Get
				Return fLokasiID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("LokasiID", fLokasiID, value)
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
        Public Property NamaPemilik() As String
            Get
                Return fNamaPemilik
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("NamaPemilik", fNamaPemilik, value)
            End Set
        End Property
		Dim fJenisUsaha As String
		<Size(50)> _
		Public Property JenisUsaha() As String
			Get
				Return fJenisUsaha
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("JenisUsaha", fJenisUsaha, value)
			End Set
		End Property
		Dim fNamaBadanUsaha As String
		<Size(50)> _
		Public Property NamaBadanUsaha() As String
			Get
				Return fNamaBadanUsaha
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NamaBadanUsaha", fNamaBadanUsaha, value)
			End Set
		End Property
		Dim fAlamatPemilik As String
		<Size(50)> _
		Public Property AlamatPemilik() As String
			Get
				Return fAlamatPemilik
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("AlamatPemilik", fAlamatPemilik, value)
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
        Dim fPemilikKecamatanID As Kecamatan
        Public Property PemilikKecamatanID() As Kecamatan
            Get
                Return fPemilikKecamatanID
            End Get
            Set(ByVal value As Kecamatan)
                SetPropertyValue(Of Kecamatan)("PemilikKecamatanID", fPemilikKecamatanID, value)
            End Set
        End Property
        Dim fPemilikKabupatenID As Kabupaten
        Public Property PemilikKabupatenID() As Kabupaten
            Get
                Return fPemilikKabupatenID
            End Get
            Set(ByVal value As Kabupaten)
                SetPropertyValue(Of Kabupaten)("PemilikKabupatenID", fPemilikKabupatenID, value)
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
        Dim fPemilikTelpon As String
        Public Property PemilikTelpon() As String
            Get
                Return fPemilikTelpon
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemilikTelpon", fPemilikTelpon, value)
            End Set
        End Property
        Dim fPemilikFax As String
        Public Property PemilikFax() As String
            Get
                Return fPemilikFax
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemilikFax", fPemilikFax, value)
            End Set
        End Property

		Dim fAktePendirian As String
		<Size(50)> _
		Public Property AktePendirian() As String
			Get
				Return fAktePendirian
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("AktePendirian", fAktePendirian, value)
			End Set
        End Property

		Dim fNPWP As String
		<Size(50)> _
		Public Property NPWP() As String
			Get
				Return fNPWP
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NPWP", fNPWP, value)
			End Set
		End Property
		Dim fLuas As Double
		Public Property Luas() As Double
			Get
				Return fLuas
			End Get
			Set(ByVal value As Double)
				SetPropertyValue(Of Double)("Luas", fLuas, value)
			End Set
		End Property
        Dim fLokasiKelurahanID As Kelurahan
        Public Property LokasiKelurahanID() As Kelurahan
            Get
                Return fLokasiKelurahanID
            End Get
            Set(ByVal value As Kelurahan)
                SetPropertyValue(Of Kelurahan)("LokasiLokasiKelurahanID", fLokasiKelurahanID, value)
            End Set
        End Property
        Dim fLokasiKecamatanID As Kecamatan
        Public Property LokasiKecamatanID() As Kecamatan
            Get
                Return fLokasiKecamatanID
            End Get
            Set(ByVal value As Kecamatan)
                SetPropertyValue(Of Kecamatan)("LokasiLokasiKecamatanID", fLokasiKecamatanID, value)
            End Set
        End Property
        Dim fLokasiKabupatenID As Kabupaten
        Public Property LokasiKabupatenID() As Kabupaten
            Get
                Return fLokasiKabupatenID
            End Get
            Set(ByVal value As Kabupaten)
                SetPropertyValue(Of Kabupaten)("LokasiLokasiKabupatenID", fLokasiKabupatenID, value)
            End Set
        End Property
        Dim fLokasiKodePos As String
        Public Property LokasiKodePos() As String
            Get
                Return fLokasiKodePos
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("LokasiKodePos", fLokasiKodePos, value)
            End Set
        End Property
        Dim fStatusTanahID As tanah
        Public Property StatusTanahID() As tanah
            Get
                Return fStatusTanahID
            End Get
            Set(ByVal value As tanah)
                SetPropertyValue(Of tanah)("StatusTanahID", fStatusTanahID, value)
            End Set
        End Property
		Dim fPenggunaanSekarang As String
		<Size(50)> _
		Public Property PenggunaanSekarang() As String
			Get
				Return fPenggunaanSekarang
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PenggunaanSekarang", fPenggunaanSekarang, value)
			End Set
		End Property
		Dim fTanggalTerbit As DateTime
		Public Property TanggalTerbit() As DateTime
			Get
				Return fTanggalTerbit
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("TanggalTerbit", fTanggalTerbit, value)
			End Set
        End Property

        Dim fNoIzin As String
        Public Property NoIzin() As String
            Get
                Return fNoIzin
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("NoIzin", fNoIzin, value)
            End Set
        End Property
        Dim fPerusahaanNama As String
        Public Property PerusahaanNama() As String
            Get
                Return fPerusahaanNama
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PerusahaanNama", fPerusahaanNama, value)
            End Set
        End Property
        Dim fPerusahaanAlamat As String
        <Size(50)> _
        Public Property PerusahaanAlamat() As String
            Get
                Return fPerusahaanAlamat
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PerusahaanAlamat", fPerusahaanAlamat, value)
            End Set
        End Property
        Dim fPerusahaanKelurahanID As Kelurahan
        Public Property PerusahaanKelurahanID() As Kelurahan
            Get
                Return fPerusahaanKelurahanID
            End Get
            Set(ByVal value As Kelurahan)
                SetPropertyValue(Of Kelurahan)("PerusahaanKelurahanID", fPerusahaanKelurahanID, value)
            End Set
        End Property
        Dim fPerusahaanKecamatanID As Kecamatan
        Public Property PerusahaanKecamatanID() As Kecamatan
            Get
                Return fPerusahaanKecamatanID
            End Get
            Set(ByVal value As Kecamatan)
                SetPropertyValue(Of Kecamatan)("PerusahaanKecamatanID", fPerusahaanKecamatanID, value)
            End Set
        End Property
        Dim fPerusahaanKabupatenID As Kabupaten
        Public Property PerusahaanKabupatenID() As Kabupaten
            Get
                Return fPerusahaanKabupatenID
            End Get
            Set(ByVal value As Kabupaten)
                SetPropertyValue(Of Kabupaten)("PerusahaanKabupatenID", fPerusahaanKabupatenID, value)
            End Set
        End Property
        Dim fPerusahaanRT As String
        Public Property PerusahaanRT() As String
            Get
                Return fPerusahaanRT
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PerusahaanRT", fPerusahaanRT, value)
            End Set
        End Property
        Dim fPerusahaanRW As String
        Public Property PerusahaanRW() As String
            Get
                Return fPerusahaanRW
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PerusahaanRW", fPerusahaanRW, value)
            End Set
        End Property
        Dim fPerusahaanTelpon As String
        Public Property PerusahaanTelpon() As String
            Get
                Return fPerusahaanTelpon
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PerusahaanTelpon", fPerusahaanTelpon, value)
            End Set
        End Property
        Dim fPerusahaanKodepos As String
        Public Property PerusahaanKodepos() As String
            Get
                Return fPerusahaanKodepos
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PerusahaanKodepos", fPerusahaanKodepos, value)
            End Set
        End Property
        Dim fTujuan As String
        Public Property Tujuan() As String
            Get
                Return fTujuan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Tujuan", fTujuan, value)
            End Set
        End Property
        Dim fPerusahaanFax As String
        Public Property PerusahaanFax() As String
            Get
                Return fPerusahaanFax
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PerusahaanFax", fPerusahaanFax, value)
            End Set
        End Property
        Dim fPenerimaLokasiNama As String
        Public Property PenerimaLokasiNama() As String
            Get
                Return fPenerimaLokasiNama
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PenerimaLokasiNama", fPenerimaLokasiNama, value)
            End Set
        End Property
        Dim fPenerimaLokasiAlamat As String
        Public Property PenerimaLokasiAlamat() As String
            Get
                Return fPenerimaLokasiAlamat
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PenerimaLokasiAlamat", fPenerimaLokasiAlamat, value)
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
