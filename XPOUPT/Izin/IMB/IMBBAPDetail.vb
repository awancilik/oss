Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IMBBAPDetail
		Inherits XPLiteObject
		Dim fIMBBAPDetailID As Guid
		<Key(true)> _
		Public Property IMBBAPDetailID() As Guid
			Get
				Return fIMBBAPDetailID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IMBBAPDetailID", fIMBBAPDetailID, value)
			End Set
		End Property
        Dim fIMBBAPID As IMBBAP
        <Association("IMBBAP-IMBBAPDetail")> _
        Public Property IMBBAPID() As IMBBAP
            Get
                Return fIMBBAPID
            End Get
            Set(ByVal value As IMBBAP)
                SetPropertyValue(Of IMBBAP)("IMBBAPID", fIMBBAPID, value)
            End Set
        End Property
		Dim fTimPemeriksaID As Guid
		Public Property TimPemeriksaID() As Guid
			Get
				Return fTimPemeriksaID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("TimPemeriksaID", fTimPemeriksaID, value)
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
