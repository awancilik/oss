Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class SIUP
		Inherits XPLiteObject
		Dim fSIUPID As Guid
		<Key(true)> _
		Public Property SIUPID() As Guid
			Get
				Return fSIUPID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("SIUPID", fSIUPID, value)
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
		Dim fNoIjin As String
        <Size(45)> _
  Public Property NoIjin() As String
            Get
                Return fNoIjin
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("NoIjin", fNoIjin, value)
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
		Dim fTglBerakhir As DateTime
		Public Property TglBerakhir() As DateTime
			Get
				Return fTglBerakhir
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("TglBerakhir", fTglBerakhir, value)
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
		Dim fNoLama As String
		<Size(30)> _
		Public Property NoLama() As String
			Get
				Return fNoLama
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NoLama", fNoLama, value)
			End Set
		End Property
		Dim fPerusahaanNama As String
		<Size(50)> _
		Public Property PerusahaanNama() As String
			Get
				Return fPerusahaanNama
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PerusahaanNama", fPerusahaanNama, value)
			End Set
        End Property
        Dim fPerusahaanBentukID As SIUPtBentuk
        Public Property PerusahaanBentukID() As SIUPtBentuk
            Get
                Return fPerusahaanBentukID
            End Get
            Set(ByVal value As SIUPtBentuk)
                SetPropertyValue(Of SIUPtBentuk)("PerusahaanBentukID", fPerusahaanBentukID, value)
            End Set
        End Property
		Dim fPerusahaanAlamat As String
		<Size(80)> _
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
		Dim fTelepon As String
		<Size(20)> _
		Public Property Telepon() As String
			Get
				Return fTelepon
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Telepon", fTelepon, value)
			End Set
		End Property
		Dim fFax As String
		<Size(20)> _
		Public Property Fax() As String
			Get
				Return fFax
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Fax", fFax, value)
			End Set
		End Property
		Dim fLokasiPerusahaan As String
		<Size(50)> _
		Public Property LokasiPerusahaan() As String
			Get
				Return fLokasiPerusahaan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("LokasiPerusahaan", fLokasiPerusahaan, value)
			End Set
		End Property
		Dim fStatusTempat As String
		<Size(50)> _
		Public Property StatusTempat() As String
			Get
				Return fStatusTempat
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("StatusTempat", fStatusTempat, value)
			End Set
		End Property
		Dim fNPWP As String
		<Size(45)> _
		Public Property NPWP() As String
			Get
				Return fNPWP
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NPWP", fNPWP, value)
			End Set
		End Property
		Dim fPemilikNama As String
		Public Property PemilikNama() As String
			Get
				Return fPemilikNama
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PemilikNama", fPemilikNama, value)
			End Set
		End Property
		Dim fPemilikTTL As String
		<Size(50)> _
		Public Property PemilikTTL() As String
			Get
				Return fPemilikTTL
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PemilikTTL", fPemilikTTL, value)
			End Set
		End Property
		Dim fPemilikAlamat As String
		<Size(50)> _
		Public Property PemilikAlamat() As String
			Get
				Return fPemilikAlamat
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PemilikAlamat", fPemilikAlamat, value)
			End Set
		End Property
		Dim fPemilikTelp As String
		<Size(20)> _
		Public Property PemilikTelp() As String
			Get
				Return fPemilikTelp
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PemilikTelp", fPemilikTelp, value)
			End Set
		End Property
		Dim fPemilikFax As String
		<Size(20)> _
		Public Property PemilikFax() As String
			Get
				Return fPemilikFax
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PemilikFax", fPemilikFax, value)
			End Set
		End Property
		Dim fPemilikSuamiIstriNama As String
		<Size(50)> _
		Public Property PemilikSuamiIstriNama() As String
			Get
				Return fPemilikSuamiIstriNama
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PemilikSuamiIstriNama", fPemilikSuamiIstriNama, value)
			End Set
		End Property
		Dim fPemilikSuamiIstriKewarganegaraan As String
		<Size(50)> _
		Public Property PemilikSuamiIstriKewarganegaraan() As String
			Get
				Return fPemilikSuamiIstriKewarganegaraan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PemilikSuamiIstriKewarganegaraan", fPemilikSuamiIstriKewarganegaraan, value)
			End Set
		End Property
        Dim fJenisIzinID As JenisIzin
        Public Property JenisIzinID() As JenisIzin
            Get
                Return fJenisIzinID
            End Get
            Set(ByVal value As JenisIzin)
                SetPropertyValue(Of JenisIzin)("JenisIzinID", fJenisIzinID, value)
            End Set
        End Property
		Dim fNamaNotaris As String
		Public Property NamaNotaris() As String
			Get
				Return fNamaNotaris
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NamaNotaris", fNamaNotaris, value)
			End Set
		End Property
        Dim fNoTglAkteNotaris As String
        <Size(45)> _
        Public Property NoTglAkteNotaris() As String
            Get
                Return fNoTglAkteNotaris
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("NoTglAkteNotaris", fNoTglAkteNotaris, value)
            End Set
        End Property
        Dim fNoTglPengesahan As String
        <Size(45)> _
        Public Property NoTglPengesahan() As String
            Get
                Return fNoTglPengesahan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("NoTglPengesahan", fNoTglPengesahan, value)
            End Set
        End Property
        Dim fNoTglAktePendirianPerusahaan As String
        <Size(45)> _
        Public Property NoTglAktePendirianPerusahaan() As String
            Get
                Return fNoTglAktePendirianPerusahaan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("NoTglAktePendirianPerusahaan", fNoTglAktePendirianPerusahaan, value)
            End Set
        End Property
		Dim fIzinYgDimiliki As String
		Public Property IzinYgDimiliki() As String
			Get
				Return fIzinYgDimiliki
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("IzinYgDimiliki", fIzinYgDimiliki, value)
			End Set
        End Property
        Dim fKategori As String
        Public Property Kategori() As String
            Get
                Return fKategori
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Kategori", fKategori, value)
            End Set
        End Property
		Dim fModal As Decimal
		Public Property Modal() As Decimal
			Get
				Return fModal
			End Get
			Set(ByVal value As Decimal)
				SetPropertyValue(Of Decimal)("Modal", fModal, value)
			End Set
        End Property
        Dim fModalTerbilang As String
        Public Property ModalTerbilang() As String
            Get
                Return fModalTerbilang
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("ModalTerbilang", fModalTerbilang, value)
            End Set
        End Property
		Dim fKelembagaan As String
		<Size(50)> _
		Public Property Kelembagaan() As String
			Get
				Return fKelembagaan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Kelembagaan", fKelembagaan, value)
			End Set
		End Property
		Dim fJenisBarangJasaDagangan As String
		<Size(SizeAttribute.Unlimited)> _
		Public Property JenisBarangJasaDagangan() As String
			Get
				Return fJenisBarangJasaDagangan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("JenisBarangJasaDagangan", fJenisBarangJasaDagangan, value)
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
        Dim fTglPembayaran As Date
        Public Property TglPembayaran() As Date
            Get
                Return fTglPembayaran
            End Get
            Set(ByVal value As Date)
                SetPropertyValue(Of Date)("TglPembayaran", fTglPembayaran, value)
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
        Dim fPenerimaSIUPNama As String
        Public Property PenerimaSIUPNama() As String
            Get
                Return fPenerimaSIUPNama
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PenerimaSIUPNama", fPenerimaSIUPNama, value)
            End Set
        End Property
        Dim fPenerimaSIUPAlamat As String
        Public Property PenerimaSIUPAlamat() As String
            Get
                Return fPenerimaSIUPAlamat
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PenerimaSIUPAlamat", fPenerimaSIUPAlamat, value)
            End Set
        End Property
        Dim fMerk As String
        Public Property Merk() As String
            Get
                Return fMerk
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Merk", fMerk, value)
            End Set
        End Property
        Dim fCounter As Integer
        Public Property Counter() As Integer
            Get
                Return fCounter
            End Get
            Set(ByVal value As Integer)
                SetPropertyValue(Of Integer)("Counter", fCounter, value)
            End Set
        End Property
        Dim fMaksud As String
        Public Property Maksud() As String
            Get
                Return fMaksud
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Maksud", fMaksud, value)
            End Set
        End Property
        Dim fKegUsaha As String
        Public Property KegUsaha() As String
            Get
                Return fKegUsaha
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("KegUsaha", fKegUsaha, value)
            End Set
        End Property
        Dim fNoSebelumPerubahan As String
        Public Property NoSebelumPerubahan() As String
            Get
                Return fNoSebelumPerubahan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("NoSebelumPerubahan", fNoSebelumPerubahan, value)
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
        <Association("SIUP-SIUPMaksudDetal")> _
        Public ReadOnly Property SIUPMaksudDetal() As XPCollection(Of SIUPMaksudDetal)
            Get
                Return GetCollection(Of SIUPMaksudDetal)("SIUPMaksudDetal")
            End Get
        End Property
        <Association("SIUP-SIUPJenisKLUI")> _
        Public ReadOnly Property SIUPJenisKLUI() As XPCollection(Of SIUPJenisKLUI)
            Get
                Return GetCollection(Of SIUPJenisKLUI)("SIUPJenisKLUI")
            End Get
        End Property
        <Association("SIUP-SIUPBank")> _
       Public ReadOnly Property SIUPBank() As XPCollection(Of SIUPbank)
            Get
                Return GetCollection(Of SIUPbank)("SIUPBank")
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
