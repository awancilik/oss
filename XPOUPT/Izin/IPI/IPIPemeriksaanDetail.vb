Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IPIPemeriksaanDetail
		Inherits XPLiteObject
		Dim fIPIPemeriksaanDetailID As Guid
		<Key(true)> _
		Public Property IPIPemeriksaanDetailID() As Guid
			Get
				Return fIPIPemeriksaanDetailID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IPIPemeriksaanDetailID", fIPIPemeriksaanDetailID, value)
			End Set
		End Property
        Dim fIPIPemeriksaanID As IPIPemeriksaan
        <Association("IPIPemeriksaan-IPIPemeriksaanDetail")> _
        Public Property IPIPemeriksaanID() As IPIPemeriksaan
            Get
                Return fIPIPemeriksaanID
            End Get
            Set(ByVal value As IPIPemeriksaan)
                SetPropertyValue(Of IPIPemeriksaan)("IPIPemeriksaanID", fIPIPemeriksaanID, value)
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
