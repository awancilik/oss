Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class LokasiRetribusi
		Inherits XPLiteObject
		Dim fLokasiRetribusiID As Guid
		<Key(true)> _
		Public Property LokasiRetribusiID() As Guid
			Get
				Return fLokasiRetribusiID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("LokasiRetribusiID", fLokasiRetribusiID, value)
			End Set
		End Property
        Dim fLokasiID As Lokasi
        Public Property LokasiID() As Lokasi
            Get
                Return fLokasiID
            End Get
            Set(ByVal value As Lokasi)
                SetPropertyValue(Of Lokasi)("LokasiID", fLokasiID, value)
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
		Dim fJatuhTempo As DateTime
		Public Property JatuhTempo() As DateTime
			Get
				Return fJatuhTempo
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("JatuhTempo", fJatuhTempo, value)
			End Set
		End Property
		Dim fDenda As Integer
		Public Property Denda() As Integer
			Get
				Return fDenda
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("Denda", fDenda, value)
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
		Dim fHDPPTPeruntukan As String
		<Size(50)> _
		Public Property HDPPTPeruntukan() As String
			Get
				Return fHDPPTPeruntukan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("HDPPTPeruntukan", fHDPPTPeruntukan, value)
			End Set
		End Property
		Dim fHDPPTJenis As String
		<Size(20)> _
		Public Property HDPPTJenis() As String
			Get
				Return fHDPPTJenis
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("HDPPTJenis", fHDPPTJenis, value)
			End Set
		End Property
		Dim fHDPPTHarga As Decimal
		Public Property HDPPTHarga() As Decimal
			Get
				Return fHDPPTHarga
			End Get
			Set(ByVal value As Decimal)
				SetPropertyValue(Of Decimal)("HDPPTHarga", fHDPPTHarga, value)
			End Set
		End Property
        Dim fIP As LokasiIP
        Public Property IP() As LokasiIP
            Get
                Return fIP
            End Get
            Set(ByVal value As LokasiIP)
                SetPropertyValue(Of LokasiIP)("IP", fIP, value)
            End Set
        End Property
        Dim fIU As LokasiIU
        Public Property IU() As LokasiIU
            Get
                Return fIU
            End Get
            Set(ByVal value As LokasiIU)
                SetPropertyValue(Of LokasiIU)("IU", fIU, value)
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
        Dim frek_id As String
        Public Property rek_id() As String
            Get
                Return frek_id
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("rek_id", frek_id, value)
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
