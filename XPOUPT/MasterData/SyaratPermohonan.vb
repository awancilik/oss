Imports System
Imports DevExpress.Xpo

Namespace OSS
    <Persistent("TsyarPerm")> _
    Public Class SyaratPermohonan
        Inherits XPLiteObject

        Dim fSyaratPermohonanTID As Guid
        <Key(True)> _
        Public Property SyaratPermohonanTID() As Guid
            Get
                Return fSyaratPermohonanTID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("SyaratPermohonanTID", fSyaratPermohonanTID, value)
            End Set
        End Property

        Dim fSyaratPermohonanIzinID As Izin
        <Association("Izin-SyaratPermohonan")> _
        Public Property SyaratPermohonanIzinID() As Izin
            Get
                Return fSyaratPermohonanIzinID
            End Get
            Set(ByVal value As Izin)
                SetPropertyValue(Of Izin)("SyaratPermohonanIzinID", fSyaratPermohonanIzinID, value)
            End Set
        End Property

        Dim fSyaratPermohonanSyaratID As Syarat
        <Association("SyaratIzin-SyaratPermohonan")> _
        Public Property SyaratPermohonanSyaratID() As Syarat
            Get
                Return fSyaratPermohonanSyaratID
            End Get
            Set(ByVal value As Syarat)
                SetPropertyValue(Of Syarat)("SyaratPermohonanSyaratID", fSyaratPermohonanSyaratID, value)
            End Set
        End Property

        Dim fsyaratnama As String
        <Persistent("DistinctSyaratID")> _
        Public ReadOnly Property SyaratNama() As String
            Get
                Return fsyaratnama
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
