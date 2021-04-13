Imports System
Imports DevExpress.Xpo
Namespace OSS

    Public Class JenisIzin
        Inherits XPLiteObject
        Dim fJenisIzinID As Guid
        <Key(True)> _
        Public Property JenisIzinID() As Guid
            Get
                Return fJenisIzinID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("JenisIzinID", fJenisIzinID, value)
            End Set
        End Property
        Dim fJenisIzinNama As String
        <Size(50)> _
        Public Property JenisIzinNama() As String
            Get
                Return fJenisIzinNama
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("JenisIzinNama", fJenisIzinNama, value)
            End Set
        End Property
        Dim fJenisIzinNamaLengkap As String
        <Size(100)> _
        Public Property JenisIzinNamaLengkap() As String
            Get
                Return fJenisIzinNamaLengkap
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("JenisIzinNamaLengkap", fJenisIzinNamaLengkap, value)
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
