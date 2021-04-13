Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class SIUPtLembaga
		Inherits XPLiteObject
		Dim fKelembagaanID As Integer
		<Key()> _
		Public Property KelembagaanID() As Integer
			Get
				Return fKelembagaanID
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("KelembagaanID", fKelembagaanID, value)
			End Set
		End Property
		Dim fKelembagaan As String
		<Size(30)> _
		Public Property Kelembagaan() As String
			Get
				Return fKelembagaan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Kelembagaan", fKelembagaan, value)
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
