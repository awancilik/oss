Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class TDPKegiatanUsaha
		Inherits XPLiteObject
		Dim fTDPID As Guid
		<Key(true)> _
		Public Property TDPID() As Guid
			Get
				Return fTDPID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("TDPID", fTDPID, value)
			End Set
		End Property
		Dim fJenisKLUIID As Guid
		Public Property JenisKLUIID() As Guid
			Get
				Return fJenisKLUIID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("JenisKLUIID", fJenisKLUIID, value)
			End Set
		End Property
		Dim fUtama As Boolean
		Public Property Utama() As Boolean
			Get
				Return fUtama
			End Get
			Set(ByVal value As Boolean)
				SetPropertyValue(Of Boolean)("Utama", fUtama, value)
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
