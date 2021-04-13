Imports System
Imports DevExpress.Xpo

Namespace OSS

	Public Class IMBRetribusi
        Inherits XPLiteObject

        <Association("IMBRETRIBUSI-IMBRETRIBUSIDETAILS")> _
        Public ReadOnly Property IMBRETRIBUSI_IMBRETRIBUSIDETAILS() As XPCollection(Of IMBRetribusiDetails)
            Get
                Return GetCollection(Of IMBRetribusiDetails)("IMBRETRIBUSI_IMBRETRIBUSIDETAILS")
            End Get
        End Property

        Dim fRow_id As Guid
        <Key(True)> _
        Public Property Row_id() As Guid
            Get
                Return fRow_id
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("Row_id", fRow_id, value)
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

        Dim fTglPembayaranIPB As DateTime
        Public Property TglPembayaranIPB() As DateTime
            Get
                Return fTglPembayaranIPB
            End Get
            Set(ByVal value As DateTime)
                SetPropertyValue(Of DateTime)("TglPembayaran", fTglPembayaranIPB, value)
            End Set
        End Property

        Dim fimbid As IMB
        <Association("IMB-IMBRETRIBUSI"), Aggregated()> _
        Public Property imbid() As IMB
            Get
                Return fimbid
            End Get
            Set(ByVal value As IMB)
                SetPropertyValue(Of IMB)("imbid", fimbid, value)
            End Set
        End Property

        Dim frek_id As String
        Public Property rek_id() As String
            Get
                Return frek_id
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("rek_id", frek_id, value)
            End Set
        End Property

        Dim frek_ipb As String
        Public Property rek_ipb() As String
            Get
                Return frek_ipb
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("rek_ipb", frek_ipb, value)
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

        'Dim fRetribusiIPB As Decimal
        'Public ReadOnly Property RetribusiIPB() As Decimal
        '    Get
        '        Return fRetribusiIPB
        '    End Get
        'End Property

		Dim fPapanNama As Decimal
		Public Property PapanNama() As Decimal
			Get
				Return fPapanNama
			End Get
			Set(ByVal value As Decimal)
				SetPropertyValue(Of Decimal)("PapanNama", fPapanNama, value)
			End Set
        End Property

		Dim fLeges As Decimal
		Public Property Leges() As Decimal
			Get
				Return fLeges
			End Get
			Set(ByVal value As Decimal)
				SetPropertyValue(Of Decimal)("Leges", fLeges, value)
			End Set
        End Property

		Dim fJatuhTempo As DateTime
		Public Property JatuhTempo() As DateTime
			Get
				Return fJatuhTempo
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("JatuhTempo", fJatuhTempo, value)
			End Set
        End Property

		Dim fDenda As Decimal
		Public Property Denda() As Decimal
			Get
				Return fDenda
			End Get
			Set(ByVal value As Decimal)
				SetPropertyValue(Of Decimal)("Denda", fDenda, value)
			End Set
        End Property

        Dim fTerbilang As String
		<Size(500)> _
		Public Property Terbilang() As String
			Get
				Return fTerbilang
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Terbilang", fTerbilang, value)
			End Set
        End Property

		Dim fKeterangan As String
		<Size(1000)> _
		Public Property Keterangan() As String
			Get
				Return fKeterangan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Keterangan", fKeterangan, value)
			End Set
        End Property

        Dim fDaerah As Decimal
        Public Property Daerah() As Decimal
            Get
                Return fDaerah
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("Daerah", fDaerah, value)
            End Set
        End Property

        Dim fKelasJalan As Decimal
        Public Property KelasJalan() As Decimal
            Get
                Return fKelasJalan
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("KelasJalan", fKelasJalan, value)
            End Set
        End Property

        Dim fKelasBangunan As Decimal
        Public Property KelasBangunan() As Decimal
            Get
                Return fKelasBangunan
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("KelasBangunan", fKelasBangunan, value)
            End Set
        End Property

        Dim fStatusBangunan As Decimal
        Public Property StatusBangunan() As Decimal
            Get
                Return fStatusBangunan
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("StatusBangunan", fStatusBangunan, value)
            End Set
        End Property

        Dim fGunaBangunan As Decimal
        Public Property GunaBangunan() As Decimal
            Get
                Return fGunaBangunan
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("GunaBangunan", fGunaBangunan, value)
            End Set
        End Property

        Dim fTingkatBangunan As Decimal
        Public Property TingkatBangunan() As Decimal
            Get
                Return fTingkatBangunan
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("TingkatBangunan", fTingkatBangunan, value)
            End Set
        End Property

        Dim fLuasBangunan As Decimal
        Public Property LuasBangunan() As Decimal
            Get
                Return fLuasBangunan
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("LuasBangunan", fLuasBangunan, value)
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
