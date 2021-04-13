Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class TDPLegalitas
		Inherits XPLiteObject
		Dim fTDPLegalitasID As Guid
		<Key(true)> _
		Public Property TDPLegalitasID() As Guid
			Get
				Return fTDPLegalitasID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("TDPLegalitasID", fTDPLegalitasID, value)
			End Set
		End Property
		Dim fTDPID As Guid
		Public Property TDPID() As Guid
			Get
				Return fTDPID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("TDPID", fTDPID, value)
			End Set
		End Property
		Dim fJenisLegalitasID As Guid
		Public Property JenisLegalitasID() As Guid
			Get
				Return fJenisLegalitasID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("JenisLegalitasID", fJenisLegalitasID, value)
			End Set
        End Property
        Dim fJenisIzin As String
        Public Property JenisIzin() As String
            Get
                Return fJenisIzin
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("JenisIzin", fJenisIzin, value)
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
		Dim fTglLegalitas As DateTime
		Public Property TglLegalitas() As DateTime
			Get
				Return fTglLegalitas
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("TglLegalitas", fTglLegalitas, value)
			End Set
		End Property
		Dim fMasaBerlaku As Byte
		Public Property MasaBerlaku() As Byte
			Get
				Return fMasaBerlaku
			End Get
			Set(ByVal value As Byte)
				SetPropertyValue(Of Byte)("MasaBerlaku", fMasaBerlaku, value)
			End Set
		End Property
		Dim fOleh As String
		<Size(50)> _
		Public Property Oleh() As String
			Get
				Return fOleh
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Oleh", fOleh, value)
			End Set
		End Property
		Dim fNotaris As String
		<Size(50)> _
		Public Property Notaris() As String
			Get
				Return fNotaris
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Notaris", fNotaris, value)
			End Set
		End Property
		Dim fAlamatNotaris As String
		<Size(50)> _
		Public Property AlamatNotaris() As String
			Get
				Return fAlamatNotaris
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("AlamatNotaris", fAlamatNotaris, value)
			End Set
		End Property
		Dim fTelpNotaris As String
		<Size(15)> _
		Public Property TelpNotaris() As String
			Get
				Return fTelpNotaris
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("TelpNotaris", fTelpNotaris, value)
			End Set
		End Property
		Dim fTglDikeluarkan As DateTime
		Public Property TglDikeluarkan() As DateTime
			Get
				Return fTglDikeluarkan
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("TglDikeluarkan", fTglDikeluarkan, value)
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
