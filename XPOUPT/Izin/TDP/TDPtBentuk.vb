Imports System
Imports DevExpress.Xpo
Namespace OSS

    Public Class TDPtBentuk
        Inherits XPLiteObject
        Dim fBentukPerusahaan As String
        <Size(30)> _
        Public Property BentukPerusahaan() As String
            Get
                Return fBentukPerusahaan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("BentukPerusahaan", fBentukPerusahaan, value)
            End Set
        End Property
        Dim fBentukPerusahaanID As Guid
        <Key(True)> _
        Public Property BentukPerusahaanID() As Guid
            Get
                Return fBentukPerusahaanID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("BentukPerusahaanID", fBentukPerusahaanID, value)
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
