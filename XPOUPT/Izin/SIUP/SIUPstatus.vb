Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class SIUPStatus
		Inherits XPLiteObject
		Dim fSIUPStatusID As Guid
		<Key(true)> _
		Public Property SIUPStatusID() As Guid
			Get
				Return fSIUPStatusID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("SIUPStatusID", fSIUPStatusID, value)
			End Set
		End Property
		Dim fStatusTempatUsaha As String
		<Size(30)> _
		Public Property StatusTempatUsaha() As String
			Get
				Return fStatusTempatUsaha
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("StatusTempatUsaha", fStatusTempatUsaha, value)
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
