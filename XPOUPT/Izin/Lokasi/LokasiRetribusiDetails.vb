Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class LokasiRetribusiDetails
		Inherits XPLiteObject
		Dim fLokasiRetribusiDetailID As Guid
		<Key(true)> _
		Public Property LokasiRetribusiDetailID() As Guid
			Get
				Return fLokasiRetribusiDetailID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("LokasiRetribusiDetailID", fLokasiRetribusiDetailID, value)
			End Set
		End Property
        Dim fLokasiRetribusiID As LokasiRetribusi
        Public Property LokasiRetribusiID() As LokasiRetribusi
            Get
                Return fLokasiRetribusiID
            End Get
            Set(ByVal value As LokasiRetribusi)
                SetPropertyValue(Of LokasiRetribusi)("LokasiRetribusiID", fLokasiRetribusiID, value)
            End Set
        End Property
		Dim fHDPPT As Decimal
		Public Property HDPPT() As Decimal
			Get
				Return fHDPPT
			End Get
			Set(ByVal value As Decimal)
				SetPropertyValue(Of Decimal)("HDPPT", fHDPPT, value)
			End Set
		End Property
		Dim fIP As Double
		Public Property IP() As Double
			Get
				Return fIP
			End Get
			Set(ByVal value As Double)
				SetPropertyValue(Of Double)("IP", fIP, value)
			End Set
		End Property
		Dim fIU As Double
		Public Property IU() As Double
			Get
				Return fIU
			End Get
			Set(ByVal value As Double)
				SetPropertyValue(Of Double)("IU", fIU, value)
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
