Imports System
Imports DevExpress.Xpo
Namespace OSS

    Public Class HOTarifLingkungan
        Inherits XPLiteObject
        Dim fHOTarifLingkunganID As Guid
        <Key(True)> _
        Public Property HOTarifLingkunganID() As Guid
            Get
                Return fHOTarifLingkunganID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("HORetribusiID", fHOTarifLingkunganID, value)
            End Set
        End Property
        Dim fKondisiLingkungan As String
        <Size(200)> _
        Public Property KondisiLingkungan() As String
            Get
                Return fKondisiLingkungan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("KondisiLingkungan", fKondisiLingkungan, value)
            End Set
        End Property
        Dim fJenisLingkungan As String
        <Size(200)> _
        Public Property JenisLingkungan() As String
            Get
                Return fJenisLingkungan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("JenisLingkungan", fJenisLingkungan, value)
            End Set
        End Property
        Dim fTarif As Decimal
        Public Property Tarif() As Decimal
            Get
                Return fTarif
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("Tarif", fTarif, value)
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
