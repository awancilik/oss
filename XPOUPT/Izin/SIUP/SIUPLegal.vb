Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class SIUPlegal
		Inherits XPLiteObject
		Dim fSIUPLegalID As Guid
		<Key(true)> _
		Public Property SIUPLegalID() As Guid
			Get
				Return fSIUPLegalID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("SIUPLegalID", fSIUPLegalID, value)
			End Set
		End Property
		Dim fNoIjin As String
		<Size(30)> _
		Public Property NoIjin() As String
			Get
				Return fNoIjin
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NoIjin", fNoIjin, value)
			End Set
		End Property
		Dim fNomor As String
		<Size(30)> _
		Public Property Nomor() As String
			Get
				Return fNomor
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Nomor", fNomor, value)
			End Set
		End Property
		Dim fTglSurat As DateTime
		Public Property TglSurat() As DateTime
			Get
				Return fTglSurat
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("TglSurat", fTglSurat, value)
			End Set
		End Property
		Dim fTglDisahkan As DateTime
		Public Property TglDisahkan() As DateTime
			Get
				Return fTglDisahkan
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("TglDisahkan", fTglDisahkan, value)
			End Set
		End Property
		Dim fDisahkan As String
		<Size(50)> _
		Public Property Disahkan() As String
			Get
				Return fDisahkan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Disahkan", fDisahkan, value)
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
