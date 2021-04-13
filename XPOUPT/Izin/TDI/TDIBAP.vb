Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class TDIBAP
		Inherits XPLiteObject
		Dim fTDIBAPID As Guid
		<Key(true)> _
		Public Property TDIBAPID() As Guid
			Get
				Return fTDIBAPID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("TDIBAPID", fTDIBAPID, value)
			End Set
		End Property
		Dim fTDIID As Guid
		Public Property TDIID() As Guid
			Get
				Return fTDIID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("TDIID", fTDIID, value)
			End Set
		End Property
		Dim fTDIPemeriksaanID As Guid
		Public Property TDIPemeriksaanID() As Guid
			Get
				Return fTDIPemeriksaanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("TDIPemeriksaanID", fTDIPemeriksaanID, value)
			End Set
		End Property
		Dim fTDIBAPNomor As String
		<Size(50)> _
		Public Property TDIBAPNomor() As String
			Get
				Return fTDIBAPNomor
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("TDIBAPNomor", fTDIBAPNomor, value)
			End Set
		End Property
		Dim fTDIBAPTanggal As DateTime
		Public Property TDIBAPTanggal() As DateTime
			Get
				Return fTDIBAPTanggal
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("TDIBAPTanggal", fTDIBAPTanggal, value)
			End Set
		End Property
		Dim fTDIBAPCatatan As String
		<Size(250)> _
		Public Property TDIBAPCatatan() As String
			Get
				Return fTDIBAPCatatan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("TDIBAPCatatan", fTDIBAPCatatan, value)
			End Set
		End Property
		Dim fTDIBAPRekomendasi As String
		<Size(250)> _
		Public Property TDIBAPRekomendasi() As String
			Get
				Return fTDIBAPRekomendasi
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("TDIBAPRekomendasi", fTDIBAPRekomendasi, value)
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
