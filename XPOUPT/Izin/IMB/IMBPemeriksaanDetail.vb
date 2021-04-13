Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IMBPemeriksaanDetail
		Inherits XPLiteObject
		Dim fIMBPemeriksaanDetailID As Guid
		<Key(true)> _
		Public Property IMBPemeriksaanDetailID() As Guid
			Get
				Return fIMBPemeriksaanDetailID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IMBPemeriksaanDetailID", fIMBPemeriksaanDetailID, value)
			End Set
		End Property
        Dim fIMBPemeriksaanID As IMBPemeriksaan
        <Association("IMBPemeriksaan-IMBPemeriksaanDetail")> _
        Public Property IMBPemeriksaanID() As IMBPemeriksaan
            Get
                Return fIMBPemeriksaanID
            End Get
            Set(ByVal value As IMBPemeriksaan)
                SetPropertyValue(Of IMBPemeriksaan)("IMBPemeriksaanID", fIMBPemeriksaanID, value)
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
        Public ReadOnly Property TimPemeriksaNama() As String
            Get
                Return fTimPemeriksaID.TimPemeriksaNama
            End Get
        End Property

        <NonPersistent()> _
        Public ReadOnly Property TimPemeriksaInstansi() As String
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
