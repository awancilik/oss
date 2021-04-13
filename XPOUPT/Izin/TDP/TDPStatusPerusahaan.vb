Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class TDPStatusPerusahaan
		Inherits XPLiteObject
		Dim fStatusPerusahaanID As Guid
		<Key(true)> _
		Public Property StatusPerusahaanID() As Guid
			Get
				Return fStatusPerusahaanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("StatusPerusahaanID", fStatusPerusahaanID, value)
			End Set
		End Property
		Dim fStatusPerusahaan As String
		<Size(30)> _
		Public Property StatusPerusahaan() As String
			Get
				Return fStatusPerusahaan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("StatusPerusahaan", fStatusPerusahaan, value)
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
