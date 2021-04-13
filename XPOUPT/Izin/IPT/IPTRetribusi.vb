Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IPTRetribusi
		Inherits XPLiteObject
		Dim fIPTRetribusiID As Guid
		<Key(true)> _
		Public Property IPTRetribusiID() As Guid
			Get
				Return fIPTRetribusiID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IPTRetribusiID", fIPTRetribusiID, value)
			End Set
		End Property
        Dim fIPTID As IPT
        Public Property IPTID() As IPT
            Get
                Return fIPTID
            End Get
            Set(ByVal value As IPT)
                SetPropertyValue(Of IPT)("IPTID", fIPTID, value)
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
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("TglPembayaran", fTglPembayaran, value)
			End Set
		End Property
		Dim fJumlahDibulatkan As Double
		Public Property JumlahDibulatkan() As Double
			Get
				Return fJumlahDibulatkan
			End Get
			Set(ByVal value As Double)
				SetPropertyValue(Of Double)("JumlahDibulatkan", fJumlahDibulatkan, value)
			End Set
        End Property
        Dim fHasilRetribusi As Double
        Public Property HasilRetribusi() As Double
            Get
                Return fHasilRetribusi
            End Get
            Set(ByVal value As Double)
                SetPropertyValue(Of Double)("HasilRetribusi", fHasilRetribusi, value)
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
