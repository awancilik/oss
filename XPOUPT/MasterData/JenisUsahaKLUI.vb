Imports System
Imports DevExpress.Xpo
Namespace OSS

    Public Class JenisUsahaKLUI
        Inherits XPLiteObject
        Dim fJenisUsahaID As Guid
        <Key(True)> _
        Public Property JenisUsahaID() As Guid
            Get
                Return fJenisUsahaID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("JenisUsahaID", fJenisUsahaID, value)
            End Set
        End Property

        Dim fJenisUsahaParentID As JenisUsahaKLUI
        Public Property JenisUsahaParentID() As JenisUsahaKLUI
            Get
                Return fJenisUsahaParentID
            End Get
            Set(ByVal value As JenisUsahaKLUI)
                SetPropertyValue(Of JenisUsahaKLUI)("JenisUsahaParentID", fJenisUsahaParentID, value)
            End Set
        End Property

        Dim fNomorKLUI As String
        Public Property NomorKLUI() As String
            Get
                Return fNomorKLUI
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("NomorKLUI", fNomorKLUI, value)
            End Set
        End Property

        Dim fJenisUsahaNama As String
        Public Property JenisUsahaNama() As String
            Get
                Return fJenisUsahaNama
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("JenisUsahaNama", fJenisUsahaNama, value)
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
