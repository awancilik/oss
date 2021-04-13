Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class TDPBiaya
		Inherits XPLiteObject
		Dim fTDPBiayaID As Guid
		<Key(true)> _
		Public Property TDPBiayaID() As Guid
			Get
				Return fTDPBiayaID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("TDPBiayaID", fTDPBiayaID, value)
			End Set
		End Property
		Dim fJenis As String
		<Size(250)> _
		Public Property Jenis() As String
			Get
				Return fJenis
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Jenis", fJenis, value)
			End Set
		End Property
		Dim fBiaya As Decimal
		Public Property Biaya() As Decimal
			Get
				Return fBiaya
			End Get
			Set(ByVal value As Decimal)
				SetPropertyValue(Of Decimal)("Biaya", fBiaya, value)
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
