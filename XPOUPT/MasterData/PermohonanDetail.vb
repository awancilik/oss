Imports System
Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Namespace OSS

    Public Class PermohonanDetail
        Inherits XPLiteObject

        Private session1 As New Session
        Private fNoPermohonan As String = ""

        Dim fPermohonanDetailID As Guid
        <Key(True)> _
        Public Property PermohonanDetailID() As Guid
            Get
                Return fPermohonanDetailID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("PermohonanDetailID", fPermohonanDetailID, value)
            End Set
        End Property

        Dim fPermohonanID As Permohonan
        <Association("Permohonan-PermohonanDetail")> _
        Public Property PermohonanID() As Permohonan
            Get
                Return fPermohonanID
            End Get
            Set(ByVal value As Permohonan)
                SetPropertyValue(Of Permohonan)("PermohonanID", fPermohonanID, value)
            End Set
        End Property

        Dim fJenisIzinID As JenisIzin
        Public Property JenisIzinID() As JenisIzin
            Get
                Return fJenisIzinID
            End Get
            Set(ByVal value As JenisIzin)
                SetPropertyValue(Of JenisIzin)("JenisIzinID", fJenisIzinID, value)
            End Set
        End Property

        Dim fJenisPermohonanIzinID As JenisPermohonanIzin
        Public Property JenisPermohonanIzinID() As JenisPermohonanIzin
            Get
                Return fJenisPermohonanIzinID
            End Get
            Set(ByVal value As JenisPermohonanIzin)
                SetPropertyValue(Of JenisPermohonanIzin)("JenisPermohonanIzin", fJenisPermohonanIzinID, value)
            End Set
        End Property

        Public ReadOnly Property JenisIzinIdGuid() As Guid
            Get
                Return fJenisIzinID.JenisIzinID
            End Get
        End Property

        Dim fPermohonanIzinID As Guid
        Public Property PermohonanIzinID() As Guid
            Get
                Return fPermohonanIzinID
            End Get
            Set(ByVal value As Guid)
                SetPropertyValue(Of Guid)("PermohonanIzinID", fPermohonanIzinID, value)
            End Set
        End Property

        Dim fStatusPermohonan As String
        <Size(50)> _
        Public Property StatusPermohonan() As String
            Get
                Return fStatusPermohonan
            End Get
            Set(ByVal value As String)
                SetPropertyValue(Of String)("StatusPermohonan", fStatusPermohonan, value)
            End Set
        End Property

        <NonPersistent()> _
        Public ReadOnly Property NoIzin() As String
            Get
                Dim no As String = ""
                no = nomor()
                Return no
            End Get
        End Property

        Private Function nomor() As String
            Dim namaizin As String = Me.JenisIzinID.JenisIzinNama.Trim
            Dim no As String = ""
            If namaizin = "IMB" Then
                no = IMB()
            ElseIf namaizin = "Lokasi" Then
                no = Lokasi()
            ElseIf namaizin = "IUI" Then
                no = IUI()
            ElseIf namaizin = "IPI" Then
                no = IPI()
            ElseIf namaizin = "TDI" Then
                no = TDI()
            ElseIf namaizin = "HO" Then
                no = HO
            Else
                no = SIUP()
            End If
            Return no
        End Function

#Region " function Izin "

        Private Function IMB() As String
            Dim obj As IMB = session1.GetObjectByKey(Of IMB)(Me.PermohonanIzinID)
            If obj IsNot Nothing Then
                Return obj.NoIjin
            Else
                Return ""
            End If
        End Function

        Private Function Lokasi() As String
            Dim obj As Lokasi = session1.GetObjectByKey(Of Lokasi)(Me.PermohonanIzinID)
            If obj IsNot Nothing Then
                Return obj.NoIzin
            Else
                Return ""
            End If
        End Function

        Private Function IUI() As String
            Dim obj As IUI = session1.GetObjectByKey(Of IUI)(Me.PermohonanIzinID)
            If obj IsNot Nothing Then
                Return obj.NoIzin
            Else
                Return ""
            End If
        End Function

        Private Function IPI() As String
            Dim obj As IPI = session1.GetObjectByKey(Of IPI)(Me.PermohonanIzinID)
            If obj IsNot Nothing Then
                Return obj.NoIzin
            Else
                Return ""
            End If
        End Function

        Private Function TDI() As String
            Dim obj As TDI = session1.GetObjectByKey(Of TDI)(Me.PermohonanIzinID)
            If obj IsNot Nothing Then
                Return obj.NoIzin
            Else
                Return ""
            End If
        End Function

        Private Function HO() As String
            Dim obj As HO = session1.GetObjectByKey(Of HO)(Me.PermohonanIzinID)
            If obj IsNot Nothing Then
                Return obj.NoIzin
            Else
                Return ""
            End If
        End Function

        Private Function SIUP() As String
            Dim obj As SIUP = session1.GetObjectByKey(Of SIUP)(Me.PermohonanIzinID)
            If obj IsNot Nothing Then
                Return obj.NoIjin
            Else
                Return ""
            End If
        End Function

#End Region


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
