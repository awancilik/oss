Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class HOEnergi
		Inherits XPLiteObject
		Dim fEnergiID As Guid
		<Key(true)> _
		Public Property EnergiID() As Guid
			Get
				Return fEnergiID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("EnergiID", fEnergiID, value)
			End Set
		End Property
		Dim fEnergi As String
		<Size(30)> _
		Public Property Energi() As String
			Get
				Return fEnergi
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Energi", fEnergi, value)
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
