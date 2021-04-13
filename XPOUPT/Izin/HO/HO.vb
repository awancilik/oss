Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class HO
        Inherits XPLiteObject
        Dim fHOID As Guid
        <Key(True)> _
              Public Property HOID() As guid
            Get
                Return fHOID
            End Get
            Set(ByVal value As guid)
                SetPropertyValue(Of Guid)("HOID", fHOID, value)
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

        Dim fNoLama As String
        Public Property NoLama() As String
            Get
                Return fNoLama
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("NoLama", fNoLama, value)
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

		Dim fNamaPerusahaan As String
        Public Property NamaPerusahaan() As String
            Get
                Return fNamaPerusahaan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("NamaPerusahaan", fNamaPerusahaan, value)
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

        Dim fAlamatPemilik As String
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
        Dim fNPWD As String
        Public Property NPWD() As String
            Get
                Return fNPWD
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("NPWD", fNPWD, value)
            End Set
        End Property

        Dim fLokasiUsaha As String
        Public Property LokasiUsaha() As String
            Get
                Return fLokasiUsaha
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("LokasiUsaha", fLokasiUsaha, value)
            End Set
        End Property

        Dim fTaripLingkunganID As HOTaripLingkungan
        Public Property TaripLingkunganID() As HOTaripLingkungan
            Get
                Return fTaripLingkunganID
            End Get
            Set(ByVal value As HOTaripLingkungan)
                SetPropertyValue(Of HOTaripLingkungan)("TaripLingkunganID", fTaripLingkunganID, value)
            End Set
        End Property

        Dim fJenisLingkunganID As HOJenisLingkungan
        Public Property JenisLingkunganID() As HOJenisLingkungan
            Get
                Return fJenisLingkunganID
            End Get
            Set(ByVal value As HOJenisLingkungan)
                SetPropertyValue(Of HOJenisLingkungan)("JenisLingkunganID", fJenisLingkunganID, value)
            End Set
        End Property

        Dim fJenisGangguanID As HOIndeksGangguan
        Public Property JenisGangguanID() As HOIndeksGangguan
            Get
                Return fJenisGangguanID
            End Get
            Set(ByVal value As HOIndeksGangguan)
                SetPropertyValue(Of HOIndeksGangguan)("JenisGangguanID", fJenisGangguanID, value)
            End Set
        End Property
        Dim fJenisLokasiID As HOIndeksLokasi
        Public Property JenisLokasiID() As HOIndeksLokasi
            Get
                Return fJenisLokasiID
            End Get
            Set(ByVal value As HOIndeksLokasi)
                SetPropertyValue(Of HOIndeksLokasi)("JenisLokasiID", fJenisLokasiID, value)
            End Set
        End Property

        Dim fJenisUsahaID As HOJenisUsaha
        Public Property JenisUsahaID() As HOJenisUsaha
            Get
                Return fJenisUsahaID
            End Get
            Set(ByVal value As HOJenisUsaha)
                SetPropertyValue(Of HOJenisUsaha)("JenisUsahaID", fJenisUsahaID, value)
            End Set
        End Property

		Dim fPemilikTanah As String
        Public Property PemilikTanah() As String
            Get
                Return fPemilikTanah
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemilikTanah", fPemilikTanah, value)
            End Set
        End Property

		Dim fBentukPerusahaan As String
        Public Property BentukPerusahaan() As String
            Get
                Return fBentukPerusahaan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("BentukPerusahaan", fBentukPerusahaan, value)
            End Set
        End Property

		Dim fLetakPerusahaan As String
        Public Property LetakPerusahaan() As String
            Get
                Return fLetakPerusahaan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("LetakPerusahaan", fLetakPerusahaan, value)
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

		Dim fBatasBarat As String
        Public Property BatasBarat() As String
            Get
                Return fBatasBarat
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("BatasBarat", fBatasBarat, value)
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

		Dim fBatasSelatan As String
        Public Property BatasSelatan() As String
            Get
                Return fBatasSelatan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("BatasSelatan", fBatasSelatan, value)
            End Set
        End Property

		Dim fLuasKantor As Integer
		Public Property LuasKantor() As Integer
			Get
				Return fLuasKantor
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("LuasKantor", fLuasKantor, value)
			End Set
        End Property

		Dim fLuasGudang As Integer
		Public Property LuasGudang() As Integer
			Get
				Return fLuasGudang
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("LuasGudang", fLuasGudang, value)
			End Set
        End Property

        Dim fLuasUsaha As Decimal
        Public Property LuasUsaha() As Decimal
            Get
                Return fLuasUsaha
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("LuasUsaha", fLuasUsaha, value)
            End Set
        End Property

        Dim fUdara As String
        Public Property Udara() As String
            Get
                Return fUdara
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Udara", fUdara, value)
            End Set
        End Property

        Dim fAir As String
        Public Property Air() As String
            Get
                Return fAir
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Air", fAir, value)
            End Set
        End Property

        Dim fSuara As String
        Public Property Suara() As String
            Get
                Return fSuara
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Suara", fSuara, value)
            End Set
        End Property

        Dim fPerempuanDalamNegeri As Integer
        Public Property PerempuanDalamNegeri() As Integer
            Get
                Return fPerempuanDalamNegeri
            End Get
            Set(ByVal value As Integer)
                SetPropertyValue(Of Integer)("PerempuanDalamNegeri", fPerempuanDalamNegeri, value)
            End Set
        End Property

        Dim fPerempuanLuarNegeri As Integer
        Public Property PerempuanLuarNegeri() As Integer
            Get
                Return fPerempuanLuarNegeri
            End Get
            Set(ByVal value As Integer)
                SetPropertyValue(Of Integer)("PerempuanLuarNegeri", fPerempuanLuarNegeri, value)
            End Set
        End Property

        Dim fLakiDalamNegeri As Integer
        Public Property LakiDalamNegeri() As Integer
            Get
                Return fLakiDalamNegeri
            End Get
            Set(ByVal value As Integer)
                SetPropertyValue(Of Integer)("LakiDalamNegeri", fLakiDalamNegeri, value)
            End Set
        End Property

        Dim fLakiLuarNegeri As Integer
        Public Property LakiLuarNegeri() As Integer
            Get
                Return fLakiLuarNegeri
            End Get
            Set(ByVal value As Integer)
                SetPropertyValue(Of Integer)("LakiLuarNegeri", fLakiLuarNegeri, value)
            End Set
        End Property

        Dim fPenerimaHONama As String
        Public Property PenerimaHONama() As String
            Get
                Return fPenerimaHONama
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PenerimaHONama", fPenerimaHONama, value)
            End Set
        End Property

        Dim fPenerimaHOAlamat As String
        Public Property PenerimaHOAlamat() As String
            Get
                Return fPenerimaHOAlamat
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PenerimaHOAlamat", fPenerimaHOAlamat, value)
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

        Dim fTglDikeluarkan As DateTime
        Public Property TglDikeluarkan() As DateTime
            Get
                Return fTglDikeluarkan
            End Get
            Set(ByVal value As DateTime)
                SetPropertyValue(Of DateTime)("TglDikeluarkan", fTglDikeluarkan, value)
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

        Dim fTglPembayaran As DateTime
        Public Property TglPembayaran() As DateTime
            Get
                Return fTglPembayaran
            End Get
            Set(ByVal value As Date)
                SetPropertyValue(Of DateTime)("TglPembayaran", fTglPembayaran, value)
            End Set
        End Property

        Dim fTglBayarUlang As DateTime
        Public Property TglBayarUlang() As DateTime
            Get
                Return fTglBayarUlang
            End Get
            Set(ByVal value As DateTime)
                SetPropertyValue(Of DateTime)("TglBayarUlang", fTglBayarUlang, value)
            End Set
        End Property
        Dim fTglInput As DateTime
        Public Property TglInput() As DateTime
            Get
                Return fTglInput
            End Get
            Set(ByVal value As Date)
                SetPropertyValue(Of DateTime)("TglInput", fTglInput, value)
            End Set
        End Property
        Dim fMasaBerlaku As DateTime
        Public Property MasaBerlaku() As DateTime
            Get
                Return fMasaBerlaku
            End Get
            Set(ByVal value As DateTime)
                SetPropertyValue(Of DateTime)("MasaBerlaku", fMasaBerlaku, value)
            End Set
        End Property

        Dim fTglLama As DateTime
        Public Property TglLama() As DateTime
            Get
                Return fTglLama
            End Get
            Set(ByVal value As DateTime)
                SetPropertyValue(Of DateTime)("TglLama", fTglLama, value)
            End Set
        End Property

        Dim fLainLain As String
        Public Property LainLain() As String
            Get
                Return fLainLain
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("LainLain", fLainLain, value)
            End Set
        End Property

        Dim fNoSuratIzin As String
        Public Property NoSuratIzin() As String
            Get
                Return fNoSuratIzin
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("NoSuratIzin", fNoSuratIzin, value)
            End Set
        End Property

        Dim fTglSuratIzin As DateTime
        Public Property TglSuratIzin() As DateTime
            Get
                Return fTglSuratIzin
            End Get
            Set(ByVal value As DateTime)
                SetPropertyValue(Of DateTime)("TglSuratIzin", fTglSuratIzin, value)
            End Set
        End Property

        Dim fRetriDaftarUlang As Decimal
        Public Property RetriDaftarUlang() As Decimal
            Get
                Return fRetriDaftarUlang
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("RetriDaftarUlang", fRetriDaftarUlang, value)
            End Set
        End Property

        Dim fTerbilangDaftarUlang As String
        Public Property TerbilangDaftarUlang() As String
            Get
                Return fTerbilangDaftarUlang
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("TerbilangDaftarUlang", fTerbilangDaftarUlang, value)
            End Set
        End Property

        Dim fTglDftrUlang As DateTime
        Public Property TglDftrUlang() As DateTime
            Get
                Return fTglDftrUlang
            End Get
            Set(ByVal value As DateTime)
                SetPropertyValue(Of DateTime)("TglDftrUlang", fTglDftrUlang, value)
            End Set
        End Property

        Dim fTanahMilik As String
        Public Property TanahMilik() As String
            Get
                Return fTanahMilik
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("StatusBangunan", fTanahMilik, value)
            End Set
        End Property

        Dim fBerlakuSampai As DateTime
        Public Property BerlakuSampai() As DateTime
            Get
                Return fBerlakuSampai
            End Get
            Set(ByVal value As DateTime)
                SetPropertyValue(Of DateTime)("BerlakuSampai", fBerlakuSampai, value)
            End Set
        End Property

        Dim fLamaSewa As String
        Public Property LamaSewa() As String
            Get
                Return fLamaSewa
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("LamaSewa", fLamaSewa, value)
            End Set
        End Property

        Dim fTglTerbilang As String
        Public Property TglTerbilang() As String
            Get
                Return fTglTerbilang
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("TglTerbilang", fTglTerbilang, value)
            End Set
        End Property

        Dim fJmlTenagaKerja As Integer
        Public Property JmlTenagaKerja() As Integer
            Get
                Return fJmlTenagaKerja
            End Get
            Set(ByVal value As Integer)
                SetPropertyValue(Of Integer)("JmlTenagaKerja", fJmlTenagaKerja, value)
            End Set
        End Property

        Dim fMasaBerlakuDafUlang As String
        Public Property MasaBerlakuDafUlang() As String
            Get
                Return fMasaBerlakuDafUlang
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("MasaBerlakuDafUlang", fMasaBerlakuDafUlang, value)
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
