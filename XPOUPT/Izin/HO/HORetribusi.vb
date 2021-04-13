Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class HORetribusi
        Inherits XPLiteObject
        Dim fHORetribusiID As Guid
        <Key(True)> _
  Public Property HORetribusiID() As Guid
            Get
                Return fHORetribusiID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("HORetribusiID", fHORetribusiID, value)
            End Set
        End Property

        Dim fPermohonanID As Permohonan
        Public Property PermohonanID() As Permohonan
            Get
                Return fPermohonanID
            End Get
            Set(ByVal value As Permohonan)
                SetPropertyValue(Of Permohonan)("PermohonanID", fPermohonanID, value)
            End Set
        End Property

        Dim fHOID As HO
        Public Property HOID() As HO
            Get
                Return fHOID
            End Get
            Set(ByVal value As HO)
                SetPropertyValue(Of HO)("HOID", fHOID, value)
            End Set
        End Property

        Dim fJenisGangguan As String
        Public Property JenisGangguan() As String
            Get
                Return fJenisGangguan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("JenisGangguan", fJenisGangguan, value)
            End Set
        End Property

        Dim fJenisLokasi As String
        Public Property JenisLokasi() As String
            Get
                Return fJenisLokasi
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("JenisLokasi", fJenisLokasi, value)
            End Set
        End Property

        Dim fTglPembayaran As DateTime
        Public Property TglPembayaran() As DateTime
            Get
                Return fTglPembayaran
            End Get
            Set(ByVal value As DateTime)
                SetPropertyValue(Of DateTime)("TglPembayaran", fTglPembayaran, value)
            End Set
        End Property

        Dim fIndeksLokasi As Decimal
        Public Property IndeksLokasi() As Decimal
            Get
                Return fIndeksLokasi
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("IndeksLingkungan", fIndeksLokasi, value)
            End Set
        End Property

        Dim fIndeksGangguan As Decimal
        Public Property IndeksGangguan() As Decimal
            Get
                Return fIndeksGangguan
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("IndeksGangguan", fIndeksGangguan, value)
            End Set
        End Property

        Dim fLuasUsaha As Integer
        Public Property LuasUsaha() As Integer
            Get
                Return fLuasUsaha
            End Get
            Set(ByVal value As Integer)
                SetPropertyValue(Of Integer)("LuasUsaha", fLuasUsaha, value)
            End Set
        End Property

        Dim fJenisTarifLingkungan As String
        Public Property JenisTarifLingkungan() As String
            Get
                Return fJenisTarifLingkungan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("JenisTarifLingkungan", fJenisTarifLingkungan, value)
            End Set
        End Property

        Dim fJenisLingkungan As String
        Public Property JenisLingkungan() As String
            Get
                Return fJenisLingkungan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("JenisLingkungna", fJenisLingkungan, value)
            End Set
        End Property
        Dim fTarifLingkungan As Decimal
        Public Property TarifLingkungan() As Decimal
            Get
                Return fTarifLingkungan
            End Get
            Set(ByVal value As Decimal)
                SetPropertyValue(Of Decimal)("TarifLingkungan", fTarifLingkungan, value)
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
