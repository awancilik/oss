Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class BAPIMBDetail
		Inherits XPLiteObject
		Dim fBAPIMBDetailID As Guid
		<Key(true)> _
		Public Property BAPIMBDetailID() As Guid
			Get
				Return fBAPIMBDetailID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("BAPIMBDetailID", fBAPIMBDetailID, value)
			End Set
        End Property

        Dim fBAPIMBID As BAPIMB
        <Association("BAPIMB-BAPIMBDetail")> _
        Public Property BAPIMBID() As BAPIMB
            Get
                Return fBAPIMBID
            End Get
            Set(ByVal value As BAPIMB)
                SetPropertyValue(Of BAPIMB)("BAPIMBID", fBAPIMBID, value)
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

        <NonPersistent()> _
        Public ReadOnly Property NamaPemeriksa() As String
            Get
                Return fTimPemeriksaID.TimPemeriksaNama
            End Get
        End Property

        <NonPersistent()> _
        Public ReadOnly Property InstansiPemeriksa() As String
            Get
                Return fTimPemeriksaID.TimPemeriksaInstansi
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
