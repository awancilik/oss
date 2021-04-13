Imports System
Imports DevExpress.Xpo

Namespace OSS
    <Persistent("DistinctSyarat")> _
    Public Class syaratview
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

        Dim fSyaratPermohonanIzinID As Guid
        Public Property SyaratPermohonanIzinID() As Guid
            Get
                Return fSyaratPermohonanIzinID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("SyaratPermohonanIzinID", fSyaratPermohonanIzinID, value)
            End Set
        End Property

        Dim fSyaratPermohonanSyaratID As Guid
        Public Property SyaratPermohonanSyaratID() As Guid
            Get
                Return fSyaratPermohonanSyaratID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("SyaratPermohonanSyaratID", fSyaratPermohonanSyaratID, value)
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
