Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IUIRetribusi
		Inherits XPLiteObject
		Dim fIUIRetribusiID As Guid
		<Key(true)> _
		Public Property IUIRetribusiID() As Guid
			Get
				Return fIUIRetribusiID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IUIRetribusiID", fIUIRetribusiID, value)
			End Set
		End Property
        Dim fIUIID As IUI
        Public Property IUIID() As IUI
            Get
                Return fIUIID
            End Get
            Set(ByVal value As IUI)
                SetPropertyValue(Of IUI)("IUIID", fIUIID, value)
            End Set
        End Property
		Dim fRetribusi As Decimal
		Public Property Retribusi() As Decimal
			Get
				Return fRetribusi
			End Get
			Set(ByVal value As Decimal)
				SetPropertyValue(Of Decimal)("Retribusi", fRetribusi, value)
			End Set
		End Property
		Dim fDenda As Decimal
		Public Property Denda() As Decimal
			Get
				Return fDenda
			End Get
			Set(ByVal value As Decimal)
				SetPropertyValue(Of Decimal)("Denda", fDenda, value)
			End Set
		End Property
		Dim fJatuhTempo As DateTime
		Public Property JatuhTempo() As DateTime
			Get
				Return fJatuhTempo
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("JatuhTempo", fJatuhTempo, value)
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
