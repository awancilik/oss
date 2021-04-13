Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IUIPemeriksaanDetail
		Inherits XPLiteObject
		Dim fIUIPemeriksaanDetailID As Guid
		<Key(true)> _
		Public Property IUIPemeriksaanDetailID() As Guid
			Get
				Return fIUIPemeriksaanDetailID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IUIPemeriksaanDetailID", fIUIPemeriksaanDetailID, value)
			End Set
        End Property

        Dim fIUIPemeriksaanID As IUIPemeriksaan
        <Association("IUIPemeriksaan-IUIPemeriksaanDetail")> _
        Public Property IUIPemeriksaanID() As IUIPemeriksaan
            Get
                Return fIUIPemeriksaanID
            End Get
            Set(ByVal value As IUIPemeriksaan)
                SetPropertyValue(Of IUIPemeriksaan)("IUIPemeriksaanID", fIUIPemeriksaanID, value)
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
