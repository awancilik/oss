Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class HOTimTeknis
		Inherits XPLiteObject
		Dim fHOTimTeknisID As Guid
		<Key(true)> _
		Public Property HOTimTeknisID() As Guid
			Get
				Return fHOTimTeknisID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("HOTimTeknisID", fHOTimTeknisID, value)
			End Set
		End Property
		Dim fTImTeknis As String
		<Size(50)> _
		Public Property TImTeknis() As String
			Get
				Return fTImTeknis
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("TImTeknis", fTImTeknis, value)
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
