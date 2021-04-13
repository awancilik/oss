Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class HOJenisUsaha
		Inherits XPLiteObject
		Dim fJenisUsahaID As Guid
		<Key(true)> _
		Public Property JenisUsahaID() As Guid
			Get
				Return fJenisUsahaID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("JenisUsahaID", fJenisUsahaID, value)
			End Set
		End Property
		Dim fJenisUsaha As String
		<Size(30)> _
		Public Property JenisUsaha() As String
			Get
				Return fJenisUsaha
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("JenisUsaha", fJenisUsaha, value)
			End Set
		End Property
		Dim fKoefisien As Single
		Public Property Koefisien() As Single
			Get
				Return fKoefisien
			End Get
			Set(ByVal value As Single)
				SetPropertyValue(Of Single)("Koefisien", fKoefisien, value)
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
