Imports System
Imports DevExpress.Xpo
Namespace OSS

    Public Class TDPJenisKLUI
        Inherits XPLiteObject
        Dim fTDPJENISKLUIID As Guid
        <Key(True)> _
        Public Property TDPJENISKLUIID() As Guid
            Get
                Return fTDPJENISKLUIID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("TDPJENISKLUIID", fTDPJENISKLUIID, value)
            End Set
        End Property
        Dim fTDPID As TDP
        <Association("TDP-TDPJenisKLUI")> _
        Public Property TDPID() As TDP
            Get
                Return fTDPID
            End Get
            Set(ByVal value As TDP)
                SetPropertyValue(Of TDP)("TDPID", fTDPID, value)
            End Set
        End Property
        Dim fJenisKLUIID As JenisUsahaKLUI
        Public Property JenisKLUIID() As JenisUsahaKLUI
            Get
                Return fJenisKLUIID
            End Get
            Set(ByVal value As JenisUsahaKLUI)
                SetPropertyValue(Of JenisUsahaKLUI)("JenisKLUIID", fJenisKLUIID, value)
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
