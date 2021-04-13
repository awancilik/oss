Imports System
Imports DevExpress.Xpo
Namespace OSS
    Public Structure SyaratView
        '<Persistent("SyaratPermohonanIzinID")> _
        'Public izinid As Izin
        <Persistent("syaratnama")> _
        Public Nama As String
    End Structure
    <Persistent("SyaratpermohonanNama")> _
    Public Class SyaratPermohonanView
        Inherits XPLiteObject
        <Key(), Persistent()> _
        Private Key As SyaratView
        Public ReadOnly Property Nama() As String
            Get
                Return Key.Nama
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
