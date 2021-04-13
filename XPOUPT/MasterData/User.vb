Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class User
		Inherits XPLiteObject
		Dim fUserID As Guid
		<Key(true)> _
		Public Property UserID() As Guid
			Get
				Return fUserID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("UserID", fUserID, value)
			End Set
		End Property
		Dim fUsername As String
		<Size(16)> _
		Public Property Username() As String
			Get
				Return fUsername
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Username", fUsername, value)
			End Set
		End Property
		Dim fUserFullName As String
		<Size(16)> _
		Public Property UserFullName() As String
			Get
				Return fUserFullName
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("UserFullName", fUserFullName, value)
			End Set
		End Property
		Dim fPassword As String
		<Size(200)> _
		Public Property Password() As String
			Get
				Return fPassword
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Password", fPassword, value)
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
