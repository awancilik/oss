Imports System
Imports DevExpress.Xpo
Namespace OSS

    Public Class TDPMaksud
        Inherits XPLiteObject
        Dim fTDPMaksudID As Guid
        <Key(True)> _
        Public Property TDPMaksudID() As Guid
            Get
                Return fTDPMaksudID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("TDPMaksudID", fTDPMaksudID, value)
            End Set
        End Property
        Dim fMaksud As String
        <Size(50)> _
        Public Property Maksud() As String
            Get
                Return fMaksud
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Maksud", fMaksud, value)
            End Set
        End Property
        <Association("TDPMaksud-TDPMaksudDetal")> _
              Public ReadOnly Property TDPMaksudDetal() As XPCollection(Of TDPMaksudDetal)
            Get
                Return GetCollection(Of TDPMaksudDetal)("TDPMaksudDetal")
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
