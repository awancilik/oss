Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class JenisPerusahaan
		Inherits XPLiteObject
		Dim fJenisPerusahaanID As Guid
		<Key(true)> _
		Public Property JenisPerusahaanID() As Guid
			Get
				Return fJenisPerusahaanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("JenisPerusahaanID", fJenisPerusahaanID, value)
			End Set
		End Property
		Dim fJenisPerusahaan_ As String
		<Size(50)> _
		<Persistent("JenisPerusahaan")> _
		Public Property JenisPerusahaan_() As String
			Get
				Return fJenisPerusahaan_
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("JenisPerusahaan_", fJenisPerusahaan_, value)
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
