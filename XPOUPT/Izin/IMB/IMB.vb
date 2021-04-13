Imports System
Imports DevExpress.Xpo

Namespace OSS

	Public Class IMB
        Inherits XPLiteObject

        <Association("IMB-IMBRETRIBUSI")> _
        Public ReadOnly Property IMB_IMBRETRIBUSI() As XPCollection(Of IMBRetribusi)
            Get
                Return GetCollection(Of IMBRetribusi)("IMB_IMBRETRIBUSI")
            End Get
        End Property

        Dim fIMBID As Guid
        <Key()> _
        Public Property IMBID() As Guid
            Get
                Return fIMBID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("IMBID", fIMBID, value)
            End Set
        End Property
        Dim fNoIjin As String
        Public Property NoIjin() As String
            Get
                Return fNoIjin
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("NoIjin", fNoIjin, value)
            End Set
        End Property

        Dim fPenerimaIMBNama As String
        Public Property PenerimaIMBNama() As String
            Get
                Return fPenerimaIMBNama
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PenerimaIMBNama", fPenerimaIMBNama, value)
            End Set
        End Property

        Dim fPenerimaIMBAlamat As String
        Public Property PenerimaIMBAlamat() As String
            Get
                Return fPenerimaSMTAlamat
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PenerimaIMBAlamat", fPenerimaIMBAlamat, value)
            End Set
        End Property

        Dim fNoIjinSementara As String
        Public Property NoIjinSementara() As String
            Get
                Return fNoIjinSementara
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("NoIjinSementara", fNoIjinSementara, value)
            End Set
        End Property

        Dim fTglNoIjinSementara As DateTime
        Public Property TglNoIjinSementara() As DateTime
            Get
                Return fTglNoIjinSementara
            End Get
            Set(ByVal value As DateTime)
                SetPropertyValue(Of DateTime)("TglNoIjinSementara", fTglNoIjinSementara, value)
            End Set
        End Property

        Dim fPenerimaSMTNama As String
        Public Property PenerimaSMTNama() As String
            Get
                Return fPenerimaSMTNama
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PenerimaSMTNama", fPenerimaSMTNama, value)
            End Set
        End Property

        Dim fPenerimaSMTAlamat As String
        Public Property PenerimaSMTAlamat() As String
            Get
                Return fPenerimaSMTAlamat
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PenerimaSMTAlamat", fPenerimaSMTAlamat, value)
            End Set
        End Property

        Dim fNoIjinIPB As String
        Public Property NoIjinIPB() As String
            Get
                Return fNoIjinIPB
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("NoIjinIPB", fNoIjinIPB, value)
            End Set
        End Property

        Dim fTglNoIjinIPB As DateTime
        Public Property TglNoIjinIPB() As DateTime
            Get
                Return fTglNoIjinIPB
            End Get
            Set(ByVal value As DateTime)
                SetPropertyValue(Of DateTime)("TglNoIjinIPB", fTglNoIjinIPB, value)
            End Set
        End Property

        Dim fPenerimaIPBNama As String
        Public Property PenerimaIPBNama() As String
            Get
                Return fPenerimaIPBNama
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PenerimaIPBNama", fPenerimaIPBNama, value)
            End Set
        End Property

        Dim fPenerimaIPBAlamat As String
        Public Property PenerimaIPBAlamat() As String
            Get
                Return fPenerimaIPBAlamat
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PenerimaIPBAlamat", fPenerimaIPBAlamat, value)
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

        Dim fPermohonanID As Permohonan
        Public Property permohonanID() As Permohonan
            Get
                Return fPermohonanID
            End Get
            Set(ByVal value As Permohonan)
                SetPropertyValue(Of Permohonan)("permohonanID", fPermohonanID, value)
            End Set
        End Property

        Dim fNoKTP As String
		<Size(30)> _
		Public Property NoKTP() As String
			Get
				Return fNoKTP
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NoKTP", fNoKTP, value)
			End Set
		End Property
		Dim fNama As String
		<Size(50)> _
		Public Property Nama() As String
			Get
				Return fNama
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Nama", fNama, value)
			End Set
		End Property
		Dim fAlamat As String
		<Size(50)> _
		Public Property Alamat() As String
			Get
				Return fAlamat
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Alamat", fAlamat, value)
			End Set
		End Property
		Dim fRT As Byte
		Public Property RT() As Byte
			Get
				Return fRT
			End Get
			Set(ByVal value As Byte)
				SetPropertyValue(Of Byte)("RT", fRT, value)
			End Set
		End Property
		Dim fRW As Byte
		Public Property RW() As Byte
			Get
				Return fRW
			End Get
			Set(ByVal value As Byte)
				SetPropertyValue(Of Byte)("RW", fRW, value)
			End Set
		End Property
		Dim fKelurahan As String
		<Size(50)> _
		Public Property Kelurahan() As String
			Get
				Return fKelurahan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Kelurahan", fKelurahan, value)
			End Set
		End Property
		Dim fKecamatan As String
		<Size(50)> _
		Public Property Kecamatan() As String
			Get
				Return fKecamatan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Kecamatan", fKecamatan, value)
			End Set
		End Property
		Dim fKabupatenID As Guid
		Public Property KabupatenID() As Guid
			Get
				Return fKabupatenID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("KabupatenID", fKabupatenID, value)
			End Set
		End Property
		Dim fKodePos As String
		<Size(5)> _
		Public Property KodePos() As String
			Get
				Return fKodePos
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("KodePos", fKodePos, value)
			End Set
		End Property
		Dim fTelp As String
		<Size(20)> _
		Public Property Telp() As String
			Get
				Return fTelp
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Telp", fTelp, value)
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
		Dim fTujuanID As Guid
		Public Property TujuanID() As Guid
			Get
				Return fTujuanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("TujuanID", fTujuanID, value)
			End Set
		End Property
		Dim fPelaksanaID As Guid
		Public Property PelaksanaID() As Guid
			Get
				Return fPelaksanaID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("PelaksanaID", fPelaksanaID, value)
			End Set
		End Property
		Dim flksAlamat As String
		<Size(50)> _
		Public Property lksAlamat() As String
			Get
				Return flksAlamat
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("lksAlamat", flksAlamat, value)
			End Set
		End Property
		Dim flksRT As Byte
		Public Property lksRT() As Byte
			Get
				Return flksRT
			End Get
			Set(ByVal value As Byte)
				SetPropertyValue(Of Byte)("lksRT", flksRT, value)
			End Set
		End Property
		Dim flksRW As Byte
		Public Property lksRW() As Byte
			Get
				Return flksRW
			End Get
			Set(ByVal value As Byte)
				SetPropertyValue(Of Byte)("lksRW", flksRW, value)
			End Set
		End Property
		Dim flksKelurahanID As Guid
		Public Property lksKelurahanID() As Guid
			Get
				Return flksKelurahanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("lksKelurahanID", flksKelurahanID, value)
			End Set
		End Property
		Dim flksKodePos As String
		<Size(5)> _
		Public Property lksKodePos() As String
			Get
				Return flksKodePos
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("lksKodePos", flksKodePos, value)
			End Set
		End Property
		Dim fNoSertifikat As String
		<Size(50)> _
		Public Property NoSertifikat() As String
			Get
				Return fNoSertifikat
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NoSertifikat", fNoSertifikat, value)
			End Set
		End Property
		Dim fLuas As Single
		Public Property Luas() As Single
			Get
				Return fLuas
			End Get
			Set(ByVal value As Single)
				SetPropertyValue(Of Single)("Luas", fLuas, value)
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
        Dim fJenisBangunanID As IMBbangunan
        Public Property JenisBangunanID() As IMBbangunan
            Get
                Return fJenisBangunanID
            End Get
            Set(ByVal value As IMBbangunan)
                SetPropertyValue(Of IMBbangunan)("JenisBangunanID", fJenisBangunanID, value)
            End Set
        End Property
		Dim fNoPersil As String
		<Size(50)> _
		Public Property NoPersil() As String
			Get
				Return fNoPersil
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NoPersil", fNoPersil, value)
			End Set
		End Property
		Dim fPmlkTanah As String
		<Size(50)> _
		Public Property PmlkTanah() As String
			Get
				Return fPmlkTanah
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PmlkTanah", fPmlkTanah, value)
			End Set
		End Property
		Dim fPmlkSertifikat As String
		<Size(50)> _
		Public Property PmlkSertifikat() As String
			Get
				Return fPmlkSertifikat
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PmlkSertifikat", fPmlkSertifikat, value)
			End Set
		End Property
		Dim fTiang As String
		<Size(50)> _
		Public Property Tiang() As String
			Get
				Return fTiang
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Tiang", fTiang, value)
			End Set
		End Property
		Dim fUsuk As String
		<Size(50)> _
		Public Property Usuk() As String
			Get
				Return fUsuk
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Usuk", fUsuk, value)
			End Set
		End Property
		Dim fRangkaKap As String
		<Size(50)> _
		Public Property RangkaKap() As String
			Get
				Return fRangkaKap
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("RangkaKap", fRangkaKap, value)
			End Set
		End Property
		Dim fDinding As String
		<Size(50)> _
		Public Property Dinding() As String
			Get
				Return fDinding
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Dinding", fDinding, value)
			End Set
		End Property
		Dim fPondasi As String
		<Size(50)> _
		Public Property Pondasi() As String
			Get
				Return fPondasi
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Pondasi", fPondasi, value)
			End Set
		End Property
		Dim fReng As String
		<Size(50)> _
		Public Property Reng() As String
			Get
				Return fReng
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Reng", fReng, value)
			End Set
		End Property
		Dim fLantai As String
		<Size(50)> _
		Public Property Lantai() As String
			Get
				Return fLantai
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Lantai", fLantai, value)
			End Set
		End Property
		Dim fPenutupKap As String
		<Size(50)> _
		Public Property PenutupKap() As String
			Get
				Return fPenutupKap
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PenutupKap", fPenutupKap, value)
			End Set
		End Property
		Dim fJarak As Single
		Public Property Jarak() As Single
			Get
				Return fJarak
			End Get
			Set(ByVal value As Single)
				SetPropertyValue(Of Single)("Jarak", fJarak, value)
			End Set
		End Property
		Dim fNamaJalan As String
		<Size(50)> _
		Public Property NamaJalan() As String
			Get
				Return fNamaJalan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NamaJalan", fNamaJalan, value)
			End Set
		End Property
		Dim fNomorSK As String
		<Size(30)> _
		Public Property NomorSK() As String
			Get
				Return fNomorSK
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NomorSK", fNomorSK, value)
			End Set
		End Property
		Dim fStartDate As String
		<Size(20)> _
		Public Property StartDate() As String
			Get
				Return fStartDate
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("StartDate", fStartDate, value)
			End Set
		End Property
		Dim fEndDate As String
		<Size(20)> _
		Public Property EndDate() As String
			Get
				Return fEndDate
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("EndDate", fEndDate, value)
			End Set
		End Property
		Dim fLuasBangunan As Single
		Public Property LuasBangunan() As Single
			Get
				Return fLuasBangunan
			End Get
			Set(ByVal value As Single)
				SetPropertyValue(Of Single)("LuasBangunan", fLuasBangunan, value)
			End Set
		End Property
		Dim fFungsiBangunan As String
		<Size(500)> _
		Public Property FungsiBangunan() As String
			Get
				Return fFungsiBangunan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("FungsiBangunan", fFungsiBangunan, value)
			End Set
		End Property
		Dim fGSP As Integer
		Public Property GSP() As Integer
			Get
				Return fGSP
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("GSP", fGSP, value)
			End Set
		End Property
		Dim fGSB As Integer
		Public Property GSB() As Integer
			Get
				Return fGSB
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("GSB", fGSB, value)
			End Set
		End Property
        Dim fKDB As Decimal
        Public Property KDB() As Decimal
            Get
                Return fKDB
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("KDB", fKDB, value)
            End Set
        End Property
		Dim fNilaiBangunan As Decimal
		Public Property NilaiBangunan() As Decimal
			Get
				Return fNilaiBangunan
			End Get
			Set(ByVal value As Decimal)
				SetPropertyValue(Of Decimal)("NilaiBangunan", fNilaiBangunan, value)
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
        Public Property PerusahaanAlamat() As String
            Get
                Return fPerusahaanAlamat
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PerusahaanAlamat", fPerusahaanAlamat, value)
            End Set
        End Property

        Dim fPerusahaanKodePos As String
        Public Property PerusahaanKodePos() As String
            Get
                Return fPerusahaanKodePos
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PerusahaanKodePos", fPerusahaanKodePos, value)
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

        Dim fPerusahaanKabupatenID As Guid
        Public Property PerusahaanKabupatenID() As Guid
            Get
                Return fPerusahaanKabupatenID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("PerusahaanKabupatenID", fPerusahaanKabupatenID, value)
            End Set
        End Property


        Dim fPerusahaanKecamatanID As Guid
        Public Property PerusahaanKecamatanID() As Guid
            Get
                Return fPerusahaanKecamatanID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("PerusahaanKecamatanID", fPerusahaanKecamatanID, value)
            End Set
        End Property

        Dim fPerusahaanKelurahanID As Guid
        Public Property PerusahaanKelurahanID() As Guid
            Get
                Return fPerusahaanKelurahanID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("PerusahaanKelurahanID", fPerusahaanKelurahanID, value)
            End Set
        End Property

        Dim fPerusahaanTelepon As String
        Public Property PerusahaanTelepon() As String
            Get
                Return fPerusahaanTelepon
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PerusahaanTelepon", fPerusahaanTelepon, value)
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

        Dim fPermohonanLogID As TrackingPermohonan
        Public Property PermohonanLogID() As TrackingPermohonan
            Get
                Return fPermohonanLogID
            End Get
            Set(ByVal value As TrackingPermohonan)
                SetPropertyValue(Of TrackingPermohonan)("PermohoanLogID", fPermohonanLogID, value)
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
