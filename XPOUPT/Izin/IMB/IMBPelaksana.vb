Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IMBpelaksana
		Inherits XPLiteObject
		Dim fPelaksanaID As Integer
		<Key()> _
		Public Property PelaksanaID() As Integer
			Get
				Return fPelaksanaID
			End Get
			Set(ByVal value As Integer)
				SetPropertyValue(Of Integer)("PelaksanaID", fPelaksanaID, value)
			End Set
		End Property
		Dim fPelaksana As String
		<Size(20)> _
		Public Property Pelaksana() As String
			Get
				Return fPelaksana
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Pelaksana", fPelaksana, value)
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
