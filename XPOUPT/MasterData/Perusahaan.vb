Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class Perusahaan
		Inherits XPLiteObject
		Dim fPerusahaanID As Guid
		<Key(true)> _
		Public Property PerusahaanID() As Guid
			Get
				Return fPerusahaanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("PerusahaanID", fPerusahaanID, value)
			End Set
		End Property
        Dim fNamaPerusahaan As String
        Public Property NamaPerusahaan() As String
            Get
                Return fNamaPerusahaan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("NamaPerusahaan", fNamaPerusahaan, value)
            End Set
        End Property
		Dim fFaxPerusahaan As String
		<Size(50)> _
		Public Property FaxPerusahaan() As String
			Get
				Return fFaxPerusahaan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("FaxPerusahaan", fFaxPerusahaan, value)
			End Set
		End Property
		Dim fTelpPerusahaan As String
		<Size(10)> _
		Public Property TelpPerusahaan() As String
			Get
				Return fTelpPerusahaan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("TelpPerusahaan", fTelpPerusahaan, value)
			End Set
		End Property
        Dim fKecamatan As String
        Public Property Kecamatan() As String
            Get
                Return fKecamatan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Kecamatan", fKecamatan, value)
            End Set
        End Property
        Dim fKabupaten As String
        Public Property Kabupaten() As String
            Get
                Return fKabupaten
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Kabupaten", fKabupaten, value)
            End Set
        End Property
		Dim fAlamatPerusahaan As String
		Public Property AlamatPerusahaan() As String
			Get
				Return fAlamatPerusahaan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("AlamatPerusahaan", fAlamatPerusahaan, value)
			End Set
		End Property
		Dim fKodePosPerusahaan As String
		<Size(10)> _
		Public Property KodePosPerusahaan() As String
			Get
				Return fKodePosPerusahaan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("KodePosPerusahaan", fKodePosPerusahaan, value)
			End Set
		End Property
		Dim fNamaPemilik As String
		<Size(50)> _
		Public Property NamaPemilik() As String
			Get
				Return fNamaPemilik
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NamaPemilik", fNamaPemilik, value)
			End Set
		End Property
		Dim fAlamatPemilik As String
		<Size(50)> _
		Public Property AlamatPemilik() As String
			Get
				Return fAlamatPemilik
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("AlamatPemilik", fAlamatPemilik, value)
			End Set
		End Property
		Dim fNoKTPPemilik As String
		<Size(50)> _
		Public Property NoKTPPemilik() As String
			Get
				Return fNoKTPPemilik
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("NoKTPPemilik", fNoKTPPemilik, value)
			End Set
		End Property
		Dim fTTLPemilik As String
		<Size(50)> _
		Public Property TTLPemilik() As String
			Get
				Return fTTLPemilik
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("TTLPemilik", fTTLPemilik, value)
			End Set
		End Property
		Dim fJenisKelamin As String
		<Size(50)> _
		Public Property JenisKelamin() As String
			Get
				Return fJenisKelamin
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("JenisKelamin", fJenisKelamin, value)
			End Set
		End Property
		Dim fAgama As String
		<Size(50)> _
		Public Property Agama() As String
			Get
				Return fAgama
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Agama", fAgama, value)
			End Set
		End Property
		Dim fPekerjaan As String
		<Size(50)> _
		Public Property Pekerjaan() As String
			Get
				Return fPekerjaan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("Pekerjaan", fPekerjaan, value)
			End Set
		End Property
		Dim fTlpPemilik As String
		<Size(50)> _
		Public Property TlpPemilik() As String
			Get
				Return fTlpPemilik
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("TlpPemilik", fTlpPemilik, value)
			End Set
		End Property
		Dim fFaxPemilik As String
		<Size(50)> _
		Public Property FaxPemilik() As String
			Get
				Return fFaxPemilik
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("FaxPemilik", fFaxPemilik, value)
			End Set
		End Property
		Dim fKodeposPemilik As String
		<Size(50)> _
		Public Property KodeposPemilik() As String
			Get
				Return fKodeposPemilik
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("KodeposPemilik", fKodeposPemilik, value)
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
