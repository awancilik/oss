Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class LokasiBAP
        Inherits XPLiteObject

		Dim fLokasiBAPID As Guid
		<Key(true)> _
		Public Property LokasiBAPID() As Guid
			Get
				Return fLokasiBAPID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("LokasiBAPID", fLokasiBAPID, value)
			End Set
        End Property

		Dim fLokasiBAPNomor As String
		<Size(50)> _
		Public Property LokasiBAPNomor() As String
			Get
				Return fLokasiBAPNomor
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("LokasiBAPNomor", fLokasiBAPNomor, value)
			End Set
        End Property

		Dim fLokasiBAPTanggal As DateTime
		Public Property LokasiBAPTanggal() As DateTime
			Get
				Return fLokasiBAPTanggal
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("LokasiBAPTanggal", fLokasiBAPTanggal, value)
			End Set
        End Property

		Dim fLokasiBAPCatatan As String
		<Size(SizeAttribute.Unlimited)> _
		Public Property LokasiBAPCatatan() As String
			Get
				Return fLokasiBAPCatatan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("LokasiBAPCatatan", fLokasiBAPCatatan, value)
			End Set
        End Property

		Dim fLokasiBAPRekomendasi As String
		<Size(SizeAttribute.Unlimited)> _
		Public Property LokasiBAPRekomendasi() As String
			Get
				Return fLokasiBAPRekomendasi
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("LokasiBAPRekomendasi", fLokasiBAPRekomendasi, value)
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

        Dim fLokasiPemeriksaanID As LokasiPemeriksaan
        Public Property LokasiPemeriksaanID() As LokasiPemeriksaan
            Get
                Return fLokasiPemeriksaanID
            End Get
            Set(ByVal value As LokasiPemeriksaan)
                SetPropertyValue(Of LokasiPemeriksaan)("LokasiPemeriksaanID", fLokasiPemeriksaanID, value)
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
