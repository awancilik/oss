Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class Penandatanganan
		Inherits XPLiteObject
		Dim fPenandatangananID As Guid
		<Key(true)> _
		Public Property PenandatangananID() As Guid
			Get
				Return fPenandatangananID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("PenandatangananID", fPenandatangananID, value)
			End Set
		End Property
		Dim fJenisIzinID As Guid
		Public Property JenisIzinID() As Guid
			Get
				Return fJenisIzinID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("JenisIzinID", fJenisIzinID, value)
			End Set
		End Property
		Dim fNama As String
		<Size(30)> _
		Public Property Nama() As String
			Get
				Return fNama
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Nama", fNama, value)
			End Set
		End Property
		Dim fJabatan As String
		<Size(30)> _
		Public Property Jabatan() As String
			Get
				Return fJabatan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Jabatan", fJabatan, value)
			End Set
		End Property
		Dim fNIP As String
		<Size(30)> _
		Public Property NIP() As String
			Get
				Return fNIP
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NIP", fNIP, value)
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
