Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class SIUPtTempat
		Inherits XPLiteObject
		Dim fStatusTempatID As Integer
		<Key()> _
		Public Property StatusTempatID() As Integer
			Get
				Return fStatusTempatID
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("StatusTempatID", fStatusTempatID, value)
			End Set
		End Property
		Dim fStatusTempat As String
		<Size(30)> _
		Public Property StatusTempat() As String
			Get
				Return fStatusTempat
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("StatusTempat", fStatusTempat, value)
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
