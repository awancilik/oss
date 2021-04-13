Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IPTPemeriksaanDetail
		Inherits XPLiteObject
		Dim fIPTPemeriksaanDetailID As Guid
		<Key(true)> _
		Public Property IPTPemeriksaanDetailID() As Guid
			Get
				Return fIPTPemeriksaanDetailID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IPTPemeriksaanDetailID", fIPTPemeriksaanDetailID, value)
			End Set
		End Property
        Dim fIPTPemeriksaanID As IPTPemeriksaan
        <Association("IPTPemeriksaan-IPTPemeriksaanDetail")> _
        Public Property IPTPemeriksaanID() As IPTPemeriksaan
            Get
                Return fIPTPemeriksaanID
            End Get
            Set(ByVal value As IPTPemeriksaan)
                SetPropertyValue(Of IPTPemeriksaan)("IPTPemeriksaanID", fIPTPemeriksaanID, value)
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
