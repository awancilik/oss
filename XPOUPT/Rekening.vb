Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class Rekening
		Inherits XPLiteObject
		Dim frek_id As Guid
		<Key(true)> _
		Public Property rek_id() As Guid
			Get
				Return frek_id
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("rek_id", frek_id, value)
			End Set
		End Property
		Dim frekening As String
		<Size(50)> _
		Public Property rekening() As String
			Get
				Return frekening
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("rekening", frekening, value)
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
