Imports System
Imports DevExpress.Xpo
Namespace OSS

    Public Class TDPModal
        Inherits XPLiteObject
        Dim fTDPModalID As Guid
        <Key(True)> _
        Public Property TDPModalID() As Guid
            Get
                Return fTDPModalID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("TDPModalID", fTDPModalID, value)
            End Set
        End Property
        Dim fJenisModal As String
        <Size(50)> _
        Public Property JenisModal() As String
            Get
                Return fJenisModal
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("JenisModal", fJenisModal, value)
            End Set
        End Property
        Dim fModal As Decimal
        Public Property Modal() As Decimal
            Get
                Return fModal
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("Modal", fModal, value)
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
