Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class HOPemeriksaanDetail
		Inherits XPLiteObject
		Dim fHOPemeriksaanDetailID As Guid
		<Key(true)> _
		Public Property HOPemeriksaanDetailID() As Guid
			Get
				Return fHOPemeriksaanDetailID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("HOPemeriksaanDetailID", fHOPemeriksaanDetailID, value)
			End Set
		End Property
        Dim fHOPemeriksaanID As HOPemeriksaan
        <Association("HOPemeriksaan-HOPemeriksaanDetail")> _
        Public Property HOPemeriksaanID() As HOPemeriksaan
            Get
                Return fHOPemeriksaanID
            End Get
            Set(ByVal value As HOPemeriksaan)
                SetPropertyValue(Of HOPemeriksaan)("HOPemeriksaanID", fHOPemeriksaanID, value)
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
