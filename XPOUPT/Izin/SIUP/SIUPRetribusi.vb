Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class SIUPRetribusi
		Inherits XPLiteObject
		Dim fSIUPRetribusiID As Guid
		<Key(true)> _
		Public Property SIUPRetribusiID() As Guid
			Get
				Return fSIUPRetribusiID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("SIUPRetribusiID", fSIUPRetribusiID, value)
			End Set
		End Property
		Dim fNoIjin As String
		<Size(30)> _
		Public Property NoIjin() As String
			Get
				Return fNoIjin
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NoIjin", fNoIjin, value)
			End Set
		End Property
		Dim fRetribusi As Integer
		Public Property Retribusi() As Integer
			Get
				Return fRetribusi
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("Retribusi", fRetribusi, value)
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
