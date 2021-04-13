Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class LokasiTujuan
		Inherits XPLiteObject
		Dim fTujuanID As Guid
		<Key(true)> _
		Public Property TujuanID() As Guid
			Get
				Return fTujuanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("TujuanID", fTujuanID, value)
			End Set
		End Property
		Dim fTujuan As String
		<Size(30)> _
		Public Property Tujuan() As String
			Get
				Return fTujuan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Tujuan", fTujuan, value)
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
