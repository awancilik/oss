Imports System
Imports DevExpress.Xpo
Namespace OSS

    Public Class SIUPbank
        Inherits XPLiteObject
        Dim fSIUPBankID As Guid
        <Key(True)> _
        Public Property SIUPBankID() As Guid
            Get
                Return fSIUPBankID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("SIUPBankID", fSIUPBankID, value)
            End Set
        End Property
        Dim fSIUPID As SIUP
        <Association("SIUP-SIUPBank")> _
        Public Property SIUPID() As SIUP
            Get
                Return fSIUPID
            End Get
            Set(ByVal value As SIUP)
                SetPropertyValue(Of SIUP)("SIUPID", fSIUPID, value)
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
