Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class Pemohon
		Inherits XPLiteObject
		Dim fPemohonID As Guid
		<Key(true)> _
		Public Property PemohonID() As Guid
			Get
				Return fPemohonID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("PemohonID", fPemohonID, value)
			End Set
		End Property
        Dim fPemohonPropinsiID As Propinsi
        Public Property PemohonPropinsiID() As Propinsi
            Get
                Return fPemohonPropinsiID
            End Get
            Set(ByVal value As Propinsi)
                SetPropertyValue(Of Propinsi)("PemohonPropinsiID", fPemohonPropinsiID, value)
            End Set
        End Property
        Dim fPemohonKabupatenID As Kabupaten
        Public Property PemohonKabupatenID() As Kabupaten
            Get
                Return fPemohonKabupatenID
            End Get
            Set(ByVal value As Kabupaten)
                SetPropertyValue(Of Kabupaten)("PemohonKabupatenID", fPemohonKabupatenID, value)
            End Set
        End Property
        Dim fPemohonKecamatanID As Kecamatan
        Public Property PemohonKecamatanID() As Kecamatan
            Get
                Return fPemohonKecamatanID
            End Get
            Set(ByVal value As Kecamatan)
                SetPropertyValue(Of Kecamatan)("PemohonKecamatanID", fPemohonKecamatanID, value)
            End Set
        End Property
        Dim fPemohonKelurahanID As Kelurahan
        Public Property PemohonKelurahanID() As Kelurahan
            Get
                Return fPemohonKelurahanID
            End Get
            Set(ByVal value As Kelurahan)
                SetPropertyValue(Of Kelurahan)("PemohonKelurahanID", fPemohonKelurahanID, value)
            End Set
        End Property
		Dim fPemohonNama As String
		<Size(254)> _
		Public Property PemohonNama() As String
			Get
				Return fPemohonNama
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PemohonNama", fPemohonNama, value)
			End Set
		End Property
		Dim fPemohonAlamat As String
		<Size(50)> _
		Public Property PemohonAlamat() As String
			Get
				Return fPemohonAlamat
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PemohonAlamat", fPemohonAlamat, value)
			End Set
		End Property
        Dim fPemohonRW As String
        Public Property PemohonRW() As String
            Get
                Return fPemohonRW
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemohonRW", fPemohonRW, value)
            End Set
        End Property
        Dim fPemohonRT As String
        Public Property PemohonRT() As String
            Get
                Return fPemohonRT
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemohonRT", fPemohonRT, value)
            End Set
        End Property
		Dim fPemohonTelpon As String
		<Size(50)> _
		Public Property PemohonTelpon() As String
			Get
				Return fPemohonTelpon
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PemohonTelpon", fPemohonTelpon, value)
			End Set
		End Property
		Dim fPemohonFax As String
		<Size(50)> _
		Public Property PemohonFax() As String
			Get
				Return fPemohonFax
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PemohonFax", fPemohonFax, value)
			End Set
		End Property
		Dim fPemohonKodePos As String
		<Size(10)> _
		Public Property PemohonKodePos() As String
			Get
				Return fPemohonKodePos
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("PemohonKodePos", fPemohonKodePos, value)
			End Set
        End Property

        Dim fPemohonNIK As String
        <Size(50)> _
        Public Property PemohonNIK() As String
            Get
                Return fPemohonNIK
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemohonNIK", fPemohonNIK, value)
            End Set
        End Property

        Dim fPemohonTTL As String
        <Size(50)> _
        Public Property PemohonTTL() As String
            Get
                Return fPemohonTTL
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemohonTTL", fPemohonTTL, value)
            End Set
        End Property

        Dim fPemohonJenisKelamin As String
        <Size(50)> _
        Public Property PemohonJenisKelamin() As String
            Get
                Return fPemohonJenisKelamin
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemohonJenisKelamin", fPemohonJenisKelamin, value)
            End Set
        End Property

        Dim fPemohonPekerjaan As String
        <Size(50)> _
        Public Property PemohonPekerjaan() As String
            Get
                Return fPemohonPekerjaan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemohonPekerjaan", fPemohonPekerjaan, value)
            End Set
        End Property

        Dim fPemohonAgama As String
        <Size(50)> _
        Public Property PemohonAgama() As String
            Get
                Return fPemohonAgama
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemohonAgama", fPemohonAgama, value)
            End Set
        End Property

        Dim fPemohonAlamatFull As String
        <NonPersistent()> _
        Public ReadOnly Property AlamatFull() As String
            Get
                Dim lalamat As String
                Dim lProp As String = String.Empty
                Dim lKab As String = String.Empty
                Dim lKec As String = String.Empty
                Dim lKel As String = String.Empty
                If fPemohonPropinsiID IsNot Nothing Then
                    lProp = fPemohonPropinsiID.PropinsiNama
                End If
                If fPemohonKabupatenID IsNot Nothing Then
                    lKab = fPemohonKabupatenID.KabupatenNama
                End If
                If fPemohonKecamatanID IsNot Nothing Then
                    lKec = fPemohonKecamatanID.KecamatanNama
                End If
                If fPemohonKelurahanID IsNot Nothing Then
                    lKel = fPemohonKelurahanID.KelurahanNama
                End If
                lalamat = fPemohonAlamat & " Kelurahan " & lKel & " RT " & fPemohonRT & " RW " & fPemohonRW & " Kecamatan " & lKec & " Kabupaten " & lKab & " Propinsi " & lProp
                Return lAlamat
            End Get
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
