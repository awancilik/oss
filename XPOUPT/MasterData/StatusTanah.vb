Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class tanah
		Inherits XPLiteObject
		Dim fStatusTanah As String
		<Size(20)> _
		Public Property StatusTanah() As String
			Get
				Return fStatusTanah
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("StatusTanah", fStatusTanah, value)
			End Set
		End Property
		Dim fStatusTanahID As Guid
		<Key(true)> _
		Public Property StatusTanahID() As Guid
			Get
				Return fStatusTanahID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("StatusTanahID", fStatusTanahID, value)
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
