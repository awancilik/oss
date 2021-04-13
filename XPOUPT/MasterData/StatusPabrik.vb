Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class StatusPabrik
		Inherits XPLiteObject
		Dim fStatusPabrikID As Guid
		<Key(true)> _
		Public Property StatusPabrikID() As Guid
			Get
				Return fStatusPabrikID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("StatusPabrikID", fStatusPabrikID, value)
			End Set
		End Property
		Dim fStatus As String
		<Size(50)> _
		Public Property Status() As String
			Get
				Return fStatus
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Status", fStatus, value)
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
