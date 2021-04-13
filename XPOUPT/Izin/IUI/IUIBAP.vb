Imports System
Imports DevExpress.Xpo
Namespace OSS

	Public Class IUIBAP
		Inherits XPLiteObject
		Dim fIUIBAPID As Guid
		<Key(true)> _
		Public Property IUIBAPID() As Guid
			Get
				Return fIUIBAPID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IUIBAPID", fIUIBAPID, value)
			End Set
		End Property
		Dim fPermohonanID As Guid
		Public Property PermohonanID() As Guid
			Get
				Return fPermohonanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("PermohonanID", fPermohonanID, value)
			End Set
		End Property
		Dim fIUIID As Guid
		Public Property IUIID() As Guid
			Get
				Return fIUIID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IUIID", fIUIID, value)
			End Set
		End Property
		Dim fIUIPemeriksaanID As Guid
		Public Property IUIPemeriksaanID() As Guid
			Get
				Return fIUIPemeriksaanID
			End Get
			Set(ByVal value As Guid)
				SetPropertyValue(Of Guid)("IUIPemeriksaanID", fIUIPemeriksaanID, value)
			End Set
		End Property
		Dim fIUIBAPNomor As String
		<Size(50)> _
		Public Property IUIBAPNomor() As String
			Get
				Return fIUIBAPNomor
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("IUIBAPNomor", fIUIBAPNomor, value)
			End Set
		End Property
		Dim fIUIBAPTanggal As DateTime
		Public Property IUIBAPTanggal() As DateTime
			Get
				Return fIUIBAPTanggal
			End Get
			Set(ByVal value As DateTime)
				SetPropertyValue(Of DateTime)("IUIBAPTanggal", fIUIBAPTanggal, value)
			End Set
		End Property
		Dim fIUIBAPCatatan As String
		<Size(250)> _
		Public Property IUIBAPCatatan() As String
			Get
				Return fIUIBAPCatatan
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("IUIBAPCatatan", fIUIBAPCatatan, value)
			End Set
		End Property
		Dim fIUIBAPRekomendasi As String
		<Size(250)> _
		Public Property IUIBAPRekomendasi() As String
			Get
				Return fIUIBAPRekomendasi
			End Get
			Set(ByVal value As String)
				SetPropertyValue(Of String)("IUIBAPRekomendasi", fIUIBAPRekomendasi, value)
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
