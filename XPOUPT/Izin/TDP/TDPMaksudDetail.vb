Imports System
Imports DevExpress.Xpo
Namespace OSS

    Public Class TDPMaksudDetal
        Inherits XPLiteObject
        Dim fTDPMaksudDetailID As Guid
        <Key(True)> _
        Public Property TDPMaksudDetailID() As Guid
            Get
                Return fTDPMaksudDetailID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("TDPMaksudDetailID", fTDPMaksudDetailID, value)
            End Set
        End Property
        Dim fTDPID As TDP
        <Association("TDP-TDPMaksudDetal")> _
        Public Property TDPID() As TDP
            Get
                Return fTDPID
            End Get
            Set(ByVal value As TDP)
                SetPropertyValue(Of TDP)("TDPID", fTDPID, value)
            End Set
        End Property
        Dim fTDPMaksudID As TDPMaksud
        <Association("TDPMaksud-TDPMaksudDetal")> _
        Public Property TDPMaksudID() As TDPMaksud
            Get
                Return fTDPMaksudID
            End Get
            Set(ByVal value As TDPMaksud)
                SetPropertyValue(Of TDPMaksud)("TDPMaksudID", fTDPMaksudID, value)
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
