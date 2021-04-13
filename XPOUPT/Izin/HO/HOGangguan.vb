Imports System
Imports DevExpress.Xpo
Namespace OSS

    Public Class HOGangguan
        Inherits XPLiteObject
        Dim fGangguanID As Guid
        <Key(True)> _
        Public Property GangguanID() As Guid
            Get
                Return fGangguanID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("GangguanID", fGangguanID, value)
            End Set
        End Property
        Dim fGangguan As String
        <Size(30)> _
        Public Property Gangguan() As String
            Get
                Return fGangguan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Gangguan", fGangguan, value)
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
