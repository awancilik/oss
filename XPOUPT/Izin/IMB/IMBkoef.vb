Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IMBkoef
		Inherits XPLiteObject
		Dim fKoefisienID As Guid
		<Key(true)> _
		Public Property KoefisienID() As Guid
			Get
				Return fKoefisienID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("KoefisienID", fKoefisienID, value)
			End Set
		End Property
		Dim fKategori As String
		<Size(50)> _
		Public Property Kategori() As String
			Get
				Return fKategori
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Kategori", fKategori, value)
			End Set
		End Property
		Dim fJenisKategori As String
		<Size(50)> _
		Public Property JenisKategori() As String
			Get
				Return fJenisKategori
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("JenisKategori", fJenisKategori, value)
			End Set
		End Property
		Dim fKoefisien As Decimal
		Public Property Koefisien() As Decimal
			Get
				Return fKoefisien
			End Get
			Set(ByVal value As Decimal)
				SetPropertyValue(Of Decimal)("Koefisien", fKoefisien, value)
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
