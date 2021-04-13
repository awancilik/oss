Imports System
Imports DevExpress.Xpo

Namespace OSS
    Public Class Permohonan
        Inherits XPLiteObject

#Region " Object Relation "

        <Association("Permohonan-IMB")> _
                Public ReadOnly Property Permohonan_IMB() As XPCollection(Of IMB)
            Get
                Return GetCollection(Of IMB)("Permohonan_IMB")
            End Get
        End Property

#End Region

        Dim fPermohonanID As Guid
        <Key()> _
        <Size(45)> _
        Public Property PermohonanID() As Guid
            Get
                Return fPermohonanID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("PermohonanID", fPermohonanID, value)
            End Set
        End Property
        Dim fNomorPermohonan As String
        Public Property NomorPermohonan() As String
            Get
                Return fNomorPermohonan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("NomorPermohonan", fNomorPermohonan, value)
            End Set
        End Property
        Dim fPermohonanPemohonID As Pemohon
        Public Property PemohonID() As Pemohon
            Get
                Return fPermohonanPemohonID
            End Get
            Set(ByVal value As Pemohon)
                SetPropertyValue(Of Pemohon)("PemohonID", fPermohonanPemohonID, value)
            End Set
        End Property
        Dim fPermohonanTanggal As DateTime
        Public Property Tanggal() As DateTime
            Get
                Return fPermohonanTanggal
            End Get
            Set(ByVal value As DateTime)
                SetPropertyValue(Of DateTime)("Tanggal", fPermohonanTanggal, value)
            End Set
        End Property
        Dim fPemohonNama As String
        <NonPersistent()> _
        Public ReadOnly Property PemohonNama() As String
            Get
                If fPermohonanPemohonID Is Nothing Then
                    Return "-"
                Else
                    Return fPermohonanPemohonID.PemohonNama
                End If
            End Get
        End Property
        <Association("Permohonan-PermohonanDetail")> _
        Public ReadOnly Property PermohonanDetail() As XPCollection(Of PermohonanDetail)
            Get
                Return GetCollection(Of PermohonanDetail)("PermohonanDetail")
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
