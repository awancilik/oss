Imports System
Imports DevExpress.Xpo
Namespace OSS

    Public Class TDPbank
        Inherits XPLiteObject
        Dim fTDPBankID As Guid
        <Key(True)> _
        Public Property TDPBankID() As Guid
            Get
                Return fTDPBankID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("TDPBankID", fTDPBankID, value)
            End Set
        End Property
        Dim fTDPID As TDP
        <Association("TDP-TDPBank")> _
        Public Property TDPID() As TDP
            Get
                Return fTDPID
            End Get
            Set(ByVal value As TDP)
                SetPropertyValue(Of TDP)("TDPID", fTDPID, value)
            End Set
        End Property
        Dim fNamaBank As String
        <Size(50)> _
        Public Property NamaBank() As String
            Get
                Return fNamaBank
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("NamaBank", fNamaBank, value)
            End Set
        End Property
        Dim fAlamatBank As String
        Public Property AlamatBank() As String
            Get
                Return fAlamatBank
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("AlamatBank", fAlamatBank, value)
            End Set
        End Property
        Dim fKeterangan As String
        Public Property Keterangan() As String
            Get
                Return fKeterangan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("Keterangan", fKeterangan, value)
            End Set
        End Property
        Dim fLN As Boolean
        Public Property LN() As Boolean
            Get
                Return fLN
            End Get
            Set(ByVal value As Boolean)
                SetPropertyValue(Of Boolean)("LN", fLN, value)
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
