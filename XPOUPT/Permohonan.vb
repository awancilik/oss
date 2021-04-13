Imports System
Imports DevExpress.Xpo

Namespace OSS

    Public Class Permohonan
        Inherits XPLiteObject

#Region " Object Relation "

        <Association("Permohonan-PermohonanDetail")> _
        Public ReadOnly Property PermohonanDetail() As XPCollection(Of PermohonanDetail)
            Get
                Return GetCollection(Of PermohonanDetail)("PermohonanDetail")
            End Get
        End Property

#End Region

        Dim fPermohonanID As Guid
        <Key(True)> _
        Public Property PermohonanID() As Guid
            Get
                Return fPermohonanID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("PermohonanID", fPermohonanID, value)
            End Set
        End Property

        Dim fNomorPermohonan As String
        <Size(45)> _
        Public Property NomorPermohonan() As String
            Get
                Return fNomorPermohonan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("NomorPermohonan", fNomorPermohonan, value)
            End Set
        End Property

        Dim fTanggalPermohonan As DateTime
        Public Property TanggalPermohonan() As DateTime
            Get
                Return fTanggalPermohonan
            End Get
            Set(ByVal value As DateTime)
                SetPropertyValue(Of DateTime)("TanggalPermohonan", fTanggalPermohonan, value)
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

        Dim fPemohonNama As String
        Public Property PemohonNama() As String
            Get
                Return fPemohonNama
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemohonNama", fPemohonNama, value)
            End Set
        End Property

        Dim fPemohonAlamat As String
        Public Property PemohonAlamat() As String
            Get
                Return fPemohonAlamat
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemohonAlamat", fPemohonAlamat, value)
            End Set
        End Property

        Dim fPemohonTempatLahir As String
        Public Property PemohonTempatLahir() As String
            Get
                Return fPemohonTempatLahir
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemohonTempatLahir", fPemohonTempatLahir, value)
            End Set
        End Property

        Dim fPemohonTanggalLahir As DateTime
        Public Property PemohonTanggalLahir() As DateTime
            Get
                Return fPemohonTanggalLahir
            End Get
            Set(ByVal value As DateTime)
                SetPropertyValue(Of DateTime)("PemohonTanggalLahir", fPemohonTanggalLahir, value)
            End Set
        End Property

        Dim fPemohonPekerjaan As String
        Public Property PemohonPekerjaan() As String
            Get
                Return fPemohonPekerjaan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemohonPekerjaan", fPemohonPekerjaan, value)
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

        Dim fPemohonRW As String
        <Size(5)> _
        Public Property PemohonRW() As String
            Get
                Return fPemohonRW
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("PemohonRW", fPemohonRW, value)
            End Set
        End Property

        Dim fPemohonRT As String
        <Size(5)> _
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

        Dim fOrganisasi As String
        <Size(50)> _
        Public Property Organisasi() As String
            Get
                Return fOrganisasi
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Organisasi", fOrganisasi, value)
            End Set
        End Property

        Dim fJabatan As String
        <Size(50)> _
        Public Property Jabatan() As String
            Get
                Return fJabatan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Jabatan", fJabatan, value)
            End Set
        End Property

        Dim fKeterangan As String
        <Size(50)> _
        Public Property Keterangan() As String
            Get
                Return fKeterangan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Keterangan", fKeterangan, value)
            End Set
        End Property
        Dim fTglDaftar As Date
        Public Property TglDaftar() As Date
            Get
                Return fTglDaftar
            End Get
            Set(ByVal value As Date)
                SetPropertyValue(Of Date)("TglDaftar", fTglDaftar, value)
            End Set
        End Property
        Dim fTglInput As Date
        Public Property TglInput() As Date
            Get
                Return fTglInput
            End Get
            Set(ByVal value As Date)
                SetPropertyValue(Of Date)("TglInput", fTglInput, value)
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
