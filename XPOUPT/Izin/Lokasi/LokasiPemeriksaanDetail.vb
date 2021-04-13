Imports System
Imports DevExpress.Xpo
Namespace OSS

    Public Class LokasiPemeriksaanDetail
        Inherits XPLiteObject
        Dim fLokasiPemeriksaanDetailID As Guid
        <Key(True)> _
        Public Property LokasiPemeriksaanDetailID() As Guid
            Get
                Return fLokasiPemeriksaanDetailID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("LokasiPemeriksaanDetailID", fLokasiPemeriksaanDetailID, value)
            End Set
        End Property
        Dim fLokasiPemeriksaanID As LokasiPemeriksaan
        <Association("LokasiPemeriksaan-LokasiPemeriksaanDetail")> _
        Public Property LokasiPemeriksaanID() As LokasiPemeriksaan
            Get
                Return fLokasiPemeriksaanID
            End Get
            Set(ByVal value As LokasiPemeriksaan)
                SetPropertyValue(Of LokasiPemeriksaan)("LokasiPemeriksaanID", fLokasiPemeriksaanID, value)
            End Set
        End Property
        Dim fTimPemeriksaID As TimPemeriksa
        Public Property TimPemeriksaID() As TimPemeriksa
            Get
                Return fTimPemeriksaID
            End Get
            Set(ByVal value As TimPemeriksa)
                SetPropertyValue(Of TimPemeriksa)("TimPemeriksaID", fTimPemeriksaID, value)
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
