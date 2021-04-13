Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class LokasiRapat
		Inherits XPLiteObject
		Dim fLokasiRapatID As Guid
		<Key(true)> _
		Public Property LokasiRapatID() As Guid
			Get
				Return fLokasiRapatID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("LokasiRapatID", fLokasiRapatID, value)
			End Set
		End Property
		Dim fLokasiRapatTanggal As DateTime
		Public Property LokasiRapatTanggal() As DateTime
			Get
				Return fLokasiRapatTanggal
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("LokasiRapatTanggal", fLokasiRapatTanggal, value)
			End Set
		End Property
        Dim fPermohonanID As Permohonan
        Public Property PermohonanID() As Permohonan
            Get
                Return fPermohonanID
            End Get
            Set(ByVal value As Permohonan)
                SetPropertyValue(Of Permohonan)("PermohonanID", fPermohonanID, value)
            End Set
        End Property
        Dim fLokasiID As Lokasi
        Public Property LokasiID() As Lokasi
            Get
                Return fLokasiID
            End Get
            Set(ByVal value As Lokasi)
                SetPropertyValue(Of Lokasi)("LokasiID", fLokasiID, value)
            End Set
        End Property
        Dim fSaran As String
        Public Property Saran() As String
            Get
                Return fSaran
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Saran", fSaran, value)
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
